package kr.co.codemaker.user.cart.controller;

import java.net.URI;
import java.net.URISyntaxException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import kr.co.codemaker.user.cart.vo.KakaoPayReadyVO;

@Service("kakao")
public class KakaoPay {
	private static final Logger logger = LoggerFactory.getLogger(KakaoPay.class);
	private static final String HOST = "https://kapi.kakao.com/v1/payment/ready";
	private KakaoPayReadyVO kakaoPayReadyVo;
	
	public String kakaoPayReady() {
		RestTemplate restTemplate = new RestTemplate();
		
		//서버로 요청할 header
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK 80498dac11d5ee25d3fd2a587144ded1");
		headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
		headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE+";charset=UTF-8");
		logger.debug("헤더설정");
		//서버로 요청할 body
		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("cid", "TC0ONETIME");
		params.add("partner_order_id", "1233");
		params.add("partner_user_id", "a001");
		params.add("item_name", "코드메이커 강의");
		params.add("quantity", "1");
		params.add("total_amount", "12000");
		params.add("tax_free_amount", "0");
		params.add("approval_url", "http://localhost:80/user/main");
		params.add("cancel_url", "http://localhost:80/user/login");
		params.add("fail_url", "http://localhost:80/user/selectSubject");
		logger.debug("바디설정");
		HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String,String>>(params, headers);
		logger.debug("헤더 바디");
		try {
			kakaoPayReadyVo = restTemplate.postForObject(new URI(HOST), body, KakaoPayReadyVO.class);
			return kakaoPayReadyVo.getNext_redirect_pc_url();
		} catch (RestClientException | URISyntaxException e) {
			e.printStackTrace();
		}
		logger.debug("여기까지 오나?");
		return "";
	}
}
