package com.oasis.notification.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.oasis.common.dao.AbstractDAO;

@Repository("alarmDAO")
public class AlarmDAO extends AbstractDAO {

	public List<Map<String, Object>> getAlarms(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("alarm.getAlarmList", map);
	}

	public int updateRead(Map<String, Object> map) throws Exception {
		return (int) update("alarm.updateRead", map);
	}

	public int writeAlarm(Map<String, Object> map) throws Exception {
		return (int) insert("alarm.writeAlarm", map);
	}
}
