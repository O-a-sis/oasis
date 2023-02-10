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
		return (List<Map<String, Object>>) selectList("admin.adminNoticeList", map);
	}

//	공지사항 작성 기능
	public void noticeWrite(Map<String, Object> map) throws Exception {
		insert("admin.adminNoticeWrite", map);
	}

//	공지사항 상세보기
	@SuppressWarnings("unchecked")
	public Map<String, Object> noticeDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("admin.adminNoticeDetail", map);
	}

//	공지사항 수정 기능
	public void NoticeUpdate(Map<String, Object> map) throws Exception {
		update("admin.adminNoticeUpdate", map);
	}

//	공지사항 삭제 기능
	public void noticeDelete(Map<String, Object> map) throws Exception {
		update("admin.adminNoticeDelete", map);
	}

}
