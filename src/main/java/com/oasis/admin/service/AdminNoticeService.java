package com.oasis.admin.service;

import java.util.List;
import java.util.Map;

public interface AdminNoticeService {
	
	List<Map<String, Object>> adminNoticeList(Map<String, Object> map) throws Exception;  //공지사항 목록
	
	Map<String, Object> adminNoticeDetail(Map<String, Object> map) throws Exception; //공지사항 상세보기 
	
	void adminNoticeWrite(Map<String, Object> map) throws Exception; //공지사항 입력
	
	void adminNoticeUpdate(Map<String, Object> map) throws Exception;  //공지사항 수정
	
	void adminNoticeDelete(Map<String, Object> map) throws Exception;  //공지사항 삭제

	

	

	

}
