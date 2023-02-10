package com.oasis.member.service;

import java.util.List;
import java.util.Map;



public interface MemberStoreService {
	
	List<Map<String, Object>> getStoreList(Map<String, Object> map) throws Exception;//매장목록;
	List<Map<String, Object>> getBookList(Map<String, Object> map) throws Exception;//매장 즐겨찾기 목록;

}


