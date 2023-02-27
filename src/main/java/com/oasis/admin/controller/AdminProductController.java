package com.oasis.admin.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.oasis.admin.service.AdminStoreService;
import com.oasis.common.CommandMap;
import com.oasis.member.service.MenuService;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/admin/")
@AllArgsConstructor
public class AdminProductController {

	private MenuService menuService;
	
	@RequestMapping(value = "/productList.oa") // 메인
	public ModelAndView productList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("admin/productList");
		
		List<Map<String, Object>> list = menuService.menuList(commandMap.getMap());
		mv.addObject("list", list);

		return mv;
	}
	
	@RequestMapping(value = "/productDetail.oa") // 메인
	public ModelAndView productDetail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("admin/productDetail");
		
		Map<String, Object> map = menuService.menuDetail(commandMap.getMap());
		mv.addObject("map", map);

		return mv;
	}
	
	@RequestMapping(value = "/productUpdateForm.oa") // 메인
	public ModelAndView productUpdateForm(CommandMap commandMap, RedirectAttributes rttr) throws Exception {
		ModelAndView mv = new ModelAndView("admin/productUpdateForm");
		

		Map<String, Object> map = menuService.menuDetail(commandMap.getMap());
		mv.addObject("map", map);
		
		String P_IDX = String.valueOf(commandMap.get("P_IDX"));
		rttr.addAttribute("P_IDX", P_IDX);

		return mv;
	}
	
	@RequestMapping(value = "/productUpdate.oa") // 메인
	public ModelAndView productUpdate(CommandMap commandMap, @RequestParam("P_IDX") String P_IDX) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/admin/productDetail.oa?P_IDX="+P_IDX);

		int update = menuService.menuUpdate(commandMap.getMap());
		return mv;
	}
	
	@RequestMapping(value = "/productDelete.oa")
	public ModelAndView deleteProduct(CommandMap commandMap) throws Exception {
	    ModelAndView mv = new ModelAndView("redirect:/admin/productList.oa");

	    menuService.productDelete(commandMap.getMap());
	    return mv;
	   }
	
	

}
