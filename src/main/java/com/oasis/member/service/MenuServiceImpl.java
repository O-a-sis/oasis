package com.oasis.member.service;
import java.math.BigDecimal;
import java.util.Arrays;
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
	public List<Map<String, Object>> mainmenuList(Map<String, Object> map) throws Exception {
		return menuDAO.mainmenuList(map);
	}
	
	@Override
	public Map<String, Object> menuDetail(Map<String, Object> map) throws Exception {
		return menuDAO.menuDetail(map);
	}

	@Override
	public int insertCart(Map<String, Object> map) throws Exception {
		// 장바구니 가져옴
		List<Map<String, Object>> cartList = menuDAO.cartList(map);
		
		// 같은 옵션 같은 메뉴 있는지 확인
		for (Map<String, Object> cart : cartList) {
			if(String.valueOf(cart.get("CP_IDX")).equals(String.valueOf(map.get("CP_IDX")))) {
				if(cart.get("C_OP").equals(map.get("C_OP"))) {
					//update
					BigDecimal cprice = (BigDecimal) cart.get("C_PRICE");
					BigDecimal ccount = (BigDecimal) cart.get("C_COUNT");
					map.put("UP_PRICE",cprice.intValue()+Integer.valueOf((String)map.get("C_PRICE")));
					map.put("UP_COUNT",ccount.intValue()+Integer.valueOf((String)map.get("C_COUNT")));
					map.put("UP_CIDX", cart.get("C_IDX"));
					return menuDAO.updateCart(map);
				}
			}
		}
		return menuDAO.insertCart(map);
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
