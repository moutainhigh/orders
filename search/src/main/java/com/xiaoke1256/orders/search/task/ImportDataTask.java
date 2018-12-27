package com.xiaoke1256.orders.search.task;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xiaoke1256.orders.search.service.EsCollectService;

@Service
public class ImportDataTask {
	private static final Logger logger = LoggerFactory.getLogger(ImportDataTask.class);
	
	@Autowired
	private EsCollectService esCollectService;
	
	@Autowired
	private ZookeeperWatcher zookeeperWatcher;
	
	public void collectProduct() {
		try {
			if(zookeeperWatcher.toBeMast("/zookeeper/search/master")) {
				logger.info("I'm the master. start collect.");
				esCollectService.collectProduct();
				logger.info("end of collect.");
			}else {
				logger.debug("I'm not master. Do nothing. ");
			}
		} catch (InterruptedException e) {
			logger.error(e.getMessage(), e);
		}
	}
}
