package com.oasis.member.controller;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;


import com.oasis.common.CommandMap;
import com.oasis.member.service.*;

import lombok.AllArgsConstructor;


@Controller
@AllArgsConstructor
public class MemberStoreController {

	@SuppressWarnings("unused")
	private MemberStoreService memberStoreService;

	@RequestMapping(value = "/member/StoreList.oa")
	public ModelAndView memberStoreList(Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/member/storeList");
		
		String subUrl = "&B_PHONE=" + commandMap.get("B_PHONE");
		String url = "/member/StoreList.oa";
		
		
		List<Map<String, Object>> list = memberStoreService.getStoreList(commandMap);
		List<Map<String, Object>> bookmarklist = memberStoreService.getBookList(commandMap);
		
		mv.addObject("list", list);
		mv.addObject("book", bookmarklist);
		return mv;
	}



	
}