package com.oasis.admin.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
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
		int start = 1; // 가져올 데이터의 시작 인
		int pageSize = 8;// 한 페이지에 보여줄 행의 수
		int end = 8;
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

//	더보기 버튼 Ajax
	@RequestMapping(value = "/loadMoreNotice.oa")
	public @ResponseBody Map<String, Object> loadMoreNotice(@RequestParam int page, @RequestParam String type,
			@RequestParam String keyword) throws Exception {
		System.out.println("page : " + page);
		int perPage = 8; // 한 페이지에 표시할 게시물 수
		int offset = (page * perPage) - perPage + 1; // 가져올 데이터의 시작 인덱스

		CommandMap commandMap = new CommandMap();
		commandMap.put("START", offset);
		commandMap.put("END", page * perPage);
		commandMap.put("type", type);
		commandMap.put("keyword", keyword);

		List<Map<String, Object>> list = adminNoticeService.adminNoticeList(commandMap.getMap());
		int totalCount = Integer.parseInt(String.valueOf(list.get(0).get("TOTAL_COUNT")));

		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("list", list);
		resultMap.put("paging",
				new Paging(totalCount, 5, perPage, page, "noticeList.oa", "&type=" + type + "&keyword=" + keyword));
		return resultMap;
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

//	공지사항 수정 폼
	@RequestMapping(value = "/admin/updateForm.oa")
	public ModelAndView adminNoticeUpdateForm(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("admin/noticeForm");

		Map<String, Object> map = adminNoticeService.adminNoticeDetail(commandMap.getMap());
		mv.addObject("N_IDX", commandMap.get("N_IDX"));
		mv.addObject("map", map);

		return mv;
	}

//	공지사항 작성/수정 기능
	@RequestMapping(value = "/admin/noticeSave.oa")
	public ModelAndView adminNoticeSave(CommandMap commandMap, MultipartHttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/admin/noticeList.oa");

		List<MultipartFile> imgFile = request.getFiles("N_IMAGE");

		for (MultipartFile file : imgFile) {
			String fileName = file.getOriginalFilename();
			UUID uuid = UUID.randomUUID();
			fileName = uuid.toString();
			System.out.println("fileName:"+fileName);
			String savePath = request.getSession().getServletContext().getRealPath("/") + File.separator + "img/"
					+ fileName;
			File uploadPath = new File(savePath);
			if (uploadPath.exists() == false) {
				uploadPath.mkdirs();
			}
			if (fileName == "") {
				commandMap.put("N_IMAGE", commandMap.get("PREV_IMAGE"));
			} else {
				file.transferTo(new File(savePath));
				commandMap.put("N_IMAGE", fileName);
			}
		}
		if (commandMap.get("N_IDX") == null) {
			adminNoticeService.adminNoticeWrite(commandMap.getMap());
		} else {
			adminNoticeService.adminNoticeUpdate(commandMap.getMap(), request);
			mv.addObject("N_IDX", commandMap.get("N_IDX"));
		}

		adminNoticeService.adminNoticeUpdate(commandMap.getMap(), request);

		mv.addObject("N_IDX", commandMap.get("N_IDX"));
		return mv;
	}

//	공지사항 삭제 기능
	@RequestMapping(value = "/admin/noticeDelete.oa")
	public ModelAndView adminNoticeDelete(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/admin/noticeList.oa");

		adminNoticeService.adminNoticeDelete(commandMap.getMap());

		return mv;
	}

}
