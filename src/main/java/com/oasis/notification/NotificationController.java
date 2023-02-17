package com.oasis.notification;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class NotificationController {

	private final NotificationService notificationService;

	@GetMapping(value = "/subscribe/{phone}", produces = MediaType.TEXT_EVENT_STREAM_VALUE)
	public SseEmitter subscribe(@PathVariable String phone,
			@RequestHeader(value = "Last-Event-ID", required = false, defaultValue = "") String lastEventId) {
		return notificationService.subscribe(phone, lastEventId);
	}
	
	@GetMapping("/notification")
	public ModelAndView test() {
		ModelAndView mv = new ModelAndView("notificationTest");
		return mv;
	}
	
	@PostMapping("/test/{phone}")
	public void testnoti(@PathVariable String phone) {
		notificationService.send(phone, "알림 테스트", "memberOrder", "");
	}
}
