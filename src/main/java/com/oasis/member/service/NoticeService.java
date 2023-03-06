package com.oasis.member.service;

import java.util.List;
import java.util.Map;

public interface NoticeService {

	List<Map<String, Object>> noticeList(Map<String, Object> map) throws Exception;

	Map<String, Object> noticeDetail(Map<String, Object> map) throws Exception;
} 
