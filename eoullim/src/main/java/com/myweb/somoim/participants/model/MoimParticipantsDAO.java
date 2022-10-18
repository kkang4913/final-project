package com.myweb.somoim.participants.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.myweb.somoim.common.abstracts.AbstractDAO;

@Repository
public class MoimParticipantsDAO extends AbstractDAO<List<MoimParticipantsDTO>, MoimParticipantsDTO> {

	@Autowired
	private SqlSession session;
	private String mapper = "moimParticipantsMapper.%s";

	@Override
	public List<MoimParticipantsDTO> selectAll() {
		return null;
	}

	@Override
	public List<MoimParticipantsDTO> selectDatas(String i) {
		return null;
	}

	public List<MoimParticipantsDTO> selectJoinMoimData(String id) {
		String mapperId = String.format(mapper, "selectJoinMoim");
		List<MoimParticipantsDTO> data = session.selectList(mapperId,id);
		return data;
	}
	
	@Override
	public List<MoimParticipantsDTO> selectDatas(int id) {
		String mapperId = String.format(mapper, "selectDatas");
		List<MoimParticipantsDTO> data = session.selectList(mapperId,id);
		return data;
	}


	@Override
	public MoimParticipantsDTO selectData(int id) {
	    String mapperId = String.format(mapper, "selectMoimBoss");
	    MoimParticipantsDTO data = session.selectOne(mapperId,id);
	    return data;
	}

	@Override
	public MoimParticipantsDTO selectData(String id) {
		return null;
	}

	@Override
	public MoimParticipantsDTO selectData(MoimParticipantsDTO dto) {
		String mapperId = String.format(mapper, "selectData");
		MoimParticipantsDTO data = session.selectOne(mapperId,dto);
		return data;
	}

	@Override 
	public int getNextSeq() {
		return 0;
	}

	@Override
	public boolean insertData(MoimParticipantsDTO dto) {
		String mapperId = String.format(mapper, "insertData");
		int result = session.insert(mapperId,dto);
		
		
		if(result == 1) {
			return true;
		}
		return false;
	}

	@Override
	public boolean updateData(MoimParticipantsDTO dto) {
		String mapperId = String.format(mapper, "updateJob");
		int result = session.update(mapperId, dto);
		return result == 1 ? true : false;
	}

	@Override
	public boolean deleteData(MoimParticipantsDTO dto) {
		return false;
	}
	
	
	public boolean deleteData(Map map) {
		String mapperId = String.format(mapper, "deleteMember");
		int result = session.delete(mapperId, map);
        return result == 1  ? true : false;
	} 

	@Override
	public boolean deleteData(int id) {
		String mapperId = String.format(mapper, "deleteData");
		int result = session.update(mapperId, id);

		return result > 0 ? true : false;
	}

	public int currentMemberCount(int id) {
		String mapperId = String.format(mapper, "selectcurrentMemberCount");
		MoimParticipantsDTO data = session.selectOne(mapperId,id);
		int res = data.getCurrentMemberCount();
		
		return res;
	}

	public int memberJoinMoimCount(String memberId) {
		String mapperId = String.format(mapper, "selectMemberJoinMoimCount");
		MoimParticipantsDTO data = session.selectOne(mapperId,memberId);
	    return data.getMemberJoinMoimCount();
	}

	public boolean selectAlreadyJoinMember(Map map) {
		String mapperId = String.format(mapper, "selectAlreadyJoinMember");
		int data = session.selectOne(mapperId,map);
	    if(data == 1) {
	    	return true;
	    }
	    return false;
	}

}
