package com.oasis.member.dao;


import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.oasis.common.dao.AbstractDAO;


@Repository("BookmarkDAO")
public class BookmarkDAO extends AbstractDAO{


	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> getBookList(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("bookmark.getBookList", map);
	}


	
}