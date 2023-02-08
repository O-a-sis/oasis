package com.oasis.store.controller;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.oasis.common.CommandMap;
import com.oasis.store.service.*;

import lombok.AllArgsConstructor;


@Controller
@AllArgsConstructor
public class StoreController {

	private StoreService storeService;

	@RequestMapping(value = "/member/StoreList.oa")
	public ModelAndView storeList(Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/store/storeList");
		
		List<Map<String, Object>> list = storeService.selectStoreList(commandMap);
		
		mv.addObject("list", list);
		return mv;
	}


	@RequestMapping(value = "member/storeDetail.oa") // ajax??어캐넣지
	public ModelAndView openStoreDetail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("store/storeDetail");

		Map<String, Object> map = storeService.StoreDetail(commandMap.getMap());
		mv.addObject("map", map);

		return mv;
	}

	
}