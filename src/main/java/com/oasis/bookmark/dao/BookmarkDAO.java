package com.oasis.bookmark.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.oasis.common.dao.AbstractDAO;

@Repository("BookmarkDAO")
public class BookmarkDAO extends AbstractDAO{

	public int write(Map<String, Object> map)throws Exception{
		return(int)insert("Bookmark.writeBookmark", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> getList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("bookmark.getBookmarkList", map);
	}
	
	public int delete(Map<String, Object> map)throws Exception{
		return (int)delete("bookmark.deleteBookmark", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> getSmemberBookmarkList(Map<String, Object> map) throws Exception{
		return (Map<String, Object>)selectOne("bookmark.getSmemberBookmarkList", map);
	}
}
