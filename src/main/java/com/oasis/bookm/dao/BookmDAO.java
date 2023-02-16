package com.oasis.bookm.dao;



import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.oasis.common.dao.AbstractDAO;

@Repository("BookmDAO")
public class BookmDAO extends AbstractDAO{
	
	/*왜안돼*/

	
	
	public int deleteBookmark(Map<String, Object> map)throws Exception{
		return (int)delete("bookmark.deleteBookmark", map);
	}
	
	public int writeBookmark(Map<String, Object> map)throws Exception{
		return(int)insert("bookmark.writeBookmark", map);
	}
	

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> getBookList(Map<String, Object> map)throws Exception {
		return (List<Map<String, Object>>)selectList("bookmark.getBookList", map);
	}

	

}