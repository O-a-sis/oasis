package com.oasis.member.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.oasis.common.dao.AbstractDAO;

@Repository("myTabDAO")
public class MyTabDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public Map<String, Object> myMenuBar(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("member.myMenuBar", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> myCouponList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("member.myCouponList", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> useCoupon(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("member.useCoupon", map);
	}


	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> myOrderList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("member.myOrderList", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> myOrderDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("member.myOrderDetail", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> myOrderDetailImage(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectList("member.selectImageList", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> myStamp(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("member.myStamp", map);
	}
}