package com.oasis.member.controller;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.oasis.common.CommandMap;
import com.oasis.member.service.*;

import lombok.AllArgsConstructor;


@Controller
@AllArgsConstructor
public class MemberStoreController {

	private MemberStoreService memberstoreService;

	@RequestMapping(value = "/member/StoreList.oa")
	public ModelAndView storeList(Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/member/storeList");
		
		List<Map<String, Object>> list = memberstoreService.selectStoreList(commandMap);
		
		mv.addObject("list", list);
		return mv;
	}


	@RequestMapping(value = "member/storeDetail.oa") // ajax??어캐넣지
	public ModelAndView openStoreDetail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/member/storeDetail");

		Map<String, Object> map = memberstoreService.MemberStoreDetail(commandMap.getMap());
		mv.addObject("map", map);

		return mv;
	}

	
}