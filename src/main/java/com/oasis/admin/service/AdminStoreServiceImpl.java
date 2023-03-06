package com.oasis.admin.service;


import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oasis.admin.dao.AdminStoreDAO;
import com.oasis.member.dao.MenuDAO;

import lombok.AllArgsConstructor;

@Service("adminStoreService")
@AllArgsConstructor
public class AdminStoreServiceImpl implements AdminStoreService{
	
	private AdminStoreDAO adminStoreDAO;
	private MenuDAO menuDAO;
	
	
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
		String[] typeArr = String.valueOf(map.get("type")).split("");
		map.put("typeArr", typeArr);

		return adminStoreDAO.storeSumRank(map);
	}


	@Transactional
	@Override
	public void storeJoin(Map<String, Object> map) throws Exception {
		adminStoreDAO.storeJoin(map);
		System.out.println(map);
		List<Map<String, Object>> productList = menuDAO.productList(map);
		for (Map<String, Object> product : productList) {
			map.put("P_IDX", product.get("P_IDX"));
			adminStoreDAO.insertStatus(map);
		}
	}


	@Override
	public Map<String, Object> storeDetail(Map<String, Object> map) throws Exception {
		Map<String, Object> store = adminStoreDAO.storeDetail(map);
		store.put("YSum", adminStoreDAO.getYSum(map));
		store.put("MAvg", adminStoreDAO.getMAvg(map));
		store.put("RList", adminStoreDAO.revenueList(map));
	
		return store;
	}
	

	@Override
	public void storeDown(Map<String, Object> map) throws Exception {
		adminStoreDAO.storeDown(map);
		
	}

	@Override
	public int storeUpdate(Map<String, Object> map) throws Exception {
		return adminStoreDAO.update(map);
	}
	
	
	
	@Override
	public int getNameCheck(String email) throws Exception {
		return adminStoreDAO.getNameCheck(email);
	}


	
	@Override
	public List<Map<String, Object>> memberList(Map<String, Object> map) throws Exception {
		return adminStoreDAO.memberList(map);
	}
	
}
