package com.oasis.member.service;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.oasis.member.dao.MemberStoreDAO;

import lombok.AllArgsConstructor;

@Service("memberStoreService")
@AllArgsConstructor
public class MemberStoreServiceImpl implements MemberStoreService {

	@SuppressWarnings("unused")
	private MemberStoreDAO memberStoreDAO;

	@Override
	public List<Map<String, Object>> getStoreList(Map<String, Object> map) throws Exception {
		return  memberStoreDAO.getStoreList(map);
		}

	@Override
	public Map<String, Object> storeDetail(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return memberStoreDAO.storeDetail(map);
	}



}