package com.oasis.member.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.oasis.member.dao.NoticeDAO;

import lombok.AllArgsConstructor;

@Service("noticeService")
@AllArgsConstructor
public class NoticeServiceImpl implements NoticeService {

	private NoticeDAO noticeDAO;
	
	@Override
	public List<Map<String, Object>> noticeList(Map<String, Object> map) throws Exception {
		String[] typeArr = String.valueOf(map.get("type")).split("");
		map.put("typeArr", typeArr);
		return noticeDAO.noticeList(map);
	}
	
	@Override
	public Map<String, Object> noticeDetail(Map<String, Object> map) throws Exception {
		return noticeDAO.noticeDetail(map);
	}
	
}
