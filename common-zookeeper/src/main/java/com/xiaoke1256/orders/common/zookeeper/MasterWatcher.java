package com.xiaoke1256.orders.common.zookeeper;

import java.util.Random;

import org.apache.zookeeper.CreateMode;
import org.apache.zookeeper.KeeperException;
import org.apache.zookeeper.ZooDefs.Ids;
import org.apache.zookeeper.data.Stat;

/**
 * ѡ��ΪȺ����zookeeper����
 * @author Administrator
 *
 */
public abstract class MasterWatcher extends BaseWatcher {
	
	private volatile Boolean isMaster;
	
	private String serverId = Integer.toHexString(new Random().nextInt());
	
	/**�ɾ����ʱ��������֪�ڵ��·��*/
	abstract protected String getNodePath();
	
	public synchronized boolean toBeMast() throws InterruptedException {
		isMaster = null;
		while(true) {
			try {
				this.zooKeeper.create(getNodePath(), serverId.getBytes(),Ids.OPEN_ACL_UNSAFE, CreateMode.EPHEMERAL);
				isMaster = true;
				return isMaster;
			} catch (KeeperException e) {
				switch (e.code()) {
				case NODEEXISTS:
					if(checkMaster(getNodePath()))
						return isMaster;
				default:
					//�����쳣����ConnectLossException��
					if(checkMaster(getNodePath()))
						return isMaster;
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
	private boolean checkMaster(String nodePath) throws InterruptedException {
		while(true) {
			try {
				Stat stat = new Stat();
				byte[] data = zooKeeper.getData(nodePath, false, stat);
				isMaster = new String(data).equals(serverId);
				return true;
			} catch (KeeperException e) {
				switch (e.code()) {
				case NONODE:
					return false;
				default:
					//�����쳣����ConnectLossException��. Read it again.
				}
			}
		}
			
		
	}
}
