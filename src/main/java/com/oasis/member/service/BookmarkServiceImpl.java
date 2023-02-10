package com.oasis.member.service;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.oasis.member.dao.*;

import lombok.AllArgsConstructor;

@Service("bookmarkService")
@AllArgsConstructor
public class BookmarkServiceImpl implements BookmarkService {@Override
	public List<Map<String, Object>> getBookList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int writeBookmark(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}


}