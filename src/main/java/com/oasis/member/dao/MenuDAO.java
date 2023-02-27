package com.oasis.member.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.oasis.common.dao.AbstractDAO;

@Repository("MenuDAO")
public class MenuDAO extends AbstractDAO{

	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> menuList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>) selectList("menu.menuList", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> mainmenuList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>) selectList("menu.mainmenuList", map);
	}

	public Map<String, Object> menuDetail(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("menu.menuDetail", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> productList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>) selectList("menu.productList", map);
	}
	

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> cartList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>) selectList("menu.cartList", map);
	}

	public int insertCart(Map<String, Object> map) throws Exception {
		return (int)insert("menu.insertCart", map);
	}
	
	public int updateCart(Map<String, Object> map) throws Exception {
		return (int)update("menu.updateCart", map);
	}
	
	public int menuUpdate(Map<String, Object> map) throws Exception {
		return (int) update("menu.menuUpdate", map);
	}
	
    public void productDelete(Map<String, Object> map) throws Exception{
        delete("menu.productDelete", map);
  }

	public int cartDeleteAll(Map<String, Object> map) throws Exception {
		return (int)delete("menu.cartDeleteAll", map);
	}
	
	public int cartDelete(Map<String, Object> map) throws Exception {
		return (int)delete("menu.cartDelete", map);
	}
}
