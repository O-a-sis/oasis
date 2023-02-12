package com.oasis.admin.controller;

import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.oasis.admin.service.AdminStoreService;
import com.oasis.common.CommandMap;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@RequestMapping("/admin/")
public class AdminStoreController {

	private AdminStoreService adminStoreService;

	// 관리자 - 지점 리스트 (+매출)
	@RequestMapping(value = "/storeList.oa")
	public ModelAndView storeList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("admin/storeList");

		List<Map<String, Object>> listRank = adminStoreService.storeListRank(commandMap.getMap());
		mv.addObject("listRank", listRank);
		List<Map<String, Object>> list = adminStoreService.storeList(commandMap.getMap());
		System.out.println();
		mv.addObject("list", list);

		return mv;

	}

	// 관리자 - 지점 회원가입폼
	@RequestMapping(value = "/openStoreJoin.oa")
	public ModelAndView openStoreJoin(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("admin/storeJoin");

		return mv;
	}

	// 관리자 - 지점 회원가입등록
	@RequestMapping(value = "/storeJoin.oa")
	public ModelAndView noticeWrite(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/admin/storeList.oa");

		adminStoreService.storeJoin(commandMap.getMap());

		return mv;
	}

	// 관리자 - 지점 상세보기
	@RequestMapping(value = "/storeDetail.oa")
	public ModelAndView storeDetail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("admin/storeDetail");

		Map<String, Object> map = adminStoreService.storeDetail(commandMap.getMap());

		mv.addObject("map", map);

		return mv;
	}

	// 관리자 - 지점수정
	@RequestMapping(value = "/update", method = { RequestMethod.PATCH,
			RequestMethod.PUT }, consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> update(@RequestBody Map<String, Object> map) throws Exception {
		int count = adminStoreService.storeUpdate(map);
		return count == 1 ? new ResponseEntity<String>("success", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	// 관리자 - 지점폐쇄 버튼 눌렀을 때 (목록으로 넘어감)
	@RequestMapping(value = "/storeDown.oa")
	public ModelAndView storeDown(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/storeList.oa");

		adminStoreService.storeDown(commandMap.getMap());

		return mv;
	}
}
