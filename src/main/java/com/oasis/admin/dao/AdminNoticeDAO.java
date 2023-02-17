package com.oasis.admin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.oasis.common.dao.AbstractDAO;

@Repository("adminNoticeDAO")
public class AdminNoticeDAO extends AbstractDAO {

//	공지사항 리스트 불러오기
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> noticeList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("admin.noticeList", map);
	}

//	공지사항 작성 기능
	public void noticeWrite(Map<String, Object> map) throws Exception {
		insert("admin.noticeWrite", map);
	}

//	공지사항 상세보기
	@SuppressWarnings("unchecked")
	public Map<String, Object> noticeDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("admin.noticeDetail", map);
	}

//	공지사항 수정 기능
	public void noticeUpdate(Map<String, Object> map) throws Exception {
		update("admin.noticeUpdate", map);
	}

//	공지사항 삭제 기능
	public void noticeDelete(Map<String, Object> map) throws Exception {
		update("admin.noticeDelete", map);
	}

	//메인에 올릴 공지사항이미지
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> mainImg(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("admin.mainImg", map);
	}
	
}
