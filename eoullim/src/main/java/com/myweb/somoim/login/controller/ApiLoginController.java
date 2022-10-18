package com.myweb.somoim.login.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.net.http.HttpRequest;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.myweb.somoim.categorys.model.CategorysDTO;
import com.myweb.somoim.categorys.service.CategorysService;
import com.myweb.somoim.common.model.LocationsDTO;
import com.myweb.somoim.common.service.LocationsService;
import com.myweb.somoim.members.model.MembersDTO;
import com.myweb.somoim.members.service.MembersService;

@Controller
public class ApiLoginController {
	
	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	
	
	@Autowired
	private LocationsService locSerivce;
	
	@Autowired
	private CategorysService categorysService;
	
	@Autowired
	private MembersService membersService;
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	
	@RequestMapping(value = "socialAddJoin", method = RequestMethod.POST)
	public String kakaoAddJoin(MembersDTO membersDTO
			,HttpServletRequest request
			,HttpSession session
			,Model  model
			,@RequestParam (required = false) String year
			,@RequestParam (required = false) String month
			,@RequestParam (required = false) String day
			,@RequestParam (required = false) String memberName
			,@RequestParam (required = false, defaultValue ="/resources/img/members/basicImg.png" ) String memberImagePath
			,@RequestParam (required = false) String loginType) {
		
		
		if (month.length() < 2) {
			month = "0"+month;
		}
		if (day.length() < 2) {
			day = "0"+day;
		}
		System.out.println("월 = "+ month);
		System.out.println("일 = "+ day);
		System.out.println(membersDTO);
		
		
		String bitrhs = year+month+day;
		
		String imagePath = request.getContextPath() + memberImagePath;
		
		MembersDTO data = new MembersDTO();

		data.setMemberId(membersDTO.getMemberId());
		data.setMemberName(membersDTO.getMemberName());
		data.setPassword(membersDTO.getPassword());
		data.setGender(membersDTO.getGender());
		data.setBirth(membersDTO.getBirth());
		data.setPhone(membersDTO.getPhone());
		data.setCategory(membersDTO.getCategory());
		data.setLocationId(membersDTO.getLocationId());
		data.setBirth(bitrhs);
		data.setMemberImagePath(imagePath);
		// 카카오 로그인 컨트롤를 통한 회원가입의 loginType --> kakao
		System.out.println("#####" +"["+loginType+"]" +"#####");
		data.setLoginType(loginType);
		
		
		
		boolean result = membersService.addData(data);
		
		if ( session.getAttribute("loginData") != null) {
			//기존의 loginData 란 세션 값이 존재한다면 제거
			session.removeAttribute("loginData");   //기존 값 제거후 로그인
		}
		
		MembersDTO socialdata = membersService.getLogin(membersDTO);
		
		if(data !=null && result ==true) {
			// 로그인 성공
			System.out.println("소셜"+"["+loginType+"]" +" 로그인 데이터 확인 : " + socialdata);
			session.setAttribute("loginData", socialdata);
			return "redirect:/";
		}else {
			return "form/join";
		}
		
}
	@RequestMapping(value = "/login/kakao",method = RequestMethod.GET)
	public String kakaoLogin() {
		UriComponents kakaoAuthUri = UriComponentsBuilder.newInstance()
				.scheme("https").host("kauth.kakao.com").path("/oauth/authoize")
				.queryParam("client_id","9e97acd24d70a166f8d300fad1b72ab7" )
				.queryParam("redirect_uri", "http://localhost:8080/somoim/login/kakao/auth_code")
				.queryParam("response_type", "code").build();
		
		RestTemplate rest = new RestTemplate();
		
		CloseableHttpClient httpCilent = HttpClientBuilder.create().disableRedirectHandling().build();
		
		HttpComponentsClientHttpRequestFactory factory = new HttpComponentsClientHttpRequestFactory();
		
		factory.setHttpClient(httpCilent);
		rest.setRequestFactory(factory);
		
		ResponseEntity<String> restResponse = rest.getForEntity(kakaoAuthUri.toUriString(), String.class);
	
		return "redirect:" + restResponse.getHeaders().getLocation();
	}
	
