package com.oasis.member.service;

import java.util.Map;

public interface LoginService {

	Map<String, Object> getMember(Map<String, Object> map) throws Exception;
	
	Map<String, Object> findPassword(Map<String, Object> map) throws Exception;
}