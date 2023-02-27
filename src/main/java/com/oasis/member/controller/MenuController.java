package com.oasis.member.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.oasis.common.CommandMap;
import com.oasis.member.service.MenuService;
import com.oasis.member.service.MyTabService;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/member/")
@AllArgsConstructor
public class MenuController {

	
	private MenuService menuService;
	
	@RequestMapping(value="/menuList.oa") 
	public ModelAndView myMenuBar(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("member/menuList");

		List<Map<String, Object>> list = menuService.menuList(commandMap.getMap());
		
		mv.addObject("list", list);
		
		return mv;
	}
	   @RequestMapping(value = "/menuDetail.oa")
	   public ModelAndView menuDetail(CommandMap commandMap) throws Exception {
	      ModelAndView mv = new ModelAndView("member/dessertDetail");
	   
	      
	      Map<String,Object> map = menuService.menuDetail(commandMap.getMap());
	      mv.addObject("map", map);
	      return mv;
	   }
	
	   
		@RequestMapping(value = "/cartList.oa")
		public ModelAndView cartList(CommandMap commandMap, HttpServletRequest request,@RequestParam("store") String store) throws Exception {
		ModelAndView mv = new ModelAndView("member/cartList");
		
		HttpSession session = request.getSession();
		commandMap.put("B_PHONE",session.getAttribute("B_PHONE"));
		commandMap.put("C_STORE",store);
		List<Map<String, Object>> list = menuService.cartList(commandMap.getMap());
		System.out.println(store);
		
		mv.addObject("list", list);
		return mv;
		}
		
		
		@RequestMapping(value = "/insertCart.oa")
		public ModelAndView insertCart(CommandMap commandMap,RedirectAttributes redirect) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/member/cartList.oa");
		
		menuService.insertCart(commandMap.getMap());
		redirect.addAttribute("store", commandMap.get("C_STORE"));
		return mv;
		}
		

}
