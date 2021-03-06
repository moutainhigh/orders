package com.xiaoke1256.orders.core.service;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xiaoke1256.common.utils.RedisUtils;
import com.xiaoke1256.orders.core.bo.OStorage;

import redis.clients.jedis.Jedis;

@Service
@Transactional
public class ProductService {
	@PersistenceContext(unitName="default")
	private EntityManager entityManager ;

	/**
	 * @deprecated 是否支持秒杀要调用product 应用的东西。
	 * @param productCode
	 */
	public void openSecKill(String productCode) {
		Jedis conn = RedisUtils.connect();
		OStorage product = entityManager.find(OStorage.class, productCode);
//		if("1".equals(product.getInSeckill())) {
//			//has open?
//			return;
//		}
		
		if(product.getStockNum()<100) {
			throw new RuntimeException(""+product.getProductCode()+"的库存不足,库存需大于100份才可支持秒杀活动。");
		}
		
		
		RedisUtils.set(conn, "SecKill_P_"+product.getProductCode(), String.valueOf(product.getStockNum()));
		
		//product.setInSeckill("1");
		entityManager.merge(product);
		conn.close();
	}
	
	/**
	 * @deprecated 是否支持秒杀要调用product 应用的东西。
	 * @param productCode
	 */
	public void closeSecKill(String productCode) {
		OStorage product = entityManager.find(OStorage.class, productCode);
		
		Jedis conn = RedisUtils.connect();
		RedisUtils.del(conn, "SecKill_P_"+product.getProductCode());
		
		//product.setInSeckill("0");
		entityManager.merge(product);
		conn.close();
	}
	
	/**
	 * @deprecated 是否支持秒杀要调用product 应用的东西。
	 * 是否正在进行秒杀活动
	 * @return
	 */
	public boolean isInSecKill(String productCode) {
		return true;
	}
}
