package com.oasis.admin.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.oasis.common.CommandMap;
import com.oasis.common.util.Paging;
import com.oasis.admin.service.AdminNoticeService;

import lombok.AllArgsConstructor;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@RequestMapping("/admin/")
@AllArgsConstructor
public class AdminNoticeContorller {

	private AdminNoticeService adminNoticeService;

	@RequestMapping(value = "noticeList.oa")
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
	@RequestMapping(value = "noticeDetail.oa")
	public ModelAndView adminNoticeDetail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("admin/noticeDetail");

		Map<String, Object> map = adminNoticeService.adminNoticeDetail(commandMap.getMap());
		mv.addObject("map", map);

		return mv;
	}

//	공지사항 작성 폼
	@RequestMapping(value = "noticeForm.oa")
	public ModelAndView adminNoticeForm(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("admin/noticeForm");

		return mv;
	}

//	공지사항 수정 폼(추후 작성 폼 하나로 작성/수정 구현)
	@RequestMapping(value = "UpdateForm.oa")
	public ModelAndView adminNoticeUpdateForm(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("admin/noticeForm");

		Map<String, Object> map = adminNoticeService.adminNoticeDetail(commandMap.getMap());
		mv.addObject("N_IDX", commandMap.get("N_IDX"));
		mv.addObject("map", map);

		return mv;
	}

//	공지사항 작성/수정 기능
	@RequestMapping(value = "noticeSave.oa")
	public ModelAndView adminNoticeSave(CommandMap commandMap, MultipartFile[] N_IMAGE) throws Exception {
	public ModelAndView adminNoticeSave(CommandMap commandMap, MultipartHttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/admin/noticeList.oa");

		List<MultipartFile> imgFile = request.getFiles("N_IMAGE");

		for (MultipartFile file : imgFile) {
			String fileName = file.getOriginalFilename();
			String savePath = request.getSession().getServletContext().getRealPath("/") + File.separator + "img/"
					+ fileName;
			File uploadPath = new File(savePath);
			System.out.println(savePath);
			if (uploadPath.exists() == false) {
				uploadPath.mkdirs();
			}
			file.transferTo(new File(savePath));
			commandMap.put("N_IMAGE", fileName);
			System.out.println(uploadPath);
		}

		if (commandMap.get("N_IDX") == null) {
			adminNoticeService.adminNoticeWrite(commandMap.getMap());
		} else {
			adminNoticeService.adminNoticeUpdate(commandMap.getMap());
			mv.addObject("N_IDX", commandMap.get("N_IDX"));
		}

		return mv;
	}

	@GetMapping("/uploadAjax")
	public void uploadForm() {
		System.out.println("upload form");
	}

	private String getFolder() {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		Date date = new Date();

		String str = sdf.format(date);

		return str.replace("-", File.separator);
	}

	private boolean checkImageType(File file) {
		try {
			String contentType = Files.probeContentType(file.toPath());

			return contentType.startsWith("image");
		} catch (IOException e) {
			e.printStackTrace();

		}
		return false;
	}

	@RequestMapping(value = "uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<Map<String, Object>> uploadAjaxPost(MultipartFile[] uploadFile) {

		System.out.println("update ajax post..............");
		
		System.out.println(uploadFile);

		String uploadFolder = "C:\\upload";

		File uploadPath = new File(uploadFolder, getFolder());

		System.out.println("upload path : " + uploadPath);

		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}

		for (MultipartFile multipartFile : uploadFile) {
			System.out.println("--------------------------------------");
			System.out.println("Upload File Name : " + multipartFile.getOriginalFilename());
			System.out.println("Upload File Size : " + multipartFile.getSize());

			String uploadFileName = multipartFile.getOriginalFilename();

			System.out.println("only file name : " + uploadFileName);

			try {
				File saveFile = new File(uploadFolder, uploadFileName);
				multipartFile.transferTo(saveFile);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return new ResponseEntity<>(HttpStatus.OK);
	}

//	공지사항 삭제 기능
	@RequestMapping(value = "noticeDelete.oa")
	public ModelAndView qnaDelete(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/admin/noticeList.oa");

		adminNoticeService.adminNoticeDelete(commandMap.getMap());

		return mv;
	}

}
