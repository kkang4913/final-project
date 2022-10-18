package com.myweb.somoim.controller;

import java.awt.print.Pageable;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.myweb.somoim.common.model.LocationsDTO;
import com.myweb.somoim.common.service.FileUploadService;
import com.myweb.somoim.common.service.LocationsService;
import com.myweb.somoim.members.model.MembersDTO;
import com.myweb.somoim.members.service.MembersService;
import com.myweb.somoim.moim.model.BoardsDTO;
import com.myweb.somoim.moim.model.CommentsDTO;
import com.myweb.somoim.moim.service.BoardsService;
import com.myweb.somoim.moim.service.CommentsService;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import com.myweb.somoim.categorys.model.CategorysDTO;
import com.myweb.somoim.categorys.service.CategorysService;
import com.myweb.somoim.common.model.PagingDTO;
import com.myweb.somoim.members.model.MembersDTO;
import com.myweb.somoim.members.service.MembersService;
import com.myweb.somoim.model.SomoimDTO;
import com.myweb.somoim.participants.model.MoimParticipantsDTO;
import com.myweb.somoim.participants.service.MoimParticipantsService;
import com.myweb.somoim.service.SomoimService;

@Controller
public class SomoimController {
	
	private static final Logger logger = LoggerFactory.getLogger(SomoimController.class);
	
	@Autowired
	private SomoimService service;
	@Autowired
	private MembersService membersService;
	@Autowired
	private CategorysService categoryService;
	@Autowired
	private BoardsService boardsService;
	@Autowired
	private MoimParticipantsService moimParticipantsService;
	@Autowired
	private FileUploadService fileUploadService;
	@Autowired
	private MembersService memberservice;
	@Autowired
	private LocationsService locationsService;
	@Autowired
	private CategorysService categorysService;
	@Autowired
	private CommentsService commentsService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String moimMain(Model model, HttpSession session) {
		List<CategorysDTO> datas = categoryService.getAll();
		model.addAttribute("datas", datas);
		return "somoim_m";
	}
	
// 리스트 뽑기	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	@ResponseBody
	public String moimList(@RequestParam(defaultValue = "1", required = false) int page //현재페이지
			, @RequestParam("page_count") int pageCount //한페이지에 몇개 게시물
			, @RequestParam("list_search") String search
			, @RequestParam("category_id") int categoryId) {
		Map res_data = service.getAll(page, pageCount, search, categoryId);
		List datas = (List) res_data.get("datas"); // 가져온 데이터 리스트
		PagingDTO pager = (PagingDTO) res_data.get("page_data"); // 가져온 페이징 객체
		JSONArray data_arr = new JSONArray(); // 가져온 데이터 리스트를 넣는 배열
		JSONObject page_obj = new JSONObject(); // 가져온 페이징 데이터를 넣는 객체
		JSONObject rtn_data = new JSONObject(); // 결과값
		for (SomoimDTO smoim : (List<SomoimDTO>) datas) {
			JSONObject json = new JSONObject();
			json.put("moimId", smoim.getMoimId());
			json.put("moimTitle", smoim.getMoimTitle());
			json.put("moimInfo", smoim.getMoimInfo());
			json.put("moimLimit", smoim.getMoimLimit());
			json.put("locationId", smoim.getLocationId());
			json.put("moimImagePath", smoim.getMoimImagePath());
			json.put("locationName", smoim.getLocationName());
			data_arr.add(json);
		}
		page_obj.put("c_page", pager.getCurrentPageNumber());
		page_obj.put("pagelist", pager.getPageList());
		page_obj.put("n_page", pager.getNextPageNumber());
		page_obj.put("p_page", pager.getPrevPageNumber());
		page_obj.put("is_npage", pager.isNextPage());
		page_obj.put("is_ppage", pager.isPrevPage());
		rtn_data.put("datas", data_arr);
		rtn_data.put("pager", page_obj);
		return rtn_data.toJSONString();
	}

