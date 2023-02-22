package com.oasis.Payment.kakao.controller;
import java.io.UnsupportedEncodingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
    
    @PostMapping("/kakaoPay")
    public String kakaoPay(CommandMap commandMap) throws UnsupportedEncodingException {
        log.info("kakaoPay post............................................");
        
        return "redirect:" + kakaopay.kakaoPayReady(commandMap.getMap());
 
    }
    
    @GetMapping("/kakaoPaySuccess")
    public void kakaoPaySuccess(CommandMap commandMap, Model model) {
        log.info("kakaoPaySuccess get............................................");
        log.info("kakaoPaySuccess pg_token : " + commandMap.get("pg_token"));
        
        model.addAttribute("info", kakaopay.kakaoPayInfo(commandMap.getMap()));
        
    }
    
}
