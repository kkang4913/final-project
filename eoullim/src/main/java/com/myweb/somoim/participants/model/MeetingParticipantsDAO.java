package com.myweb.somoim.participants.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.myweb.somoim.common.abstracts.AbstractDAO;
import com.myweb.somoim.moim.model.MeetingsDTO;

@Repository
public class MeetingParticipantsDAO extends AbstractDAO<List<MeetingParticipantsDTO>, MeetingParticipantsDTO> {

	@Autowired
	private SqlSession session ;

	private String mapper ="meetingParticipantsMapper.%s";


	@Override
	public List<MeetingParticipantsDTO> selectAll() {
		return null;
	}

	@Override
	public List<MeetingParticipantsDTO> selectDatas(String s) {
		return null;
	}

	@Override
	public List<MeetingParticipantsDTO> selectDatas(int id) {
		String mapperId = String.format(mapper, "selectDatas");
		List<MeetingParticipantsDTO> data = session.selectList(mapperId,id);

		return data;
	}


	@Override
	public MeetingParticipantsDTO selectData(int id) {
		return null;
	}

	@Override
	public MeetingParticipantsDTO selectData(String s) {
		return null;
	}

	@Override
	public MeetingParticipantsDTO selectData(MeetingParticipantsDTO dto) {
		String mapperId = String.format(mapper, "selectData");
		MeetingParticipantsDTO data = session.selectOne(mapperId, dto);
		return data;
	}

	public int selectPartCnt(int meetingId) {
		String mapperId = String.format(mapper, "selectPartCnt");
		int res = session.selectOne(mapperId, meetingId);

		return res;
	}

	@Override
	public int getNextSeq() {
		return 0;
	}

	@Override
	public boolean insertData(MeetingParticipantsDTO dto) {
		String mapperId = String.format(mapper, "insertData");
		int res = session.insert(mapperId, dto);

		return res == 1 ? true : false;
	}

	@Override
	public boolean updateData(MeetingParticipantsDTO dto) {
		return false;
	}

	@Override
	public boolean deleteData(MeetingParticipantsDTO dto) {
		String mapperId = String.format(mapper, "deleteData");
		int res = session.delete(mapperId, dto);

		return res == 1 ? true : false;
	}

	@Override
	public boolean deleteData(int id) {
		return false;
	}

	public boolean deleteDatas(int id) {
		String mapperId = String.format(mapper, "deleteDatas");
		int res = session.delete(mapperId, id);

		return res > 0 ? true : false;
	}

	public boolean deleteMeetingDatas(int id) {
		String mapperId = String.format(mapper, "deleteMeetingDatas");
		int res = session.delete(mapperId, id);

		return res > 0 ? true : false;
	}

	public List<MeetingsDTO> selectCheckJoinMeetingMember(Map map) {
		String mapperId = String.format(mapper, "selectCheckJoinMeetingMember");
		List<MeetingsDTO> datas = session.selectList(mapperId, map);
        return  datas;
	}

	public boolean deleteAllMeetingjoinMember(Map map) {
		String mapperId = String.format(mapper, "deleteAllMeetingjoinMember");
		int res = session.delete(mapperId, map);
        return res > 0 ? true : false;
	}

}
