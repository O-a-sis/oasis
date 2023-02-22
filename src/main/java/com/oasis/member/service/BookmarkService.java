package com.oasis.member.service;

import java.util.List;
import java.util.Map;



public interface BookmarkService {
	
	List<Map<String, Object>> getBookList(Map<String, Object> map) throws Exception;//매장목록;

	int writeBookmark(Map<String, Object> map);

}


