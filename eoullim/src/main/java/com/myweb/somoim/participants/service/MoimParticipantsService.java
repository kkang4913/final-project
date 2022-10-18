package com.myweb.somoim.participants.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myweb.somoim.common.abstracts.AbstractService;
import com.myweb.somoim.participants.model.MoimParticipantsDTO;
import com.myweb.somoim.participants.model.MoimParticipantsDAO;

@Service
public class MoimParticipantsService extends AbstractService<List<MoimParticipantsDTO>, MoimParticipantsDTO> {

	@Autowired
	private MoimParticipantsDAO dao;


	@Override
	public List<MoimParticipantsDTO> getAll() {
		return null;
	}


	public List<MoimParticipantsDTO> getDatas(int id) { //추가한 메서드
		List<MoimParticipantsDTO> data = dao.selectDatas(id);
		return data;
	}

	@Override
	public List<MoimParticipantsDTO> getDatas(String id) {
		List<MoimParticipantsDTO> data = dao.selectJoinMoimData(id);
		return data;
	}

	
	@Override
	public MoimParticipantsDTO getData(int id) { 
		MoimParticipantsDTO data = dao.selectData(id);
		return data;
	}

	@Override
	public MoimParticipantsDTO getData(String s) {
		return null;
	}

	@Override
	public MoimParticipantsDTO getData(MoimParticipantsDTO dto) {
		MoimParticipantsDTO data = dao.selectData(dto);
		return data;
	}

	@Override
	public boolean addData(MoimParticipantsDTO dto) {
		boolean result = dao.insertData(dto);
		
		return result;
	}

	@Override
	public boolean modifyData(MoimParticipantsDTO dto) {
		boolean result = dao.updateData(dto);
		return result;
	}

	@Override
	public boolean removeData(MoimParticipantsDTO dto) {
		return false;
	}

	public boolean removeData(Map map) {
		boolean result = dao.deleteData(map);
		return result;
	
	}
	
	@Override
	public boolean removeData(int id) {
		boolean result = dao.deleteData(id);
		return result;
	}


	public int  getcurrentMemberCount(int id) { //현재가입한 멤버수 알아오기
		int  res = dao.currentMemberCount(id);
		return res ;
	}


	public int getMemberJoinMoimCount(String memberId) { //로그인한 유저의 가입 모임수 알아오기
		int  res = dao.memberJoinMoimCount(memberId);
		return res ;
	}


	public boolean getMemberAlreadyJoin(Map map) {
		boolean res = dao.selectAlreadyJoinMember(map);
		return res;
	}


	

}
