package com.xiaoke1256.orders.common.zookeeper;

import java.util.Random;

import org.apache.zookeeper.CreateMode;
import org.apache.zookeeper.KeeperException;
import org.apache.zookeeper.WatchedEvent;
import org.apache.zookeeper.Watcher;
import org.apache.zookeeper.Watcher.Event.EventType;
import org.apache.zookeeper.ZooDefs.Ids;
import org.apache.zookeeper.data.Stat;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 选举为群主的zookeeper主节点
 * @author TangJun
 *
 */
public class MasterWatcher extends BaseWatcher {
	
	@SuppressWarnings("unused")
	private static final Logger logger = LoggerFactory.getLogger(MasterWatcher.class);
	
	private volatile Boolean isMaster;
	
	private String serverId = Integer.toHexString(new Random().nextInt());
	

	
	protected String baseNodePath;

	
	public MasterWatcher(String baseNodePath) {
		super();
		this.baseNodePath = baseNodePath;
	}
	
	/**
	 * init
	 * @throws InterruptedException
	 */
	protected void bootstrap() throws InterruptedException{
		//留给子类实现。
	}
	
	/**
	 * 竞选成为主节点
	 * @param needWorker 是否需要从节点
	 * @return
	 * @throws InterruptedException
	 */
	public synchronized boolean toBeMast() throws InterruptedException {
		isMaster = null;
		String nodePath = baseNodePath+"/master";
		while(true) {
			try {
				this.zooKeeper.create(nodePath, serverId.getBytes(),Ids.OPEN_ACL_UNSAFE, CreateMode.EPHEMERAL);
				isMaster = true;
				bootstrap();
				return isMaster;
			} catch (KeeperException e) {
				switch (e.code()) {
				case NODEEXISTS:
					if(checkMaster(nodePath)) {
						if(isMaster) {
							bootstrap();
						}
						return isMaster;
					}
				default:
					//其他异常（含ConnectLossException）。
					if(checkMaster(nodePath)) {
						if(isMaster) {
							bootstrap();
						}
						return isMaster;
					}
				}
			}
		}
	}
	
	/**
	 * Check if the note has created.
	 * @param nodePath
	 * @return success or not
	 * @throws InterruptedException
	 */
	protected boolean checkMaster(String nodePath) throws InterruptedException {
		while(true) {
			try {
				Stat stat = new Stat();
				byte[] data = zooKeeper.getData(nodePath, masterLostWater, stat);
				isMaster = new String(data).equals(serverId);
				return true;
			} catch (KeeperException e) {
				switch (e.code()) {
				case NONODE:
					return false;
				default:
					//其他异常（含ConnectLossException）. Read it again.TODO 需打日志。
				}
			}
		}	
	}
	private Watcher masterLostWater = new Watcher() {

		@Override
		public void process(WatchedEvent event) {
			if(EventType.NodeDeleted.equals(event.getType())) {
				assert (baseNodePath+"/master").equals(event.getPath());
				try {
					toBeMast();
				} catch (InterruptedException e) {
					logger.error("I can not to be the master. ",e);
				}
			}
		}
		
	};
}
