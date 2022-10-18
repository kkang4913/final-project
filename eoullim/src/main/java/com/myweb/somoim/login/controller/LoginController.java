package com.myweb.somoim.login.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.myweb.somoim.categorys.model.CategorysDTO;
import com.myweb.somoim.categorys.service.CategorysService;
import com.myweb.somoim.common.model.LocationsDTO;
import com.myweb.somoim.common.service.LocationsService;
import com.myweb.somoim.members.model.MembersDTO;
import com.myweb.somoim.members.service.MembersService;

@Controller
public class LoginController {

	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;


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

	// 일반 로그인 / 네이버 로그인 같이 사용 view
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String home(Model model, HttpSession session) {
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		System.out.println("### 일반 로그인 + 네이버 로그인 버튼을 사용하기 위해 Model에 데이터 값을 할당하여 보내준다#### ");
		// 네이버 로그인을 위한 정보가 담긴 주소
		model.addAttribute("url", naverAuthUrl);
		return "form/login";
	}

	// 로그인 기능
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(MembersDTO membersDTO, HttpSession session, Model model, HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(value = "userCookies", required = false) boolean checkboxValue) {
		System.out.println("체크박스" + checkboxValue);

		if (session.getAttribute("loginData") != null) {
			// 기존의 loginData 란 세션 값이 존재한다면 제거
			session.removeAttribute("loginData"); // 기존 값 제거후 로그인
		}
		MembersDTO data = membersService.getLogin(membersDTO);

		if (data != null) {
			// 로그인 성공
			session.setAttribute("loginData", data);
			System.out.println("일반 로그인 데이터 확인 : " + data);
			if (checkboxValue) {
				Cookie cookie = new Cookie("loginCookie", session.getId());
				cookie.setPath("/");
				cookie.setMaxAge(60);
				response.addCookie(cookie);
			}
			return "redirect:/";
		} else {
			// 로그인 실패
			model.addAttribute("loginError", "아이디(로그인 전용 아이디) 또는 비밀번호를 잘못 입력했습니다.\n"
												+ "입력하신 내용을 다시 확인해주세요.");
			return home(model, session);
		}
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		// session.invalidate();
		session.invalidate();
		return "somoim_m";
	}

	@RequestMapping(value = "findId", method = RequestMethod.GET)
	public String findId(Locale locale, Model model) {

		return "form/findId";
	}

	@PostMapping(value = "findId", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String findId(MembersDTO data) throws Exception {
		MembersDTO result = membersService.selectFindId(data);
		JSONObject json = new JSONObject();
		System.out.println(result == null);
		if (result == null) {
			System.out.println("a");
			json.put("code", "noData");
			json.put("message", "해당 데이터가 존재하지 않습니다.");
		} else if (result != null && result.getLoginType().equals("somoim")) {
			System.out.println("bbb");
			json.put("code", "success");
			json.put("id", result.getMemberId());
		} else if (result != null) {
			System.out.println("c");
			if (result.getLoginType().equals("kakao") || result.getLoginType().equals("naver")) {
				json.put("code", "noType");
				json.put("message", "소셜 서비스로 가입한 계정입니다. 확인해주세요.");
			}
		}
		System.out.println("bbb");
		return json.toJSONString();
	}

	@RequestMapping(value = "findPw", method = RequestMethod.GET)
	public String findPw(Locale locale, Model model) {

		return "form/findPw";
	}

	@PostMapping(value = "findPw", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String findPw(MembersDTO data) throws Exception {
		MembersDTO result = membersService.selectFindPw(data);
		JSONObject json = new JSONObject();

		if (result == null) {
			json.put("code", "noData");
			json.put("message", "해당 데이터가 존재하지 않습니다.");
		} else {
			json.put("code", "success");
			json.put("pw", result.getPassword());

		}

		return json.toJSONString();
	}

	@RequestMapping(value = "idChk", produces = "application/json; charset=utf-8")
	@ResponseBody
	public int idChk(MembersDTO membersDTO) throws Exception {
		
		
		int result = membersService.idChk(membersDTO);
		// 아이디 중복 체크 버튼 클릭 시
		// 아이디 중복 = 1
		// 아이디 중복이 아니면 = 0
		return result;
	}

	@RequestMapping(value = "/phoneChk", produces = "application/json; charset=utf-8")
	@ResponseBody
	public int phoneChk(MembersDTO membersDTO) throws Exception {
		int result = membersService.phoneChk(membersDTO);
		return result;
	}

	// 회원가입 view
	@RequestMapping(value = "join", method = RequestMethod.GET)
	public String join(Locale locale, Model model) {
		List<LocationsDTO> locDatas = locSerivce.getAll();
		List<CategorysDTO> categorysDatas = categorysService.getAll();

		model.addAttribute("categorysDatas", categorysDatas);
		model.addAttribute("locDatas", locDatas);
		return "form/join";
	}

	// 회원가입 기능
	@RequestMapping(value = "addJoin", method = RequestMethod.POST)
	public String addJoin(MembersDTO membersDTO, HttpServletRequest request,
			@RequestParam(required = false) String year, @RequestParam(required = false) String month,
			@RequestParam(required = false) String day, @RequestParam(required = false) String memberName,
			@RequestParam(required = false, defaultValue = "/resources/img/members/basicImg.png") String memberImagePath,
			@RequestParam(required = false, defaultValue = "/resources/img/members/bakImg.png") String infoImagePath) {

		if (month.length() < 2) {
			month = "0" + month;
		}
		if (day.length() < 2) {
			day = "0" + day;
		}
		System.out.println(month + "###" + day);

		String bitrhs = year + month + day;

		String imagePath = request.getContextPath() + memberImagePath;
		String infoImgPath = request.getContextPath() + infoImagePath;

		System.out.println("프로필 패스:" + imagePath);
		System.out.println("배경 패스:" + infoImgPath);
		
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
		data.setInfoImagePath(infoImgPath);
		// 일반 로그인 컨트롤를 통한 회원가입의 loginType --> somoim
		data.setLoginType("somoim");

		System.out.println("일반 회원가입 유저 정보 = " + data);

		boolean result = membersService.addData(data);

		if (result) {
			return "form/join";
		} else {
			return "form/join";
		}
	}

}
