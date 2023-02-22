package com.oasis.member.service;

import java.util.List;
import java.util.Map;

public interface MyTabService {

	Map<String, Object> myMenuBar(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> myCouponList(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> myOrderList(Map<String, Object> map) throws Exception;

	Map<String, Object> myOrderDetail(Map<String,Object> map) throws Exception;

	Map<String, Object> myStamp(Map<String,Object> map) throws Exception;

}