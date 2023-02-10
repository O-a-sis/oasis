package com.oasis.store.service;

import java.util.List;
import java.util.Map;

public interface StoreService {
	
	public Map<String, Object> getStore(Map<String, Object> map) throws Exception;
	
	public List<Map<String, Object>> getOrders(Map<String, Object> map) throws Exception;
	
	public int getStoreStatus(Map<String, Object> map) throws Exception;
	
	public int openStore(Map<String, Object> map) throws Exception;

	public int closeStore(Map<String, Object> map) throws Exception;
	
	public List<Map<String, Object>> getOrdersList(Map<String, Object> map) throws Exception;
	
	public List<Map<String, Object>> getOrdersListByStatus(Map<String, Object> map) throws Exception;
	
	public int updateOrder(Map<String, Object> map) throws Exception;
	
	public int updateProcessingOrder(Map<String, Object> map) throws Exception;
	
	public Map<String, Object> getOrderDetail(String oidx) throws Exception;
	
	public List<Map<String, Object>> getStockList(Map<String, Object> map) throws Exception;
	
	public int updateStock(Map<String, Object> map) throws Exception;
	
	public List<Map<String, Object>> getNoticeList(Map<String, Object> map) throws Exception;
	
	public Map<String, Object> getNoticeDetail(Map<String, Object> map) throws Exception;
	
	public List<Map<String, Object>> getOrdersAllList(Map<String, Object> map) throws Exception;
	
	

}
