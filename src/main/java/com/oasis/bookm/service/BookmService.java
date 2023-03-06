package com.oasis.bookm.service;

import java.util.List;
import java.util.Map;

public interface BookmService {
	
	
	public int deleteBookmark(Map<String, Object> map)throws Exception;
	
	public int writeBookmark(Map<String, Object> map)throws Exception;
	

	
	List<Map<String, Object>> getBookList(Map<String, Object> map) throws Exception;//매장목록;


}


