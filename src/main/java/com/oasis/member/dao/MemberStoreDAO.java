package com.oasis.member.dao;


import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.oasis.common.dao.AbstractDAO;


@Repository("MemberStoreDAO")
public class MemberStoreDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectStoreList(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("memberstore.selectStoreList", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> memberstoreDetail(Map<String, Object> map) {
		return (Map<String, Object>)selectOne("memberstore.memberstoreDetail", map);
	}

	
}