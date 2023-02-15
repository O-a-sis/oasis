package com.oasis.admin.service;


import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.oasis.admin.dao.AdminStoreDAO;

import lombok.AllArgsConstructor;

@Service("adminStoreService")
@AllArgsConstructor
public class AdminStoreServiceImpl implements AdminStoreService{
	
	private AdminStoreDAO adminStoreDAO;
	
	
	/* 관리자 지점 리스트 (+매출) */
	@Override
	public List<Map<String, Object>> storeList(Map<String, Object> map) throws Exception {
		return adminStoreDAO.storeList(map);
	}
	
	@Override
	public List<Map<String, Object>> storeListRank(Map<String, Object> map) throws Exception {
		return adminStoreDAO.storeListRank(map);
	}
	
	@Override
	public List<Map<String, Object>> storeSumRank(Map<String, Object> map) throws Exception {
		return adminStoreDAO.storeSumRank(map);
	}



	@Override
	public void storeJoin(Map<String, Object> map) throws Exception {
		adminStoreDAO.storeJoin(map);
		
	}


	@Override
	public Map<String, Object> storeDetail(Map<String, Object> map) throws Exception {
		return adminStoreDAO.storeDetail(map);
	}
	

	@Override
	public void storeDown(Map<String, Object> map) throws Exception {
		adminStoreDAO.storeDown(map);
		
	}
	
	@Override
	public int storeUpdate(Map<String, Object> map) throws Exception {
		return adminStoreDAO.update(map);
	}
	

}
