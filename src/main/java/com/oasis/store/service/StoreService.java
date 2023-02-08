package com.oasis.store.service;

import java.util.List;
import java.util.Map;



public interface StoreService {
	

	Map<String, Object> StoreDetail(Map<String, Object> map) throws Exception;  //매장 상세보기



	List<Map<String, Object>> selectStoreList(Map<String, Object> map) throws Exception;//매장목록;



	

	}


