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

import com.oasis.bookmark.service.BookmarkService;
import com.oasis.common.CommandMap;

import lombok.AllArgsConstructor;

@RequestMapping("/member/")
@Controller
@AllArgsConstructor
public class BookmarkController {

	private BookmarkService bookmarkService;

	@SuppressWarnings("unused")
	
	@RequestMapping(value = "/bookmarkWrite.oa", method = RequestMethod.POST, consumes = "application/json", produces = {
			MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> writeBookmark(@RequestBody Map<String, Object> map) throws Exception {
		int count = bookmarkService.writeBookmark(map);
		
		String bidx = String.valueOf(map.get("B_IDX"));
		return count == 1 ? new ResponseEntity<String>(bidx, HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@RequestMapping(value = "/bookmarkDelete.oa", method = RequestMethod.POST, consumes = "application/json", produces = {
			MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> deleteBookmark(@RequestBody Map<String, Object> map) throws Exception {
		int count = bookmarkService.deleteBookmark(map);

		return count == 1 ? new ResponseEntity<String>("success", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}