package com.oasis.store.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;
import com.oasis.common.dao.AbstractDAO;

@Repository("storeDAO")
public class StoreDAO extends AbstractDAO {
	
	public Map<String, Object> getStore(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("store.getStore", map);
	}

	public List<Map<String, Object>> getOrders(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("store.getOrders", map);
	}
	
	public int getStoreStatus(Map<String, Object> map) throws Exception {
		return (int) selectOne("store.getStoreStatus", map);
	}
	
	public int openStore(Map<String, Object> map) throws Exception {
		return (int) update("store.openStore", map);
	}
	
	public int closeStore(Map<String, Object> map) throws Exception {
		return (int) update("store.closeStore", map);
	}
	
	public List<Map<String, Object>> getOrdersList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("store.getOrdersList", map);
	}
	
	public List<Map<String, Object>> getOrdersListByStatus(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("store.getOrdersListByStatus", map);
	}
	
	public List<Map<String, Object>> getAlarm(int store) throws Exception {
		return (List<Map<String, Object>>) selectList("store.getAlarm", store);
	}
	public List<Map<String, Object>> getWaitingOrders(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("store.getWaitingOrders", map);
	}
	
	public int updateOrder(Map<String, Object> map) throws Exception {
		return (int) update("store.updateOrder", map);
	}
	
	public int updateOrderAlarm(Map<String, Object> map) throws Exception {
		return (int) update("store.updateOrderAlarm", map);
	}

	public int updateProcessingOrder(Map<String, Object> map) throws Exception {
		return (int) update("store.updateProcessingOrder", map);
	}
	
	public int updateProcessingOrderAlarm(Map<String, Object> map) throws Exception {
		return (int) update("store.updateProcessingOrderAlarm", map);
	}

	public Map<String, Object> getOrderDetail(String oidx) throws Exception {
		return (Map<String, Object>) selectOne("store.getOrderDetail", oidx);
	}
	
	public List<Map<String, Object>> getStockList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("store.getStockList", map);
	}
	
	public int updateStock(Map<String, Object> map) throws Exception {
		return (int) update("store.updateStock", map);
	}
	
	public List<Map<String, Object>> getNoticeList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("store.getNoticeList", map);
	}
	
	public Map<String, Object> getNoticeDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("store.getNoticeDetail", map);
	}
	
	public List<Map<String, Object>> getOrdersAllList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("store.getOrdersAllList", map);
	}
	
	
	
}
