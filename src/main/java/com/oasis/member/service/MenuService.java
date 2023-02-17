package com.oasis.member.service;

import java.util.List;
import java.util.Map;

public interface MenuService {

	List<Map<String, Object>> menuList(Map<String, Object> map) throws Exception;
	Map<String,Object> menuDetail(Map<String,Object> map) throws Exception;
	public void insertCart(Map<String,Object> map) throws Exception;
	List<Map<String, Object>> cartList(Map<String, Object> map) throws Exception;
} 

	
