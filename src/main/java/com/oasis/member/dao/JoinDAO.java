package com.oasis.member.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.oasis.common.dao.AbstractDAO;

@Repository("joinDAO")
public class JoinDAO extends AbstractDAO{


	public void insertMember(Map<String, Object> map) throws Exception {
		insert("member.insertMember",map);
	}
	
	public Map<String, Object> getMember(Map<String, Object> map) throws Exception{
		return (Map<String, Object>)selectOne("member.getMember", map);
	}
}
