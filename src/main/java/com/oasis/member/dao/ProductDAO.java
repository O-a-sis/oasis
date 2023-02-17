package com.oasis.member.dao;



import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.oasis.common.dao.AbstractDAO;

@Repository("ProductDAO")
public class ProductDAO extends AbstractDAO{
	
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> productList(Map<String, Object> map) throws Exception{
		return (List<Map<String,Object>>) selectList("member.productList", map);
	}
}