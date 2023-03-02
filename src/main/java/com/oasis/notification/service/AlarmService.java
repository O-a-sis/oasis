package com.oasis.notification.service;

import java.util.List;
import java.util.Map;

public interface AlarmService {

	public List<Map<String, Object>> getAlarms(Map<String, Object> map) throws Exception;
	
}
