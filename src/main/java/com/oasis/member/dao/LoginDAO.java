package com.oasis.member.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.oasis.common.dao.AbstractDAO;

@Repository("loginDAO")
public class LoginDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public Map<String, Object> getMember(Map<String, Object> map) throws Exception {
	return (Map<String, Object>) selectOne("member.getMember", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> findPassword(Map<String, Object> map) throws Exception {
	return (Map<String, Object>) selectOne("member.findPassword", map);
	}
	
		
}