package com.oasis.admin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.oasis.common.dao.AbstractDAO;

@Repository("adminStoreDAO")
public class AdminStoreDAO extends AbstractDAO{
	

	/* 관리자 지점 리스트 (+매출) */ 
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> storeList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("admin.storeList", map);
		}
	
	public List<Map<String, Object>> storeListRank(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("admin.storeListRank", map);
		}

	public void storeJoin(Map<String, Object> map) {
		insert("admin.storeJoin", map);
		
	}

	public Map<String, Object> storeDetail(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("admin.storeDetail", map);
	}

	public void storeUpdate(Map<String, Object> map) {
		update("admin.storeUpdate", map);
		
	}

	public void storeDown(Map<String, Object> map) {
		update("admin.storeDown", map);
		
	}



}




	

