package com.oasis.member.dao;


import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.oasis.common.dao.AbstractDAO;


@Repository("MemberStoreDAO")
public class MemberStoreDAO extends AbstractDAO{


	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> getStoreList(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("memberstore.getStoreList", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> getBookList(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("bookmark.getBookList", map);
	}
	
}