package com.oasis.admin.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.oasis.common.CommandMap;
import com.oasis.common.util.Paging;
import com.oasis.admin.service.AdminNoticeService;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class AdminNoticeContorller {

	private AdminNoticeService adminNoticeService;

	@RequestMapping(value = "/admin/noticeList.oa")
	public ModelAndView adminNoticeList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("admin/noticeList");

		/* 페이징을 위한 변수 */
		int page = commandMap.get("page") == null ? 1 : Integer.parseInt((String) commandMap.get("page"));// 현재 페이지
		int pageSize = 10;// 한 페이지에 보여줄 행의 수
		int start = (page * pageSize) - pageSize + 1;
		int end = page * pageSize;
		int noticeListCount = 0; // 전체 게시글 수
		int pageBlock = 5; // 표시할 페이지의 수
		String url = "noticeList.oa";
		String searchUrl = "&type=" + commandMap.get("type") + "&keyword=" + commandMap.get("keyword");

		commandMap.put("START", start);
		commandMap.put("END", end);

		List<Map<String, Object>> list = adminNoticeService.adminNoticeList(commandMap.getMap());

		if (list.size() > 0) {
			noticeListCount = Integer.parseInt(String.valueOf(list.get(0).get("TOTAL_COUNT")));
		}

		// 페이징할 아이템의 총 수, 페이지의 수 ex> 1~5 6~10, 한 페이지에 표시할 게시글의 수, 현재 페이지, 이동주소, 검색시 사용할
		// 주소 입력
		Paging paging = new Paging(noticeListCount, pageBlock, pageSize, page, url, searchUrl);

		mv.addObject("list", list);
		mv.addObject("paging", paging);
		return mv;
	}

//	공지사항 상세보기
	@RequestMapping(value = "/admin/noticeDetail.oa")
	public ModelAndView adminNoticeDetail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("admin/noticeDetail");

		Map<String, Object> map = adminNoticeService.adminNoticeDetail(commandMap.getMap());
		mv.addObject("map", map);

		return mv;
	}

//	공지사항 작성 폼
	@RequestMapping(value = "/admin/noticeForm.oa")
	public ModelAndView adminNoticeForm(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("admin/noticeForm");

		return mv;
	}

//	공지사항 작성 기능
	@RequestMapping(value = "/admin/noticeWrite.oa")
	public ModelAndView adminNoticeWrite(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/admin/noticeList.oa");

		return mv;
	}

//	공지사항 수정 폼(추후 작성 폼 하나로 작성/수정 구현)
	@RequestMapping(value = "/admin/UpdateForm.oa")
	public ModelAndView adminNoticeUpdateForm(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("admin/noticeForm");

		Map<String, Object> map = adminNoticeService.adminNoticeDetail(commandMap.getMap());
		mv.addObject("N_IDX", commandMap.get("N_IDX"));
		mv.addObject("map", map.get("map"));

		return mv;
	}

//	공지사항 수정 기능
	@RequestMapping(value = "/admin/noticeUpdate.oa")
	public ModelAndView adminNoticeUpdate(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/noticeDetail.fe");

		adminNoticeService.adminNoticeUpdate(commandMap.getMap(), request);

		mv.addObject("N_IDX", commandMap.get("N_IDX"));
		return mv;
	}

//	공지사항 삭제 기능
	@RequestMapping(value = "/admin/noticeDelete.oa")
	public ModelAndView qnaDelete(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/admin/noticeList.oa");

		adminNoticeService.adminNoticeDelete(commandMap.getMap());

		return mv;
	}

}
