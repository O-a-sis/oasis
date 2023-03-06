package com.oasis.Payment.kakao.service;

import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import com.oasis.Payment.kakao.domain.KakaoPayApprovalVO;
import com.oasis.Payment.kakao.domain.KakaoPayReadyVO;
import com.oasis.member.dao.MenuDAO;
import com.oasis.member.dao.MyTabDAO;
import com.oasis.notification.NotificationService;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.extern.java.Log;

@Service
@Log
public class KakaoPay {

	private static final String HOST = "https://kapi.kakao.com";

	@Autowired
	private MenuDAO menuDAO;
	@Autowired
	private MyTabDAO myTabDAO;
	@Autowired
	private NotificationService notificationService;
	private KakaoPayReadyVO kakaoPayReadyVO;
	private KakaoPayApprovalVO kakaoPayApprovalVO;
	private Map<String, Object> tmpMap;

	public String kakaoPayReady(Map<String, Object> map) throws Exception {

		RestTemplate restTemplate = new RestTemplate();

		Map<String, Object> OIDX = menuDAO.selectNextOIDX();

		map.put("O_IDX", OIDX.get("O_IDX"));

		tmpMap = new HashMap<String, Object>(map);
		log.info(map.toString());
		String product = new String(String.valueOf(map.get("O_CONTENT")).getBytes("ISO-8859-1"), "UTF-8");
		log.info(product);
		// 서버로 요청할 Header
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK " + "11ebe2541cbc4b69fa182398040bf4c7");
		headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
		headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");

		// 서버로 요청할 Body
		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		params.add("cid", "TC0ONETIME");
		params.add("partner_order_id", String.valueOf(map.get("O_IDX")));
		params.add("partner_user_id", String.valueOf(map.get("OB_IDX")));
		params.add("item_name", String.valueOf(map.get("O_CONTENT")));
		params.add("quantity", String.valueOf(map.get("O_COUNT")));
		params.add("total_amount", String.valueOf(map.get("O_SUM")));
		params.add("tax_free_amount", "0");
		params.add("approval_url", "http://localhost:8000/Oasis/kakaoPaySuccess");
		params.add("cancel_url", "http://localhost:8000/Oasis/kakaoPayCancel");
		params.add("fail_url", "http://localhost:8000/Oasis/kakaoPaySuccessFail");
		log.info(params.toString());
		HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
		try {
			kakaoPayReadyVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body,
					KakaoPayReadyVO.class);
			System.out.println(kakaoPayReadyVO);
			log.info("" + kakaoPayReadyVO);

			return kakaoPayReadyVO.getNext_redirect_pc_url();

		} catch (RestClientException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			log.info(e.getMessage());
		} catch (URISyntaxException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "/pay";

	}

	@Transactional
	public KakaoPayApprovalVO kakaoPayInfo(Map<String, Object> map) throws Exception {

		log.info("KakaoPayInfoVO............................................");
		log.info("-----------------------------");

		RestTemplate restTemplate = new RestTemplate();
		System.out.println(tmpMap);
		// 서버로 요청할 Header
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK " + "11ebe2541cbc4b69fa182398040bf4c7");
		headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
		headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");

		// 서버로 요청할 Body
		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		params.add("cid", "TC0ONETIME");
		params.add("tid", kakaoPayReadyVO.getTid());
		params.add("partner_order_id", String.valueOf(tmpMap.get("O_IDX")));
		params.add("partner_user_id", String.valueOf(tmpMap.get("OB_IDX")));
		params.add("pg_token", String.valueOf(map.get("pg_token")));
		params.add("total_amount", String.valueOf(tmpMap.get("O_SUM")));

		HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);

		try {
			kakaoPayApprovalVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), body,
					KakaoPayApprovalVO.class);
			log.info("" + kakaoPayApprovalVO);
			
			// 오더 작성
			menuDAO.insertOrder(tmpMap);
			// 받아온 메뉴 리스트
			List<Map<String, Object>> menuList = (List<Map<String, Object>>) tmpMap.get("menuList");
			for (Map<String, Object> menu : menuList) {
				menu.put("OM_IDX", tmpMap.get("O_IDX"));
				menuDAO.insertOrderMenu(menu); // 주문메뉴 인서트
			}
			// 결제 승인 후 장바구니 비우기
			tmpMap.put("B_PHONE", tmpMap.get("OB_IDX"));
			menuDAO.cartDeleteAll(tmpMap);

			// 쿠폰 사용했다면 쿠폰 사용처리
			if (tmpMap.get("OCU_IDX")!=null) {
				myTabDAO.updateCoupon(tmpMap);
			}
			
			
			myTabDAO.updateStamp(tmpMap);
			
			
			notificationService.send(String.valueOf(tmpMap.get("O_STORE")),"주문이 들어왔습니다.", "storeOrder", "");
			
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