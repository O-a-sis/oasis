package com.oasis.store.dao;


import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.oasis.common.dao.AbstractDAO;


@Repository("StoreDAO")
public class StoreDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectStoreList(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("store.selectStoreList", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> storeDetail(Map<String, Object> map) {
		return (Map<String, Object>)selectOne("store.storeDetail", map);
	}
	
	
	
}