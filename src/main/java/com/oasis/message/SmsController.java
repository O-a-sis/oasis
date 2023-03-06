package com.oasis.message;

import java.io.UnsupportedEncodingException;
import java.net.URISyntaxException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.oasis.member.service.JoinService;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class SmsController {

    private final SmsService smsService;
    private JoinService joinService;

    // 핸드폰번호 중복체크 후 문자메세지 발송
    @PostMapping("/user/sms")
    public ResponseEntity<Map<String, Object>> test(@RequestBody Request request) throws Exception {
    	
    	Map<String, Object> paramMap = new HashMap<String, Object>();
    	paramMap.put("B_PHONE", request.getRecipientPhoneNumber());
    	Map<String, Object> member = joinService.getMember(paramMap); // db에 있는지 검사
    	if (member==null || member.isEmpty()) {// 없으면
    		String random = smsService.makeRandom();
        	String msg = "Oasis에서 보낸 인증 번호 : "+random;
            SmsResponse data = smsService.sendSms(request.getRecipientPhoneNumber(), msg); // 메세지 발송
            
            Map<String, Object> returnMap = new HashMap<String, Object>();
            returnMap.put("SmsResponse", data);
            returnMap.put("checkKey", random); //인증번호
            returnMap.put("check", 1); //중복여부
            return new ResponseEntity<Map<String, Object>>(returnMap,HttpStatus.OK);			
		}else { //있으면
			Map<String, Object> returnMap = new HashMap<String, Object>();
			returnMap.put("check", 0); //중복여부
			return new ResponseEntity<Map<String, Object>>(returnMap,HttpStatus.OK);	
		}
    }
}
