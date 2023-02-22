package com.oasis.notification;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import com.oasis.notification.service.AlarmService;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class NotificationController {

	private final NotificationService notificationService;
	private AlarmService alarmService;

	@GetMapping(value = "/subscribe/{phone}", produces = MediaType.TEXT_EVENT_STREAM_VALUE)
	public SseEmitter subscribe(@PathVariable String phone,
			@RequestHeader(value = "Last-Event-ID", required = false, defaultValue = "") String lastEventId) {
		return notificationService.subscribe(phone, lastEventId);
	}
	
	@GetMapping(value = "/alarms/{id}" , consumes = "application/json", produces = {
			MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<Map<String, Object>> getAlarms(@PathVariable("id") String id) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("B_IDX", id);
		List<Map<String, Object>> list = alarmService.getAlarms(paramMap);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("list", list);
		
		return new ResponseEntity<Map<String, Object>>(resultMap, HttpStatus.OK);
	}
	
	@PostMapping("/test/{phone}")
	public void testnoti(@PathVariable String phone) {
		notificationService.send(phone, "알림 테스트", "memberOrder", "");
	}
}
