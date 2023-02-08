package com.oasis.member.service;

import org.springframework.stereotype.Service;

import com.oasis.member.dao.LoginDAO;

import lombok.AllArgsConstructor;

@Service("loginService")
@AllArgsConstructor
public class LoginServiceImpl implements LoginService{

		private LoginDAO loginDAO;
}