	@RequestMapping(value = "/kakaoIdChk",produces="application/json; charset=utf-8")
	@ResponseBody
	public int kakapIdChk(MembersDTO membersDTO) throws Exception {
		int result = membersService.kakaoIdChk(membersDTO);
		// 아이디 중복 체크 버튼 클릭 시 
		// 아이디 중복 = 1
		// 아이디 중복이 아니면 = 0
		return result;
	}
	
	
	
	
	@RequestMapping(value = "/login/kakao/auth_code", method = RequestMethod.GET)
	public String kakaoAuthCode(HttpSession SessionStatus
			,HttpSession session
			,Model model
			,String code, String error, String state
			,@RequestParam(name="error_descripition",required = false)String Descripition) {
			String tokenType = null, accessToken =null, refreshToken = null;
			long expiresIn = -1, refreshTokenExpiresIn = -1;
			
			if (error == null) {
				UriComponents kakaoAuthUri = UriComponentsBuilder.newInstance()
						.scheme("https").host("kauth.kakao.com").path("/oauth/token").build();
				
				HttpHeaders headers = new HttpHeaders();
				headers.add("Content-type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=utf-8");
				
				MultiValueMap<String, String> param = new LinkedMultiValueMap<String, String>();
				param.add("grant_type", "authorization_code");
				param.add("client_id","9e97acd24d70a166f8d300fad1b72ab7" );
				param.add("redirect_uri", "http://localhost:8080/somoim/login/kakao/auth_code");
				param.add("code",code);
				
				
				HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<MultiValueMap<String,String>>(param,headers);
				
				RestTemplate rest = new RestTemplate();
				rest.setRequestFactory(new HttpComponentsClientHttpRequestFactory());
				
				ResponseEntity<String> restResponse = rest.postForEntity(kakaoAuthUri.toUriString(), entity, String.class);
				
				JSONParser jsonParser = new JSONParser();
				try {
					JSONObject json = (JSONObject)jsonParser.parse(restResponse.getBody());
					
					tokenType = json.get("token_type").toString();
					
					accessToken = json.get("access_token").toString();
					
					expiresIn = Long.valueOf(json.get("expires_in").toString());
					
					refreshToken = json.get("refresh_token").toString();
					
					refreshTokenExpiresIn = Long.valueOf(json.get("refresh_token_expires_in").toString());
					    System.out.println("[code] = " + code);
			            System.out.println("[access_token] = " + accessToken);
		                System.out.println("[refresh_token] = " + refreshToken);
		                
		                HashMap<String, Object> userInfo = membersService.getUserInfo(accessToken);
		               
		                System.out.println("-------카카오 로그인-------");
		                System.out.println("##kakaoId## : " + userInfo.get("kakaoId"));
		                System.out.println("##nickname## : " + userInfo.get("nickname"));
		                System.out.println("##birthmonthy## : " + userInfo.get("month"));
		                System.out.println("##birthday## : " + userInfo.get("day"));
		                System.out.println("##email## : " + userInfo.get("email"));
		                
		                userInfo.put("loginType", "kakao");
		                List<LocationsDTO> locDatas = locSerivce.getAll();
		        		List<CategorysDTO> categorysDatas = categorysService.getAll();
		        		
		        		model.addAttribute("categorysDatas",categorysDatas);
		        		model.addAttribute("locDatas", locDatas);
		                model.addAttribute("userInfo", userInfo);
		                
		                MembersDTO loginInfoChk = membersService.typeSelectLogin(userInfo);
		                
		                System.out.println("카카로 로그인 시 데이터 베이스에 id + 로그인 타입이 있다면 바로 로그인 실행");
		                System.out.println(loginInfoChk);
		                if (loginInfoChk != null) {
						   session.setAttribute("loginData", loginInfoChk);
						   session.setAttribute("accessToken", accessToken);
						   return "redirect:/";
		                }
		                
				} catch (ParseException e) {
				 e.printStackTrace();
				}
			}
		return "form/kakaoJoin";
	}
	@RequestMapping(value="/login/kakao/kakaoLogout",method = RequestMethod.GET)
	public String kakapLogout(HttpSession session) {
	    membersService.kakaoLogout((String)session.getAttribute("accessToken"));
	    session.invalidate();
	    System.out.println("로그아웃이 확인되었습니다.");
	    return "redirect:/";
	}
	
