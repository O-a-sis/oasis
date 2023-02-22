package com.oasis.bookmark.controller;

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

import com.oasis.common.CommandMap;
import com.oasis.member.service.BookmarkService;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class BookmarkController {

	private BookmarkService bookmarkService;

@SuppressWarnings("unused")
@RequestMapping(value = "/bookmarkWrite.fe", method = RequestMethod.POST, consumes = "application/json", produces = {
			MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> write(@RequestBody Map<String, Object> map) throws Exception {
		String bmidx = String.valueOf(map.get("BS_STORE"));
		return new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}


	@RequestMapping(value = "/bookmarkDelete.fe", method = RequestMethod.POST, consumes = "application/json", produces = {
			MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> delete(@RequestBody Map<String, Object> map) throws Exception {
		return new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}