package com.oasis.notification.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.oasis.notification.dao.AlarmDAO;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class AlarmServiceImpl implements AlarmService{

	private AlarmDAO alarmDAO;
	
	@Override
	public List<Map<String, Object>> getAlarms(Map<String, Object> map) throws Exception {
		return alarmDAO.getAlarms(map);
	}

}
