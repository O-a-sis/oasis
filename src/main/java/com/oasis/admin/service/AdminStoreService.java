package com.oasis.admin.service;


import java.util.List;
import java.util.Map;


public interface AdminStoreService {

	
	List<Map<String, Object>> storeList(Map<String, Object> map) throws Exception; 

	void storeJoin(Map<String, Object> map) throws Exception; 

	Map<String, Object> storeDetail(Map<String, Object> map) throws Exception; 

	void storeUpdate(Map<String, Object> map) throws Exception; 

	void storeDown(Map<String, Object> map) throws Exception; 
	
	 
	
}
