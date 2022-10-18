package com.myweb.somoim.members.service;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.myweb.somoim.common.abstracts.AbstractService;
import com.myweb.somoim.members.model.MembersDAO;
import com.myweb.somoim.members.model.MembersDTO;
@Service
public class MembersService extends AbstractService<List<MembersDTO>, MembersDTO>{
	
	@Autowired
	private MembersDAO dao;
	
	
	public MembersDTO getLogin(MembersDTO membersDTO) {
		MembersDTO data = new MembersDTO();
		
		data.setMemberId(membersDTO.getMemberId());
		data.setPassword(membersDTO.getPassword());
		
		data = dao.selectLogin(data);
		
		if(data == null) {
			return data;
		}else {
			System.out.println(data);
			return data;
		}
	}
	
	@Override
	public List<MembersDTO> getAll() {
		return null;
	}
	
	@Override
	public List<MembersDTO> getDatas(int i) {
		return null;
	}

	@Override
	public List<MembersDTO> getDatas(String s) {
		return null;
	}

	@Override
	public MembersDTO getData(int id) {
		MembersDTO data = dao.selectData(id);
		return data;
	}

	@Override
	public MembersDTO getData(String s) {
		MembersDTO data = dao.selectData(s);
		return data;
	}

	public MembersDTO getMemData(String id) {
		MembersDTO data = dao.selectMemData(id);
		return data;
	}

	public List<String> getBmkData(String memberId)  {
			MembersDTO bookmarkData = dao.selectData(memberId);
		if(bookmarkData != null) {
			List<String> bookmarkList = Arrays.asList(bookmarkData.getBookmark().split(","));
			return bookmarkList;
		}else {
			MembersDTO data = new MembersDTO();
			data.setBookmark("");
			data.setMemberId(memberId);
			boolean result = dao.updateBookmark(data);
			List<String> nullBookmark =Arrays.asList(data.getBookmark());
			return nullBookmark;
		}
	}


	public int checkBookMarkData(String memberId , int id) { //북마크체크 , 갯수확인
		MembersDTO data = dao.selectData(memberId);
		if(data != null) {
			List<String> arrayList = Arrays.asList(data.getBookmark().split(","));
			if(!arrayList.isEmpty()) {	
				if(arrayList.contains(Integer.toString(id))) { //--> 모임아이디로 찜기록확인
				    return 1;
				}else if(arrayList.size()>=5) {//--->5개이상 체크
					return 2;
				}else if(!arrayList.contains(Integer.toString(id))) {
					return 4;
				}
			}	
			return 0;	
		}else {
			MembersDTO bmkData = new MembersDTO();
			bmkData.setBookmark("");
			bmkData.setMemberId(memberId);
			boolean result = dao.updateBookmark(bmkData);
			return 3;
		}
	  }

	public boolean addBookmark(String memberId , int id) { //북마크추가
		MembersDTO data = dao.selectData(memberId);
		String str = data.getBookmark();
		String [] strarr = str.split(",");

		List<String> arrayList = new ArrayList<String>(Arrays.asList(strarr));
		arrayList.add(Integer.toString(id)); // 모임아이디 추가하기


		String bookmark = String.join(",",arrayList);


		data.setMemberId(memberId);; //북마크 MembersDTO에 저장
		data.setBookmark(bookmark); //북마크 MembersDTO에 저장
	    boolean res = dao.updateBookmark(data);
		return res;



	}


	public boolean deleteBookmark(String memberId, int id) { //북마크삭제
		MembersDTO data = dao.selectData(memberId);
		String str = data.getBookmark();
		String [] strarr = str.split(",");

		List<String> arrayList = new ArrayList<String>(Arrays.asList(strarr));
		arrayList.remove(Integer.toString(id)); // 모임아이디 추가하기


		String bookmark = String.join(",",arrayList);


		data.setMemberId(memberId);; //북마크 MembersDTO에 저장
		data.setBookmark(bookmark); //북마크 MembersDTO에 저장
	    boolean res = dao.updateBookmark(data);
		return res;
	}


