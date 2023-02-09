package com.oasis.member.service;

import java.util.List;
import java.util.Map;



public interface MemberStoreService {
	


	List<Map<String, Object>> selectStoreList(Map<String, Object> map) throws Exception;//매장목록;



	Map<String, Object> MemberStoreDetail(Map<String, Object> map) throws Exception;



	

	}


