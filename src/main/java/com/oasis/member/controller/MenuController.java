package com.oasis.member.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.oasis.common.CommandMap;
import com.oasis.member.service.MemberStoreService;
import com.oasis.member.service.MenuService;
import com.oasis.member.service.MyTabService;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/member/")
@AllArgsConstructor
public class MenuController {
	private MenuService menuService;
	private MyTabService myTabService;

	@RequestMapping(value = "/menuList.oa")
	public ModelAndView myMenuBar(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("member/menuList");

		List<Map<String, Object>> list = menuService.menuList(commandMap.getMap());

		mv.addObject("list", list);

		return mv;
	}

	@RequestMapping(value = "/menuDetail.oa")
	public ModelAndView menuDetail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("member/menuDetail");

		Map<String, Object> map = menuService.menuDetail(commandMap.getMap());
		mv.addObject("map", map);
		return mv;
	}

	@RequestMapping(value = "/cartList.oa")
	public ModelAndView cartList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("member/cartList");

		HttpSession session = request.getSession();
		commandMap.put("B_PHONE", session.getAttribute("B_PHONE"));
		commandMap.put("C_STORE", session.getAttribute("cart"));
		List<Map<String, Object>> list = menuService.cartList(commandMap.getMap());
		List<Map<String, Object>> clist = myTabService.myCouponList(commandMap.getMap());

		mv.addObject("clist", clist);
		mv.addObject("list", list);
		return mv;
	}

	@PostMapping(value = "/insertCart.oa", consumes = "application/json", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> insertCart(@RequestBody Map<String, Object> map, HttpServletRequest request)
			throws Exception {

		// 세션
		HttpSession session = request.getSession();
		if (session.getAttribute("cart") == null) {
			session.setAttribute("cart", map.get("C_STORE"));
		}

		int count = menuService.insertCart(map);

		return count == 1 ? new ResponseEntity<String>("success", HttpStatus.OK)
				: new ResponseEntity<String>("fail", HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@PostMapping(value = "/cartDeleteAll.oa", consumes = "application/json", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> cartDeleteAll(@RequestBody Map<String, Object> map, HttpServletRequest request)
			throws Exception {
System.out.println(map.get("B_PHONE"));
		// 세션
		HttpSession session = request.getSession();
		if (session.getAttribute("cart") != null) {
			session.removeAttribute("cart");
		}

		int count = menuService.cartDeleteAll(map);

		return count == 1 ? new ResponseEntity<String>("success", HttpStatus.OK)
				: new ResponseEntity<String>("fail", HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@PostMapping(value = "/cartDelete.oa", consumes = "application/json", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> cartDelete(@RequestBody Map<String, Object> map) throws Exception {

		int count = menuService.cartDelete(map);

		return count == 1 ? new ResponseEntity<String>("success", HttpStatus.OK)
				: new ResponseEntity<String>("fail", HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
