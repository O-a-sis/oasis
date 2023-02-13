package com.oasis.member.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.oasis.common.dao.AbstractDAO;

@Repository("noticeDAO")
public class NoticeDAO extends AbstractDAO{
	
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> noticeList(Map<String, Object> map) throws Exception{
		return (List<Map<String,Object>>) selectList("member.noticeList", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String,Object> noticeDetail(Map<String, Object> map) throws Exception{
		return (Map<String,Object>) selectOne("member.noticeDetail", map);
	}

}
