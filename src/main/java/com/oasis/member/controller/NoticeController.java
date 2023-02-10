package com.oasis.member.controller;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.oasis.common.CommandMap;
import com.oasis.common.util.Paging;
import com.oasis.member.service.NoticeService;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/member/")
@AllArgsConstructor
public class NoticeController {
	private NoticeService noticeService;
	
	@RequestMapping(value = "/noticeList.oa")
	public ModelAndView noticeList(CommandMap commandMap) throws Exception { 
		ModelAndView mv = new ModelAndView("member/noticeList");
		
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

		List<Map<String, Object>> list = noticeService.noticeList(commandMap.getMap());

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
	
	@RequestMapping(value = "/noticeDetail.oa")
	public ModelAndView noticeDetail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("member/noticeDetail");
		
		Map<String, Object> map = noticeService.noticeDetail(commandMap.getMap());
		mv.addObject("map",map);
				return mv;
	
	}
	
}
