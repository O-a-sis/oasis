package com.oasis.member.service;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.oasis.member.dao.MenuDAO;

import lombok.AllArgsConstructor;

@Service("menuService")
@AllArgsConstructor
public class MenuServiceImpl implements MenuService {

	private MenuDAO menuDAO;
	
	@Override
	public List<Map<String, Object>> menuList(Map<String, Object> map) throws Exception {
		return menuDAO.menuList(map);
	}
	
	@Override
	public Map<String, Object> menuDetail(Map<String, Object> map) throws Exception {
		return menuDAO.menuDetail(map);
	}

	@Override
	public void insertCart(Map<String, Object> map) throws Exception {
		menuDAO.insertCart(map);
		
	}
	@Override
	public List<Map<String, Object>> cartList(Map<String, Object> map) throws Exception {
		return menuDAO.cartList(map);
	}

	@Override
	public int menuUpdate(Map<String, Object> map) throws Exception {
		return menuDAO.menuUpdate(map);
	}

    @Override
	public void productDelete(Map<String, Object> map) throws Exception {
	    menuDAO.productDelete(map);
	}

	
}
