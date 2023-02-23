package com.oasis.Payment.kakao.service;

import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import com.oasis.Payment.kakao.domain.KakaoPayApprovalVO;
import com.oasis.Payment.kakao.domain.KakaoPayReadyVO;

import lombok.extern.java.Log;
 
@Service
@Log
public class KakaoPay {
 
    private static final String HOST = "https://kapi.kakao.com";
    
    private KakaoPayReadyVO kakaoPayReadyVO;
    private KakaoPayApprovalVO kakaoPayApprovalVO;
    private Map<String, Object> tmpMap;
    
    public String kakaoPayReady(Map<String, Object> map) throws UnsupportedEncodingException {
 
        RestTemplate restTemplate = new RestTemplate();
        
        tmpMap = new HashMap<String, Object>(map);
        
        String product = new String(String.valueOf(map.get("product")).getBytes("ISO-8859-1"), "UTF-8");

        // 서버로 요청할 Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + "11ebe2541cbc4b69fa182398040bf4c7");
        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");

        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");
        params.add("partner_order_id", String.valueOf(map.get("orderno")));
        params.add("partner_user_id", String.valueOf(map.get("userId")));
        params.add("item_name", product);
        params.add("quantity", String.valueOf(map.get("count")));
        params.add("total_amount", String.valueOf(map.get("price")));
        params.add("tax_free_amount", "0");
        params.add("approval_url", "http://localhost:8000/Oasis/kakaoPaySuccess?id="+map.get("userId")+"&orderno="+map.get("orderno")+"&price="+map.get("price"));
        params.add("cancel_url", "http://localhost:8000/Oasis/kakaoPayCancel");
        params.add("fail_url", "http://localhost:8000/Oasis/kakaoPaySuccessFail");
 
         HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
        try {
            kakaoPayReadyVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body, KakaoPayReadyVO.class);
            System.out.println(kakaoPayReadyVO);
            log.info("" + kakaoPayReadyVO);
            
            return kakaoPayReadyVO.getNext_redirect_pc_url();
 
        } catch (RestClientException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (URISyntaxException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
        return "/pay";
        
    }
    
    public KakaoPayApprovalVO kakaoPayInfo(Map<String, Object> map) {
    	 
        log.info("KakaoPayInfoVO............................................");
        log.info("-----------------------------");
        
        RestTemplate restTemplate = new RestTemplate();
 
        // 서버로 요청할 Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + "11ebe2541cbc4b69fa182398040bf4c7");
        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");

        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");
        params.add("tid", kakaoPayReadyVO.getTid());
        params.add("partner_order_id", String.valueOf(map.get("orderno")));
        params.add("partner_user_id", String.valueOf(map.get("id")));
        params.add("pg_token",String.valueOf(map.get("pg_token")));
        params.add("total_amount", String.valueOf(map.get("price")));
        
        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);

        try {
            kakaoPayApprovalVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), body, KakaoPayApprovalVO.class);
            log.info("" + kakaoPayApprovalVO);
          
            return kakaoPayApprovalVO;
        
        } catch (RestClientException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (URISyntaxException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
        return null;
    }
    
}