	@Override
	public MembersDTO getData(MembersDTO dto) {
		MembersDTO data = dao.selectData(dto);
		return data;
	}

	@Override
	public boolean addData(MembersDTO data) {
		
		boolean result = dao.insertData(data);
		
		return result;
	}

	@Override
	public boolean modifyData(MembersDTO data) {
		boolean res = dao.updateData(data);
		return res;
	}
	public boolean basicmodifyData(MembersDTO data) {
		boolean res = dao.basicUpdateData(data);
		return res;
	}

	public boolean modifyCate(MembersDTO dto) {
		boolean res = dao.updateCate(dto);
		return res;
	}
	@Override
	public boolean removeData(MembersDTO dto) {
		return false;
	}

	@Override
	public boolean removeData(int id) {
		return false;
	}


	public MembersDTO selectFindId(MembersDTO data) {
		MembersDTO res = dao.selectFindId(data);
		return res;
	}

	public MembersDTO selectFindPw(MembersDTO data) {
		MembersDTO res = dao.selectFindPw(data);

		return res;
	}

	public int idChk(MembersDTO membersDTO) {
		int result = dao.idchk(membersDTO);
		return result;
	}
	public int kakaoIdChk(MembersDTO membersDTO) {
		int result = dao.kakaoIdchk(membersDTO);
		return result;
	}
	public int phoneChk(MembersDTO membersDTO) {
		int result = dao.phonechk(membersDTO);
		return result;
	}
	public HashMap<String, Object> getUserInfo (String access_Token)  {
	    
	    //    요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
	    HashMap<String, Object> userInfo = new HashMap<>();
	    String reqURL = "https://kapi.kakao.com/v2/user/me";
	    try {
	        URL url = new URL(reqURL);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("POST");
	        
	        //    요청에 필요한 Header에 포함될 내용
	        conn.setRequestProperty("Authorization", "Bearer " + access_Token);
	        
	        int responseCode = conn.getResponseCode();
	        System.out.println("responseCode : " + responseCode);
	        
	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        
	        String line = "";
	        String result = "";
	        
	        while ((line = br.readLine()) != null) {
	            result += line;
	        }
	        System.out.println("response body : " + result);
	        
	        JsonElement element = JsonParser.parseString(result);
	        		
	        
	        long id = element.getAsJsonObject().get("id").getAsLong();
	        JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
	        JsonObject births = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
	        JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
	      
	        String nickname = properties.getAsJsonObject().get("nickname").getAsString();
	        String birthday = births.getAsJsonObject().get("birthday").getAsString();
	        String email = kakao_account.getAsJsonObject().get("email").getAsString();
	        
	        userInfo.put("kakaoId", id);
	        userInfo.put("nickname", nickname);
	        userInfo.put("email", email);
			String month = birthday.substring(0,2);
			String day = birthday.substring(2,4);
			userInfo.put("month", month);
			userInfo.put("day", day);
	        
	    } catch (IOException e) {
	        // TODO Auto-generated catch block
	        e.printStackTrace();
	    }
	    
	    return userInfo;
	}
		
	public void kakaoLogout(String access_Token) {
	    String reqURL = "https://kapi.kakao.com/v1/user/logout";
	    try {
	        URL url = new URL(reqURL);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("POST");
	        conn.setRequestProperty("Authorization", "Bearer " + access_Token);
	        
	        int responseCode = conn.getResponseCode();
	        System.out.println("responseCode : " + responseCode);
	        
	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        
	        String result = "";
	        String line = "";
	        
	        while ((line = br.readLine()) != null) {
	            result += line;
	        }
	        System.out.println(result);
	    } catch (IOException e) {
	        // TODO Auto-generated catch block
	        e.printStackTrace();
	    }
	}

	public MembersDTO typeSelectLogin(HashMap<String, Object> userInfo) {
		MembersDTO data = new MembersDTO();
		
		data.setMemberId((String) userInfo.get("email"));
		data.setLoginType((String) userInfo.get("loginType"));
		
		data = dao.typeSelectLogin(data);
		
		return data;
	}






}
