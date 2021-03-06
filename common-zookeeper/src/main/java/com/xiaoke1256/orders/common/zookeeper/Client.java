package com.xiaoke1256.orders.common.zookeeper;

import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.apache.zookeeper.AsyncCallback.DataCallback;
import org.apache.zookeeper.AsyncCallback.StatCallback;
import org.apache.zookeeper.AsyncCallback.StringCallback;
import org.apache.zookeeper.CreateMode;
import org.apache.zookeeper.KeeperException;
import org.apache.zookeeper.KeeperException.Code;

import org.apache.zookeeper.Op;
import org.apache.zookeeper.Watcher.Event.EventType;
import org.apache.zookeeper.Watcher;
import org.apache.zookeeper.ZooDefs.Ids;
import org.apache.zookeeper.data.Stat;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class Client extends BaseWatcher {
	private static final Logger logger = LoggerFactory.getLogger(Client.class);
	
	private String baseNodePath;
	
	/**
	 * Construct
	 * @param baseNodePath
	 */
	public Client(String baseNodePath) {
		super();
		this.baseNodePath = baseNodePath;
	}

	public void submitTask(String task) {
		TaskObject taskCtx = new TaskObject();
		submitTask(task,taskCtx);
	}
	private void submitTask(String task,TaskObject taskCtx) {
		taskCtx.setTask(task);
		zooKeeper.create(baseNodePath+"/tasks/task-", task.getBytes(),Ids.OPEN_ACL_UNSAFE,
				CreateMode.PERSISTENT_SEQUENTIAL,createTaskCallback,taskCtx);
		logger.debug("task business params :"+task);
	}
	
	private StringCallback createTaskCallback = new StringCallback() {

		@Override
		public void processResult(int rc, String path, Object ctx, String name) {
			switch(Code.get(rc)) {
			case CONNECTIONLOSS:
				try {
					Thread.sleep(200);
				} catch (InterruptedException e1) {
					logger.error(e1.getMessage(),e1);
				}//给CPU以喘息的机会
				submitTask(((TaskObject)ctx).getTask(),(TaskObject)ctx);
				break;
			case OK:
				((TaskObject)ctx).setTaskName(name.substring(name.lastIndexOf("/")+1));
				logger.debug("My create task name: {}",name);
				//任务一旦创建，就开始监控任务状态。
				watchStatus(baseNodePath+"/status/"+name.replace(baseNodePath+"/tasks/", ""),(TaskObject)ctx);
				break;
			default:
				logger.error("Submit task fail: ",KeeperException.create(Code.get(rc),path));
			}
		}
		
	};
	
	/**
	 * 用于保存现有的任务
	 */
	private Map<String,TaskObject> ctxMap = new ConcurrentHashMap<>();

	
	private void watchStatus(String path, TaskObject ctx) {
		ctxMap.put(path, ctx);//ctx 实际上是个 TaskObject.
		zooKeeper.exists(path, statusWatcher,existCallback,ctx);
	}
	
	private DataCallback getStatusDataCallback = (int rc, String path, Object ctx, byte[] data, Stat stat) -> {
		switch(Code.get(rc)) {
		case CONNECTIONLOSS:
			logger.warn("Connection loss !");
			try {
				Thread.sleep(200);
			} catch (InterruptedException e1) {
				logger.error(e1.getMessage(),e1);
			}//给CPU以喘息的机会
			getStatusData(path,ctx);
			break;
		case OK:
			try {
				deleteFinishedTask((TaskObject)ctx,data);
			} catch (InterruptedException e) {
				logger.error(e.getMessage(),e);
			}
			break;
		case NONODE:
			//节点没有是异常情况。
			logger.error("Something wrong has happen: the node disapeared!");
		default:
			logger.error("Something wrong has happen.",KeeperException.create(Code.get(rc),path));
		}
		
		
	};
	
	private Watcher statusWatcher = (event) -> {
		if(EventType.NodeCreated.equals(event.getType())
				|| EventType.NodeDataChanged.equals(event.getType())) {
			assert event.getPath().contains("/status/task-");
			this.getStatusData(event.getPath(),ctxMap.get(event.getPath()));
		} 
		
	};
	
	private StatCallback existCallback = (int rc,String path,Object ctx,Stat stat)->{
		try {
			switch (Code.get(rc)) {
			case CONNECTIONLOSS:
				logger.warn("Connection loss !");
				Thread.sleep(200);//给CPU以喘息的机会
				watchStatus(path,(TaskObject)ctx);
				break;
			case OK:
				if(stat != null) {//节点存在
					getStatusData(path,ctx);
				}
				break;
			case NONODE:
				//节点没有是常见情况。
				break;
			default:
				logger.error("Something wrong has happen: ",KeeperException.create(Code.get(rc),path));
			}
		}catch (InterruptedException e) {
			throw new RuntimeException(e);
		}
	};
	
	private void getStatusData(String path, Object ctx)  {
		logger.debug("status data exist. path: {}",path);
		zooKeeper.getData(path, false, getStatusDataCallback,ctx);
	}
	
	/**
	 * 任务结束删除相关节点
	 * @param taskObject
	 * @param data
	 * @throws InterruptedException
	 */
	private void deleteFinishedTask(TaskObject taskObject,byte[] data) throws InterruptedException {
		String content = new String(data).trim();
		//如果任务状态标记为 done by woker-serverId 则继续处理.
		if(!content.startsWith("done by"))
			return;
		
		while(true) {
			try {
				String taskName = taskObject.getTaskName();
				String workName = content.replace("done by", "").trim();
				//完成以下事情： 1、删 除 /assign/work-?/ 下对应节点。2、删除任务状态节点。
				String assignPath = baseNodePath + "/assign/"+workName+"/"+taskName;
				String statusPath = baseNodePath + "/status/"+taskName;
				logger.debug("statusPath:"+statusPath);
				TaskObject taskObj = ctxMap.remove(statusPath);
				if(taskObj==null)
					logger.warn("delete task in ctxMap is not success!");
				zooKeeper.multi(Arrays.asList(Op.delete(assignPath, -1)
						,Op.delete(statusPath, -1)));
				return;
			} catch (KeeperException e) {
				switch (e.code()) {
				case NONODE:
					//说明有其他节点已经帮他处理掉了。
					logger.error("the node has been deleted!");
					//如果发生这种情况说明系统有错误。
					throw new RuntimeException("the task node has been deleted! node name is : "+e.getPath(),e)   ;
				default:
					//其他异常（含ConnectLossException）。
					logger.warn("Something wrong has happen when delete finished task. ",e);
					//继续循环
				}
			}
			Thread.sleep(200);//给CPU以喘息的机会
		}
	}
	
	/**
	 * 所有的任务是否已完成？
	 * @return
	 * @throws InterruptedException
	 */
	public boolean isAllFinished() throws InterruptedException {
		while(true) {
			try {
				List<String> list = zooKeeper.getChildren(baseNodePath+"/tasks", false);
				if(!list.isEmpty()) {
					logger.info("some task is not be assiged!");
					return false;
				}
				logger.debug("ctxMap.keys:"+ctxMap.keySet());
				return ctxMap.isEmpty();
			} catch (KeeperException e) {
				switch(e.code()){
				case SESSIONEXPIRED:
					//session 过期则作为异常抛出，等待下一个调度周期再恢复session。
					throw new RuntimeException(e);
				default:
					//发生其他异常就继续循环
					logger.warn("Something wrong has happen when check task finished . ",e);
				}
			} 
			Thread.sleep(200);//给CPU以喘息的机会
		}
	}

	@Override
	protected void reboot() {
		//do nothing.
	}
}
