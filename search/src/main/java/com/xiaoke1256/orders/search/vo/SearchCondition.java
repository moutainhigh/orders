package com.xiaoke1256.orders.search.vo;

import java.io.Serializable;
import java.util.Map;

public class SearchCondition implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String SearchName;
	
	private Map<String,Boolean> orderBy;
	
	private int pageNo;
	
	private int pageSize;

	public String getSearchName() {
		return SearchName;
	}

	public void setSearchName(String searchName) {
		SearchName = searchName;
	}

	public Map<String, Boolean> getOrderBy() {
		return orderBy;
	}

	public void setOrderBy(Map<String, Boolean> orderBy) {
		this.orderBy = orderBy;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	
	

}