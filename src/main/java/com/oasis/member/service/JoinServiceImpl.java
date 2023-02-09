package com.oasis.member.service;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.oasis.member.dao.JoinDAO;

import lombok.AllArgsConstructor;

@Service("joinService")
@AllArgsConstructor
public class JoinServiceImpl implements JoinService{

	private JoinDAO joinDAO;

	@Override
	public void insertMember(Map<String, Object> map) throws Exception {
		joinDAO.insertMember(map);
	}
}