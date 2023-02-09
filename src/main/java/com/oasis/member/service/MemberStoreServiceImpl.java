package com.oasis.member.service;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.oasis.member.dao.*;

import lombok.AllArgsConstructor;

@Service("memberstoreService")
@AllArgsConstructor
public class MemberStoreServiceImpl implements MemberStoreService {

	private MemberStoreDAO memberStoreDAO;

	@Override
	public List<Map<String, Object>> selectStoreList(Map<String, Object> map) throws Exception {
	
		return memberStoreDAO.selectStoreList(map);
	}


	@Override
	public Map<String, Object> MemberStoreDetail(Map<String, Object> map) throws Exception {
	

		return memberStoreDAO.memberstoreDetail(map);
	}






}
