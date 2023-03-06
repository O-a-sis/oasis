package com.oasis.admin.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.oasis.admin.service.AdminStoreService;
import com.oasis.common.CommandMap;
import com.oasis.common.util.Paging;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/admin/")
@AllArgsConstructor
public class AdminStoreController {

	private AdminStoreService adminStoreService;
	
	@RequestMapping(value = "/main.oa") // 메인
	public ModelAndView main(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("admin/main");

		return mv;
	}

	// 관리자 메인 - 지점 리스트 (+매출)
	@RequestMapping(value = "/storeList.oa")
	public ModelAndView storeList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("admin/storeList");

		List<Map<String, Object>> listRank = adminStoreService.storeListRank(commandMap.getMap());
		mv.addObject("listRank", listRank);

		/* 페이징을 위한 변수 */
		int page = commandMap.get("page") == null ? 1 : Integer.parseInt((String) commandMap.get("page"));// 현재 페이지
		int pageSize = 10;// 한 페이지에 보여줄 행의 수
		int start = (page * pageSize) - pageSize + 1;
		int end = page * pageSize;
		int ListCount = 0; // 전체 게시글 수
		int pageBlock = 5; // 표시할 페이지의 수
		String url = "storeList.oa";
		String searchUrl = "";
		commandMap.put("START", start);
		commandMap.put("END", end);

		List<Map<String, Object>> list = adminStoreService.storeList(commandMap.getMap());
		mv.addObject("list", list);

		if (list.size() > 0) {
			ListCount = Integer.parseInt(String.valueOf(list.get(0).get("TOTAL_COUNT")));
		}

		// 페이징할 아이템의 총 수, 페이지의 수 ex> 1~5 6~10, 한 페이지에 표시할 게시글의 수, 현재 페이지, 이동주소, 검색시 사용할
		// 주소 입력
		Paging paging = new Paging(ListCount, pageBlock, pageSize, page, url, searchUrl);

		mv.addObject("list", list);
		mv.addObject("paging", paging);

		return mv;
	}

	// 관리자 - 지점 상세보기
	@RequestMapping(value = "/storeDetail.oa")
	public ModelAndView storeDetail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("admin/storeDetail");

		/* 페이징을 위한 변수 */
		int page = commandMap.get("page") == null ? 1 : Integer.parseInt((String) commandMap.get("page"));// 현재 페이지
		int pageSize = 10;// 한 페이지에 보여줄 행의 수
		int start = (page * pageSize) - pageSize + 1;
		int end = page * pageSize;
		int ListCount = 0; // 전체 게시글 수
		int pageBlock = 5; // 표시할 페이지의 수
		String url = "storeDetail.oa";
		String searchUrl = "";
		commandMap.put("START", start);
		commandMap.put("END", end);

		List<Map<String, Object>> listSum = adminStoreService.storeSumRank(commandMap.getMap());
		mv.addObject("listSum", listSum);

		if (listSum.size() > 0) {
			ListCount = Integer.parseInt(String.valueOf(listSum.get(0).get("TOTAL_COUNT")));
		}
		// 페이징할 아이템의 총 수, 페이지의 수 ex> 1~5 6~10, 한 페이지에 표시할 게시글의 수, 현재 페이지, 이동주소, 검색시 사용할
		// 주소 입력
		Paging paging = new Paging(ListCount, pageBlock, pageSize, page, url, searchUrl);

		Map<String, Object> map = adminStoreService.storeDetail(commandMap.getMap());
		mv.addObject("map", map);

		mv.addObject("paging", paging);
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
	public ModelAndView storeJoin(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/admin/storeList.oa");
System.out.println(commandMap.get("STORE"));
		adminStoreService.storeJoin(commandMap.getMap());

		return mv;
	}

	/* 지점명 중복체크 */
	@RequestMapping(value = "/confirmName.oa", method = RequestMethod.POST)
	@ResponseBody
	public boolean checkName(@RequestParam String name) throws Exception {

		int check = adminStoreService.getNameCheck(name);

		if (check > 0) {
			return true;
		} else
			return false;
	}

	// 관리자 - 지점수정
	@RequestMapping(value = "/update", method = RequestMethod.POST, consumes = "application/json", produces = {
			MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> update(@RequestBody Map<String, Object> map) throws Exception {
		int count = adminStoreService.storeUpdate(map);
		return count == 1 ? new ResponseEntity<String>("success", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	// 관리자 - 지점폐쇄 버튼 눌렀을 때 (목록으로 넘어감)
	@RequestMapping(value = "/storeDown.oa")
	public ModelAndView storeDown(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/admin/storeList.oa");

		adminStoreService.storeDown(commandMap.getMap());

		return mv;
	}

	// 관리자 회원 리스트
	@RequestMapping(value = "/memberList.oa")
	public ModelAndView memberList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("admin/memberList");

		/* 페이징을 위한 변수 */
		int page = commandMap.get("page") == null ? 1 : Integer.parseInt((String) commandMap.get("page"));// 현재 페이지
		int pageSize = 10;// 한 페이지에 보여줄 행의 수
		int start = (page * pageSize) - pageSize + 1;
		int end = page * pageSize;
		int ListCount = 0; // 전체 게시글 수
		int pageBlock = 5; // 표시할 페이지의 수
		String url = "memberList.oa";
		String searchUrl = "";
		commandMap.put("START", start);
		commandMap.put("END", end);

		List<Map<String, Object>> list = adminStoreService.memberList(commandMap.getMap());
		mv.addObject("list", list);

		if (list.size() > 0) {
			ListCount = Integer.parseInt(String.valueOf(list.get(0).get("TOTAL_COUNT")));
		}

		// 페이징할 아이템의 총 수, 페이지의 수 ex> 1~5 6~10, 한 페이지에 표시할 게시글의 수, 현재 페이지, 이동주소, 검색시 사용할
		// 주소 입력
		Paging paging = new Paging(ListCount, pageBlock, pageSize, page, url, searchUrl);

		mv.addObject("list", list);
		mv.addObject("paging", paging);

		return mv;
	}

}