	//로그인 첫 화면 요청 메소드
	@RequestMapping(value = "/login/naver", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(Model model, HttpSession session) {
	/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
	String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
	//https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
	//redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
	System.out.println("네이버:" + naverAuthUrl);
	//네이버
	model.addAttribute("url", naverAuthUrl);
	return "form/login";
	}
	
	//네이버 로그인 성공시 callback호출 메소드
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "login/naver/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws IOException, ParseException {
	System.out.println("여기는 callback");
	System.out.println("#####네이버 로그인에 성공 하였습니다.######");
	System.out.println("지금 보여지는 view 페이지는 로그인 성공시 나오는 callback jsp 입니다.");
	OAuth2AccessToken oauthToken;
	oauthToken = naverLoginBO.getAccessToken(session, code, state);
	//1. 로그인 사용자 정보를 읽어온다.
	apiResult = naverLoginBO.getUserProfile(oauthToken); //String형식의 json데이터
	/** apiResult json 구조
	{"resultcode":"00",
	"message":"success",
	"response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
	**/
	//2. String형식인 apiResult를 json형태로 바꿈
	JSONParser parser = new JSONParser();
	Object obj = parser.parse(apiResult);
	JSONObject jsonObj = (JSONObject) obj;
	//3. 데이터 파싱
	//Top레벨 단계 _response 파싱
	JSONObject NUserInfo = (JSONObject)jsonObj.get("response");
	//response의 nickname값 파싱
	String name = (String)NUserInfo.get("name");
	String nickname = (String)NUserInfo.get("nickname");
	String email = (String)NUserInfo.get("email");
	String birthday = (String)NUserInfo.get("birthday");
	String birthyear = (String)NUserInfo.get("birthyear");
	String gender = (String)NUserInfo.get("gender");
	String mobile = (String)NUserInfo.get("mobile");
	System.out.println("------------로그인 정보--------------");
	System.out.println("이름 = " + name);
	System.out.println("닉네임 = " + nickname);
	System.out.println("이메일 = " + email);
	System.out.println("birthday = " + birthday);
	//월.일은 spilt으로 나눠 저장 
	String[] birth = birthday.split("-");
	
	String BMonth = birth[0];	
	String BDay = birth[1];	
	NUserInfo.put("BMonth", BMonth);
	NUserInfo.put("BDay", BDay);
	
	String Month = (String)NUserInfo.get("BMonth");
	String Day = (String)NUserInfo.get("BDay");
	
	System.out.println("월 = " + Month);
	System.out.println("일 = " + Day);
	
	System.out.println("birthyear = " + birthyear);
	System.out.println("gender = " + gender);
	
	if (gender.equals("M")) {
		NUserInfo.put("gen", "남자");
	}else if (gender.equals("F")) {
		NUserInfo.put("gen", "여자");
	}
	System.out.println("mobile = " + mobile);
	String mobileNum = mobile.replaceAll("-", "");
	System.out.println(mobileNum);
	
	//네이버 로그인 -> 추가정보 입력시 로그인 타입 생성
	NUserInfo.put("loginType", "naver");
	NUserInfo.put("mobileNum", mobileNum);
	//4.파싱 닉네임 세션으로 저장
	session.setAttribute("sessionId",nickname); //세션 생성
	model.addAttribute("result", apiResult);
	model.addAttribute("NUserInfo", NUserInfo);
	  	List<LocationsDTO> locDatas = locSerivce.getAll();
		List<CategorysDTO> categorysDatas = categorysService.getAll();
		
		model.addAttribute("categorysDatas",categorysDatas);
		model.addAttribute("locDatas", locDatas);
        
		MembersDTO loginInfoChk = membersService.typeSelectLogin(NUserInfo);
        
        System.out.println("네이버 로그인 시 데이터 베이스에 id + 로그인 타입이 있다면 바로 로그인 실행");
        System.out.println(loginInfoChk);
        if (loginInfoChk != null) {
		   session.setAttribute("loginData", loginInfoChk);
		   return "redirect:/";
		}
	return "form/naverJoin";
	}
}
