package com.oasis.member.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;


import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;


import com.oasis.common.CommandMap;
import com.oasis.member.service.*;

import lombok.AllArgsConstructor;

@RequestMapping("/member/")
@Controller
@AllArgsConstructor
public class StoreDetailController {

	@SuppressWarnings("unused")
	private BookmarkService bookmarkService;
	private MemberStoreService memberStoreService;
	
	
//	
//	@RequestMapping(value = "/{store}", method = RequestMethod.GET, consumes = "application/json", produces = {
//			MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE })
//	public ResponseEntity<Map<String, Object>> get(@PathVariable("store") Map<String, Object> store) throws Exception {
//		return new ResponseEntity<Map<String, Object>>(memberStoreService.storeDetail(store),HttpStatus.OK);
//	}
//	



}