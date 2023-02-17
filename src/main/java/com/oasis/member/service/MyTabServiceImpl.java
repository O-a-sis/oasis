package com.oasis.member.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oasis.member.dao.MyTabDAO;

import lombok.AllArgsConstructor;

@Service("myTabService")
@AllArgsConstructor
public class MyTabServiceImpl implements MyTabService{

	private MyTabDAO myTabDAO;

	@Override
	public Map<String, Object> myMenuBar(Map<String, Object> map) throws Exception {
		return myTabDAO.myMenuBar(map);
	}

	@Override
	public List<Map<String, Object>> myCouponList(Map<String, Object> map) throws Exception {
		return myTabDAO.myCouponList(map);
	}
	
	@Override
	public Map<String, Object> useCoupon(Map<String, Object> map) throws Exception {
		return myTabDAO.useCoupon(map);
	}

	@Override
	public List<Map<String, Object>> myOrderList(Map<String, Object> map) throws Exception {
		return myTabDAO.myOrderList(map);
	}


	  @Override 
	  public Map<String, Object> myOrderDetail(Map<String, Object>map) throws Exception {
	  	  return myTabDAO.myOrderDetail(map);  
	  }
	  
	  @Override
		public List<Map<String, Object>> OrderDetail(Map<String, Object> map) throws Exception {
			return myTabDAO.OrderDetail(map);
		}

	  @Override 
	  public Map<String, Object> myStamp(Map<String, Object>map) throws Exception {
	  	  return myTabDAO.myStamp(map);  
	  }
}