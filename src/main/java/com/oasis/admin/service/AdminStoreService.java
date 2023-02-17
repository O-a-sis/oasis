package com.oasis.admin.service;


import java.util.List;
import java.util.Map;


public interface AdminStoreService {

	
	List<Map<String, Object>> storeList(Map<String, Object> map) throws Exception; 

	void storeJoin(Map<String, Object> map) throws Exception; 

	void storeDown(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> storeListRank(Map<String, Object> map) throws Exception;


	List<Map<String, Object>> storeSumRank(Map<String, Object> map) throws Exception;
	
	public int storeUpdate(Map<String, Object> map) throws Exception;

	Map<String, Object> storeDetail(Map<String, Object> map) throws Exception;
	
	int getNameCheck(String email) throws Exception;


	List<Map<String, Object>> memberList(Map<String, Object> map) throws Exception;

	
	 	
}	