package com.xiaoke1256.orders.thirdpayplatform.service;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.RandomUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xiaoke1256.orders.common.util.DateUtil;
import com.xiaoke1256.orders.thirdpayplatform.bo.ThirdPayOrder;

@Service
@Transactional
public class ThirdPayService {
	
	@PersistenceContext(unitName="default")
	private EntityManager entityManager ;
	
	/**
	 * 支付
	 * @param payerNo
	 * @param payeeNo
	 * @param amt
	 * @param orderType
	 * @param remark
	 * @return
	 */
	public ThirdPayOrder pay(String payerNo,String payeeNo,BigDecimal amt,String orderType, String remark) {
		ThirdPayOrder order = new ThirdPayOrder();
		order.setOrderNo(genOrderNo());
		order.setPayerNo(payerNo);
		order.setPayeeNo(payeeNo);
		order.setOrderType(orderType);
		order.setAmt(amt);
		order.setRemark(remark);
		order.setInsertTime(new Timestamp(System.currentTimeMillis()));
		order.setUpdateTime(new Timestamp(System.currentTimeMillis()));
		entityManager.persist(order);
		return order;
	}
	
	/**
	 * 订单处理成功
	 * @param orderNo
	 */
	public void success(String orderNo) {
		ThirdPayOrder order = this.getByOrderNo(orderNo);
		order.setOrderStatus(ThirdPayOrder.STATUS_SUCCESS);
		order.setFinishTime(new Timestamp(System.currentTimeMillis()));
		order.setUpdateTime(new Timestamp(System.currentTimeMillis()));
		entityManager.merge(order);
	}
	
	/**
	 * 订单处理失败
	 * @param orderNo
	 */
	public void fail(String orderNo) {
		ThirdPayOrder order = this.getByOrderNo(orderNo);
		order.setOrderStatus(ThirdPayOrder.STATUS_FAIL);
		order.setFinishTime(new Timestamp(System.currentTimeMillis()));
		order.setUpdateTime(new Timestamp(System.currentTimeMillis()));
		entityManager.merge(order);
	}
	
	/**
	 * 生成订单号
	 * 订单号规则:年月日时分秒+6位流水号。
	 * @param subOrder
	 * @return
	 */
	private String genOrderNo() {
		return DateUtil.format(new Date(), "YYYYMMddHHmmss")
				+StringUtils.leftPad(String.valueOf(RandomUtils.nextInt(1000000)),6);
	}
	
	/**
	 * 根据订单号获取订单。
	 * @param orderNo
	 * @return
	 */
	@Transactional(readOnly=true)
	public ThirdPayOrder getByOrderNo(String orderNo) {
		String jql = "from ThirdPayOrder where orderNo = :orderNo";
		return (ThirdPayOrder)entityManager.createQuery(jql).setParameter("orderNo", orderNo).getSingleResult();
	}
	
	/**
	 * 查出超时的订单
	 * @return 订单号列表
	 */
	@Transactional(readOnly=true)
	public List<String> queryExired(int limit) {
		String jql = "select o.orderNo from ThirdPayOrder o where orderStatus=:orderStatus and insertTime order by orderId";
		Query query = entityManager.createQuery(jql)
			.setParameter("orderStatus", ThirdPayOrder.STATUS_ACCEPT);
		if(limit>0) {
			query.setMaxResults(limit);
		}
		@SuppressWarnings("unchecked")
		List<String> result = query.getResultList();
		return result;
	}
	
	public void expired(String orderNo) {
		//修改订单状态
		//接入平台方提供的接口地址。通知其超时。
		//若调用不成功则重复10次。
		//再失败则标记为需人工处理，打印日志。
	}
}