	@RequestMapping(value = "/join_list", method = RequestMethod.GET)
	@ResponseBody
	public String joinList(HttpSession session) {

		MembersDTO membersData = (MembersDTO) session.getAttribute("loginData");
		List<SomoimDTO> participantsData = service.getDatas(membersData.getMemberId());
		JSONArray join_datas = new JSONArray();
		for (SomoimDTO smoim : (List<SomoimDTO>) participantsData) {
			JSONObject json = new JSONObject();
			json.put("moimId", smoim.getMoimId());
			json.put("moimTitle", smoim.getMoimTitle());
			join_datas.add(json);
		}
		return join_datas.toJSONString();
	}

	@RequestMapping(value = "/bookmark_list", method = RequestMethod.GET)
	@ResponseBody
	public String bookMarkList(HttpSession session) {

		JSONArray join_datas = new JSONArray();
		MembersDTO membersData = (MembersDTO) session.getAttribute("loginData");
		List<String> bookmarkData = memberservice.getBmkData(membersData.getMemberId());
		List<SomoimDTO> participantsData = service.getDatas_bmk(bookmarkData);
		for (SomoimDTO smoim : (List<SomoimDTO>) participantsData) {
			JSONObject json = new JSONObject();
			json.put("moimId", smoim.getMoimId());
			json.put("moimTitle", smoim.getMoimTitle());
			join_datas.add(json);
		}
		return join_datas.toJSONString();
	}


	@GetMapping(value="/info/myInfo")
	public String myInfo(HttpSession session, Model model,  HttpServletRequest request) {
		MembersDTO membersDTO = (MembersDTO) session.getAttribute("loginData");
		List<MoimParticipantsDTO> partDatas = moimParticipantsService.getDatas(membersDTO.getMemberId());
		List<SomoimDTO> moimDatas = new ArrayList<SomoimDTO>();
		List<BoardsDTO> boardDatas = boardsService.getDatas(membersDTO.getMemberId());
		List<CommentsDTO> commentsDatas = commentsService.getDatas(membersDTO.getMemberId());
		List<BoardsDTO> boardsId = new ArrayList<BoardsDTO>();

		for (MoimParticipantsDTO data : partDatas) {
			SomoimDTO moimData = service.getData(data.getMoimId());
			moimDatas.add(moimData);
		}
		for (CommentsDTO data : commentsDatas) {
			BoardsDTO boardId = boardsService.getData(data.getBoardId());
			boardsId.add(boardId);
		}
		model.addAttribute("moimDatas", moimDatas);
		model.addAttribute("boardDatas", boardDatas);
		model.addAttribute("commentsDatas", commentsDatas);
		model.addAttribute("boardsId", boardsId);

		return "info/myInfo";
	}

	@RequestMapping(value = "infoMod", method = RequestMethod.POST)
	public String addJoin(MembersDTO membersDTO, HttpSession session
			,@RequestParam (required = false) String year
			,@RequestParam (required = false) String month
			,@RequestParam (required = false) String day
			,@RequestParam (required = false) String memberName
			,@RequestParam (required = false) String oldpassword) {
		String bitrhs = year+month+day;
		
		System.out.println("###DTO 데이터 확인### = " + membersDTO);
		System.out.println(membersDTO.getPassword() == "");
		
		// 비밀번호 변경 없이 (빈값) 프로필 편집 하는 기능 
		if (membersDTO.getPassword() == "") {
			
			membersDTO.setBirth(bitrhs);

			MembersDTO data = new MembersDTO();
			data.setMemberId(membersDTO.getMemberId());
			data.setMemberName(membersDTO.getMemberName());
			data.setGender(membersDTO.getGender());
			data.setBirth(membersDTO.getBirth());
			data.setPhone(membersDTO.getPhone());
			data.setCategory(membersDTO.getCategory());
			data.setLocationId(membersDTO.getLocationId());

			System.out.println("*********************"+data);
			
			boolean basicResult = membersService.basicmodifyData(data);
			
			if (basicResult) {
				MembersDTO loginData = membersService.getData((MembersDTO) session.getAttribute("loginData"));
				session.setAttribute("loginData", loginData);
				return "info/myInfo";
			}else {
				return "info/myInfo";
			}
			
		}else { //비밀번호를 포함 하여 변경 하는 경우
			membersDTO.setBirth(bitrhs);

			MembersDTO data = new MembersDTO();
			data.setMemberId(membersDTO.getMemberId());
			data.setMemberName(membersDTO.getMemberName());
			data.setPassword(membersDTO.getPassword());
			data.setGender(membersDTO.getGender());
			data.setBirth(membersDTO.getBirth());
			data.setPhone(membersDTO.getPhone());
			data.setCategory(membersDTO.getCategory());
			data.setLocationId(membersDTO.getLocationId());
			
			boolean result = membersService.modifyData(data);
			
			if (result) {
				MembersDTO loginData = membersService.getData((MembersDTO) session.getAttribute("loginData"));
				session.setAttribute("loginData", loginData);
				return "info/myInfo";
			}else {
				return "info/myInfo";
			}
		}
	}
	
