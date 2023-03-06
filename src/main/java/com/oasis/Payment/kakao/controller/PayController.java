package com.oasis.Payment.kakao.controller;
import java.io.UnsupportedEncodingException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.oasis.Payment.kakao.domain.KakaoPayApprovalVO;
import com.oasis.Payment.kakao.service.KakaoPay;
import com.oasis.common.CommandMap;

import lombok.Setter;
import lombok.extern.java.Log;
 
@Log
@Controller
public class PayController {
    
    @Setter(onMethod_ = @Autowired)
    private KakaoPay kakaopay;
    
    
    @GetMapping("/kakaoPay")
    public void kakaoPayGet() {
        
    }
    
    @PostMapping(value = "/kakaoPay", consumes = "application/json", produces = MediaType.TEXT_PLAIN_VALUE)
    public ResponseEntity<String> kakaoPay(@RequestBody Map<String, Object> map) throws Exception {
        log.info("kakaoPay post……………………………………..");
        
        return new ResponseEntity<String>(kakaopay.kakaoPayReady(map),HttpStatus.OK);
 
    }
    
    @GetMapping("/kakaoPaySuccess")
    public ModelAndView kakaoPaySuccess(CommandMap commandMap) throws Exception {
        log.info("kakaoPaySuccess get............................................");
        log.info("kakaoPaySuccess pg_token : " + commandMap.get("pg_token"));
        
        KakaoPayApprovalVO kakaoPayApprovalVO = kakaopay.kakaoPayInfo(commandMap.getMap());
        ModelAndView mv = new ModelAndView("redirect:/member/myOrderDetail.oa?O_IDX="+kakaoPayApprovalVO.getPartner_order_id());
        return mv;
    }
    
}
