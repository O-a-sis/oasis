package com.oasis.store.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.oasis.store.dao.StoreDAO;

import lombok.AllArgsConstructor;

@Service("storeService")
@AllArgsConstructor
public class StoreServiceImpl implements StoreService {
	
	private StoreDAO storeDAO;

	@Override
	public Map<String, Object> getStore(Map<String, Object> map) throws Exception {
		return storeDAO.getStore(map);
	}

	@Override
	public List<Map<String, Object>> getOrders(Map<String, Object> map) throws Exception {
		return storeDAO.getOrders(map);
	}
	
	@Override
	public int getStoreStatus(Map<String, Object> map) throws Exception {
		return storeDAO.getStoreStatus(map);
	}

	@Override
	public int openStore(Map<String, Object> map) throws Exception {
		return storeDAO.openStore(map);
	}

	@Override
	public int closeStore(Map<String, Object> map) throws Exception {
		return storeDAO.closeStore(map);
	}
	
	@Override
	public List<Map<String, Object>> getOrdersList(Map<String, Object> map) throws Exception {
		return storeDAO.getOrdersList(map);
	}
	
	@Override
	public List<Map<String, Object>> getOrdersListByStatus(Map<String, Object> map) throws Exception {
		return storeDAO.getOrdersListByStatus(map);
	}
	
	@Override
	public List<Map<String, Object>> getAlarm(int store) throws Exception {
		return storeDAO.getAlarm(store);
	}

	@Override
	public List<Map<String, Object>> getWaitingOrders(Map<String, Object> map) throws Exception {
		return storeDAO.getWaitingOrders(map);
	}

	@Override
	public int updateOrder(Map<String, Object> map) throws Exception {
		return storeDAO.updateOrder(map);
	}
	
	@Override
	public int updateOrderAlarm(Map<String, Object> map) throws Exception {
		return storeDAO.updateOrderAlarm(map);
	}

	@Override
	public List<Map<String, Object>> getProcessingOrders(Map<String, Object> map) throws Exception {
		return storeDAO.getProcessingOrders(map);
	}

	@Override
	public int updateProcessingOrder(Map<String, Object> map) throws Exception {
		return storeDAO.updateProcessingOrder(map);
	}
	
	@Override
	public int updateProcessingOrderAlarm(Map<String, Object> map) throws Exception {
		return storeDAO.updateProcessingOrderAlarm(map);
	}

	@Override
	public List<Map<String, Object>> getCompletedOrders(Map<String, Object> map) throws Exception {
		return storeDAO.getCompletedOrders(map);
	}

	@Override
	public Map<String, Object> getOrderDetail(String oidx) throws Exception {
		return storeDAO.getOrderDetail(oidx);
	}

	@Override
	public List<Map<String, Object>> getStockList(Map<String, Object> map) throws Exception {
		return storeDAO.getStockList(map);
	}

	@Override
	public int updateStock(Map<String, Object> map) throws Exception {
		return storeDAO.updateStock(map);
	}

	@Override
	public List<Map<String, Object>> getNoticeList(Map<String, Object> map) throws Exception {
		return storeDAO.getNoticeList(map);
	}

	@Override
	public Map<String, Object> getNoticeDetail(Map<String, Object> map) throws Exception {
		return storeDAO.getNoticeDetail(map);
	}

	@Override
	public List<Map<String, Object>> getOrdersAllList(Map<String, Object> map) throws Exception {
		return storeDAO.getOrdersAllList(map);
	}





}
