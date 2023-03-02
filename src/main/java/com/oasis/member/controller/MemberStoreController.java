package com.oasis.member.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.oasis.bookm.service.BookmService;
import com.oasis.member.service.MemberStoreService;

import lombok.AllArgsConstructor;

@RequestMapping("/member/")
@Controller
@AllArgsConstructor
public class MemberStoreController {

	@SuppressWarnings("unused")
	private BookmService bookmarkService;
	private MemberStoreService memberStoreService;

	@RequestMapping(value = "/storeList.oa")
	public ModelAndView memberStoreList(Map<String, Object> commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("member/storeList");

		HttpSession session = request.getSession();
		commandMap.put("B_PHONE", session.getAttribute("B_PHONE"));

		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		List<Map<String, Object>> book = new ArrayList<Map<String, Object>>();
		if (session.getAttribute("B_PHONE") == null) {
			list = memberStoreService.getStoreList(commandMap);
		} else {
			list = memberStoreService.getStoreList(commandMap);
			book = bookmarkService.getBookList(commandMap);
		}
//		Map<String, Object> map = memberStoreService.storeDetail(commandMap);

//		mv.addObject("map", map);

		mv.addObject("list", list);
		mv.addObject("book", book);
		return mv;
	}

}