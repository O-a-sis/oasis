package com.oasis.store.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;
<<<<<<< HEAD

=======
>>>>>>> 795bd4b (no message)
import com.oasis.common.dao.AbstractDAO;

@Repository("storeDAO")
public class StoreDAO extends AbstractDAO {
	
	public Map<String, Object> getStore(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("store.getStore", map);
	}

	public List<Map<String, Object>> getOrders(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("store.getOrders", map);
	}
	
<<<<<<< HEAD
	public int getStoreStatus(Map<String, Object> map) throws Exception {
		return (int) selectOne("store.getStoreStatus", map);
	}
	
=======
>>>>>>> 795bd4b (no message)
	public int openStore(Map<String, Object> map) throws Exception {
		return (int) update("store.openStore", map);
	}
	
<<<<<<< HEAD
	public int openRevenue(Map<String, Object> map) throws Exception {
		return (int) insert("store.openRevenue", map);
	}
	
=======
>>>>>>> 795bd4b (no message)
	public int closeStore(Map<String, Object> map) throws Exception {
		return (int) update("store.closeStore", map);
	}
	
<<<<<<< HEAD
	public int closeRevenue(Map<String, Object> map) throws Exception {
		return (int) update("store.closeRevenue", map);
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
=======
>>>>>>> 795bd4b (no message)
	public List<Map<String, Object>> getWaitingOrders(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("store.getWaitingOrders", map);
	}
	
	public int updateOrder(Map<String, Object> map) throws Exception {
		return (int) update("store.updateOrder", map);
	}
	
<<<<<<< HEAD
	public int updateOrderAlarm(Map<String, Object> map) throws Exception {
		return (int) update("store.updateOrderAlarm", map);
	}

=======
	public List<Map<String, Object>> getProcessingOrders(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("store.getProcessingOrders", map);
	}
	
>>>>>>> 795bd4b (no message)
	public int updateProcessingOrder(Map<String, Object> map) throws Exception {
		return (int) update("store.updateProcessingOrder", map);
	}
	
<<<<<<< HEAD
	public int updateProcessingOrderAlarm(Map<String, Object> map) throws Exception {
		return (int) update("store.updateProcessingOrderAlarm", map);
	}

	public Map<String, Object> getOrderDetail(String oidx) throws Exception {
=======
	public List<Map<String, Object>> getCompletedOrders(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("store.getCompletedOrders", map);
	}
	
	public Map<String, Object> getOrderDetail(int oidx) throws Exception {
>>>>>>> 795bd4b (no message)
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
	
<<<<<<< HEAD
	public List<Map<String, Object>> getOrdersAllList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("store.getOrdersAllList", map);
	}
	
	
	
=======
>>>>>>> 795bd4b (no message)
}
