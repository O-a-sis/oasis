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

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class SmsController {

    private final SmsService smsService;

    // 핸드폰번호 중복체크 후 문자메세지 발송
    @PostMapping("/user/sms")
    public ResponseEntity<Map<String, Object>> test(@RequestBody Request request) throws NoSuchAlgorithmException, URISyntaxException, UnsupportedEncodingException, InvalidKeyException, JsonProcessingException {
    	
    	String random = smsService.makeRandom();
    	String msg = "Oasis에서 보낸 인증 번호 : "+random;
        SmsResponse data = smsService.sendSms(request.getRecipientPhoneNumber(), msg);
        Map<String, Object> returnMap = new HashMap<String, Object>();
        returnMap.put("SmsResponse", data);
        returnMap.put("checkKey", random);
        return new ResponseEntity<Map<String, Object>>(returnMap,HttpStatus.OK);
    }
}
