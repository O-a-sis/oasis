package com.oasis.store.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.oasis.common.CommandMap;
import com.oasis.store.service.StoreService;

import lombok.AllArgsConstructor;

@RequestMapping("/store/")
@Controller
@AllArgsConstructor
public class StoreMainController {
	
	private StoreService storeService;

	@RequestMapping(value = "/loginForm.oa")
	public String loginForm() throws Exception {
		return "store/loginForm";
	}
	
	@RequestMapping(value = "/login.oa", method = RequestMethod.POST)
	public ModelAndView login(CommandMap commandMap, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession(true);
		String message = "";
		Map<String, Object> result = storeService.getStore(commandMap.getMap());
		if (result == null) { // 지점 아이디가 있는지 확인
			ModelAndView mv = new ModelAndView("redirect:/store/loginForm.oa");
			message = "해당 지점 아이디가 존재하지 않습니다.";
			mv.addObject("message",message);
			return mv;

		} else {
			if (result.get("S_PASSWORD").equals(commandMap.get("S_PASSWORD"))) { // 비밀번호가 같다면				
				ModelAndView mv = new ModelAndView("redirect:/store/main.oa");
				session.setAttribute("STORE", result.get("STORE"));
				session.setAttribute("S_NAME", result.get("S_NAME"));
				return mv;
			} else {// 비밀번호가 일치하지않을 때
				ModelAndView mv = new ModelAndView("redirect:/store/loginForm.oa");
				message = "비밀번호가 맞지 않습니다.";
				mv.addObject("message",message);
				return mv;
			}
		}
	}
	
	@RequestMapping(value = "/logout.oa") // 로그아웃
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response, CommandMap commandMap)
			throws Exception {
		HttpSession session = request.getSession();
		if (session != null)
			session.invalidate();
		ModelAndView mv = new ModelAndView("redirect:/store/loginForm.oa");
		
		return mv;
	}
	
	@RequestMapping(value = "/main.oa") // 메인
	public ModelAndView main(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("store/main");
		
		HttpSession session = request.getSession();
		commandMap.put("O_STORE", session.getAttribute("STORE"));
		
		List<Map<String, Object>> orders = storeService.getOrders(commandMap.getMap());
		List<Map<String, Object>> ordersList = storeService.getOrdersList(commandMap.getMap());
		int storeStatus = storeService.getStoreStatus(commandMap.getMap());
		mv.addObject("status", storeStatus);
		mv.addObject("list", orders);
		mv.addObject("list2", ordersList);
		return mv;
	}
	
	@RequestMapping(value = "/open")
	public ModelAndView open(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/store/main.oa");
		
		int openStore = storeService.openStore(commandMap.getMap());
	
		return mv;
	}
	
	@RequestMapping(value = "/close")
	public ModelAndView close(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/store/main.oa");
		
		int closeStore = storeService.closeStore(commandMap.getMap());
	
		return mv;
	}

}
