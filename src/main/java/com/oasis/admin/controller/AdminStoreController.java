package com.oasis.admin.controller;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.oasis.admin.service.AdminStoreService;
import com.oasis.common.CommandMap;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class AdminStoreController {

	private AdminStoreService adminStoreService;

	// 관리자 - 지점 리스트 (+매출)
	@RequestMapping(value = "/admin/storeList.oa")
	public ModelAndView storeList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("admin/storeList");

		List<Map<String, Object>> list = adminStoreService.storeList(commandMap.getMap());
		mv.addObject("list", list);

		return mv;
	
	}

	// 관리자 - 지점 회원가입폼
	@RequestMapping(value = "/admin/openStoreJoin.oa")
	public ModelAndView openStoreJoin(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("admin/storeJoin");

		return mv;
	}

	// 관리자 - 지점 회원가입등록
	@RequestMapping(value = "/admin/storeJoin.oa")
	public ModelAndView noticeWrite(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/storeList.oa");

		adminStoreService.storeJoin(commandMap.getMap());

		return mv;
	}

	// 관리자 - 지점 상세보기
	@RequestMapping(value = "/admin/storeDetail.oa")
	public ModelAndView storeDetail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("admin/storeDetail");

		Map<String, Object> map = adminStoreService.storeDetail(commandMap.getMap());

		mv.addObject("map", map);

		return mv;
	}

	// 관리자 - 지점수정
	@RequestMapping(value = "/admin/storeUpdate.oa")
	public ModelAndView storeUpdate(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/storeDetail.oa");

		adminStoreService.storeUpdate(commandMap.getMap());

		mv.addObject("S_IDX", commandMap.get("S_IDX"));
		return mv;
	}

	// 관리자 - 지점폐쇄 버튼 눌렀을 때 (목록으로 넘어감)
	@RequestMapping(value = "/admin/storeDown.oa")
	public ModelAndView storeDown(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/storeList.oa");

		adminStoreService.storeDown(commandMap.getMap());

		return mv;
	}
}