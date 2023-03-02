package com.oasis.member.service;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.oasis.bookm.dao.BookmDAO;
import com.oasis.member.dao.MemberStoreDAO;

import lombok.AllArgsConstructor;

@Service("memberStoreService")
@AllArgsConstructor
public class MemberStoreServiceImpl implements MemberStoreService {

	@SuppressWarnings("unused")
	private MemberStoreDAO memberStoreDAO;
	private BookmDAO bookmDAO;


	@Override
	public List<Map<String, Object>> getStoreList(Map<String, Object> map) throws Exception {
		
		List<Map<String,Object>> storeList = memberStoreDAO.getStoreList(map); 
		
		if(map.get("B_PHONE")==null) {
			return storeList;
			
			
		}else {
		List<Map<String, Object>> bookmarkList = bookmDAO.getBookList(map);
		for (Map<String, Object> store : storeList) {
			for (Map<String, Object> bookmark : bookmarkList) {
				if (String.valueOf(store.get("STORE")).equals(String.valueOf(bookmark.get("STORE")))) {
					store.put("check", true);
					store.put("B_IDX", bookmark.get("B_IDX"));
					break;
				}else {
					store.put("check", false);
				}
			}
		}
		return storeList;
		}

	}

//	@Override
//	public Map<String, Object> storeDetail(Map<String, Object> map) throws Exception {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	@Override
//	public Map<String, Object> storeDetail(Map<String, Object> map) throws Exception {
//		// TODO Auto-generated method stub
//		return memberStoreDAO.storeDetail(map);
//	}


}