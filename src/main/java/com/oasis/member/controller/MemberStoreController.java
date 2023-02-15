package com.oasis.member.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;


import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.oasis.bookmark.service.BookmarkService;
import com.oasis.common.CommandMap;
import com.oasis.member.service.MemberStoreService;

import lombok.AllArgsConstructor;

@RequestMapping("/member/")
@Controller
@AllArgsConstructor
public class MemberStoreController {

	@SuppressWarnings("unused")
	private BookmarkService bookmarkService;
	private MemberStoreService memberStoreService;
	
	@RequestMapping(value = "/storeList.oa")
	public ModelAndView memberStoreList(Map<String, Object> commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("member/storeList");

		
		HttpSession session = request.getSession();
		commandMap.put("B_PHONE", session.getAttribute("B_PHONE"));
		
	
		List<Map<String, Object>> list = memberStoreService.getStoreList(commandMap);
		List<Map<String, Object>> book = bookmarkService.getBookList(commandMap);
		for (Map<String, Object> map : list) {
			System.out.println(map);
		}


		mv.addObject("list", list);
		mv.addObject("book", book);
		return mv;
	}



}