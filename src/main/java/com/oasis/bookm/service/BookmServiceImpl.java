package com.oasis.bookm.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oasis.bookm.dao.BookmDAO;
import com.oasis.member.dao.MemberStoreDAO;
import com.oasis.member.service.*;

import lombok.AllArgsConstructor;

@Service("BookmService")
@AllArgsConstructor
public class BookmServiceImpl implements BookmService {
	
	
	/*왜안돼*/
	private BookmDAO bookmDAO;

	
	@Override
	public int writeBookmark(Map<String, Object> map) throws Exception {
		return bookmDAO.writeBookmark(map);
	}

	@Override
	public int deleteBookmark(Map<String, Object> map) throws Exception {
		return bookmDAO.deleteBookmark(map);
	}

	@Override
	public List<Map<String, Object>> getBookList(Map<String, Object> map) throws Exception {
		return bookmDAO.getBookList(map);
	}



	
}



