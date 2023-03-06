package com.oasis.member.service;

import java.util.List;
import java.util.Map;

public interface MenuService {

	List<Map<String, Object>> menuList(Map<String, Object> map) throws Exception;
	List<Map<String, Object>> mainmenuList(Map<String, Object> map) throws Exception;
	Map<String,Object> menuDetail(Map<String,Object> map) throws Exception;
	public int insertCart(Map<String,Object> map) throws Exception;
	List<Map<String, Object>> cartList(Map<String, Object> map) throws Exception;
	public int insertMenu(Map<String, Object> map) throws Exception;
	public int menuUpdate(Map<String, Object> map) throws Exception;
	public void productDelete(Map<String, Object> map) throws Exception; 
	public int cartDeleteAll(Map<String,Object> map) throws Exception;
	public int cartDelete(Map<String,Object> map) throws Exception;
	public List<Map<String, Object>> productList(Map<String, Object> map) throws Exception;
} 

	
