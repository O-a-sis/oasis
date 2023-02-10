package com.oasis.admin.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.oasis.admin.dao.AdminNoticeDAO;

import lombok.AllArgsConstructor;

@Service("adminNoticeService")
@AllArgsConstructor
public class AdminNoticeServiceImpl implements AdminNoticeService {

	AdminNoticeDAO adminNoticeDAO;

//	공지사항 리스트 불러오기
	@Override
	public List<Map<String, Object>> adminNoticeList(Map<String, Object> map) throws Exception {
		String[] typeArr = String.valueOf(map.get("type")).split("");
		map.put("typeArr", typeArr);
		return adminNoticeDAO.noticeList(map);
	}

//	공지사항 상세보기
	@Override
	public Map<String, Object> adminNoticeDetail(Map<String, Object> map) throws Exception {
		return adminNoticeDAO.noticeDetail(map);
	}

//  공지사항 수정
	@Override
	public void adminNoticeUpdate(Map<String, Object> map, HttpServletRequest request) throws Exception {
		adminNoticeDAO.NoticeUpdate(map);
	}

//	공지사항 작성
	@Override
	public void adminNoticeWrite(Map<String, Object> map) throws Exception {
		adminNoticeDAO.noticeWrite(map);
	}

//  공지사항 삭제
	@Override
	public void adminNoticeDelete(Map<String, Object> map) throws Exception {
		adminNoticeDAO.noticeDelete(map);

	}

}
