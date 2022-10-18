package com.myweb.somoim.participants.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myweb.somoim.common.abstracts.AbstractService;
import com.myweb.somoim.moim.model.MeetingsDTO;
import com.myweb.somoim.participants.model.MeetingParticipantsDAO;
import com.myweb.somoim.participants.model.MeetingParticipantsDTO;

@Service
public class MeetingParticipantsService extends AbstractService<List<MeetingParticipantsDTO>, MeetingParticipantsDTO>{

	@Autowired
	private MeetingParticipantsDAO dao;

	@Override
	public List<MeetingParticipantsDTO> getDatas(int id) {
		List<MeetingParticipantsDTO> data = dao.selectDatas(id);
		return data;
	}


	@Override
	public List<MeetingParticipantsDTO> getAll() {
		return null;
	}

	@Override
	public List<MeetingParticipantsDTO> getDatas(String s) {
		return null;
	}

	@Override
	public MeetingParticipantsDTO getData(int id) {
		return null;
	}

	@Override
	public MeetingParticipantsDTO getData(String s) {
		return null;
	}

	@Override
	public MeetingParticipantsDTO getData(MeetingParticipantsDTO dto) {
		MeetingParticipantsDTO data = dao.selectData(dto);
		return data;
	}

	public int getPartCnt(int meetingId) {
		int res = dao.selectPartCnt(meetingId);
		return res;
	}

	@Override
	public boolean addData(MeetingParticipantsDTO dto) {
		boolean result = dao.insertData(dto);
		return result;
	}

	@Override
	public boolean modifyData(MeetingParticipantsDTO dto) {
		return false;
	}

	@Override
	public boolean removeData(MeetingParticipantsDTO dto) {
		boolean result = dao.deleteData(dto);
		return result;
	}

	@Override
	public boolean removeData(int id) {
		return false;
	}

	public boolean removeDatas(int id) {
		boolean result = dao.deleteDatas(id);
		return result;
	}

	public boolean removeMeetingDatas(int id) {
		boolean result = dao.deleteMeetingDatas(id);
		return result;
	}


	public List<MeetingsDTO> getCheckJoinMeetingMember(Map map) {
		List<MeetingsDTO> datas = dao.selectCheckJoinMeetingMember(map);
		return datas;
		
	}


	public boolean removeAllMeetingjoinMember(Map map) {
		boolean result = dao.deleteAllMeetingjoinMember(map);
		return result;
	}

}
