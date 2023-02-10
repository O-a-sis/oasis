package com.oasis.member.service;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.oasis.member.dao.LoginDAO;

import lombok.AllArgsConstructor;

@Service("loginService")
@AllArgsConstructor
public class LoginServiceImpl implements LoginService{

		private LoginDAO loginDAO;
		
		@Override
		public Map<String, Object> getMember(Map<String, Object> map) throws Exception {
		return loginDAO.getMember(map);
	}
}