	@GetMapping(value = "/info/modProfile")
	public String modProfile(Model model){
		List<LocationsDTO> locDatas = locationsService.getAll();
		List<CategorysDTO> categorysDatas = categorysService.getAll();

		model.addAttribute("categorysDatas",categorysDatas);
		model.addAttribute("locDatas", locDatas);
		return "info/modProfile";
	}

	@GetMapping(value = "category")
	public String category(Locale locale, Model model) {

		return "form/category";
	}

	@RequestMapping(value = "startPage")
	public String startPage() {
		return "/form/startPage";
	}

	@PostMapping(value = "/ajax/cate")
	@ResponseBody
	public String ajaxCategory(@RequestBody List<Map<String, Object>> param
							   , HttpSession session , HttpServletRequest request) {
		MembersDTO membersDTO = (MembersDTO) session.getAttribute("loginData");
		String cateId = "";
		for (Map<String, Object> data : param) {
			String[] arr = data.get("id").toString().split("_");
			if(cateId == null || cateId == "") {
				cateId += arr[1];
			} else {
				cateId += "," + arr[1];
			}
		}
		membersDTO.setCategory(cateId);
		JSONObject jsonObject = new JSONObject();
		boolean res = membersService.modifyCate(membersDTO); // loginData에서 가져온 정보와 cateId로 수정
		jsonObject.put("res", res);
		session.setAttribute("loginData", membersDTO);
		return jsonObject.toJSONString();
	}
	
	@PostMapping(value = "/ajax/infoUpload")
	@ResponseBody
	public String ajaxInfoUpload(HttpServletRequest request, HttpSession session
								 , @RequestParam("uploadImage") MultipartFile file) throws IOException {
		MembersDTO membersDTO = (MembersDTO) session.getAttribute("loginData");
		String realPath= request.getServletContext().getRealPath("/resources/img/info/");

		membersDTO.setInfoImagePath(request.getContextPath() + "/resources/img/info/" + membersDTO.getMemberId() + ".png");

		boolean res = fileUploadService.modifyInfoImage(membersDTO);

		if(res) {
			file.transferTo(new File(realPath + membersDTO.getMemberId() + ".png"));

			JSONObject json = new JSONObject();
			json.put("infoUrl", request.getContextPath() + "/resources/img/info/" + membersDTO.getMemberId() + ".png");

			return json.toJSONString();
		} else {
			return null;
		}
	}

	@PostMapping(value = "/ajax/profileUpload")
	@ResponseBody
	public String ajaxProfileUpload(HttpServletRequest request, HttpSession session
			, @RequestParam("uploadImage") MultipartFile file) throws IOException {
		MembersDTO membersDTO = (MembersDTO) session.getAttribute("loginData");
		String realPath= request.getServletContext().getRealPath("/resources/img/members/");

		membersDTO.setMemberImagePath(request.getContextPath() + "/resources/img/members/" + membersDTO.getMemberId() + ".png");

		boolean res = fileUploadService.modifyProfileImage(membersDTO);

		if(res) {
			file.transferTo(new File(realPath + membersDTO.getMemberId() + ".png"));

			JSONObject json = new JSONObject();
			json.put("profileUrl", request.getContextPath() + "/resources/img/members/" + membersDTO.getMemberId() + ".png");

			return json.toJSONString();
		} else {
			return null;
		}
	}
}
