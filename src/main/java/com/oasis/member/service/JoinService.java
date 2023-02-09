package com.oasis.member.service;

import java.util.Map;

public interface JoinService {


	void insertMember(Map<String, Object> map) throws Exception;

	Map<String, Object> getMember (Map<String, Object> map) throws Exception;

}