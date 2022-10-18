package com.myweb.somoim.members.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.myweb.somoim.common.abstracts.AbstractDAO;
@Repository
public class MembersDAO extends AbstractDAO<List<MembersDTO>, MembersDTO> {

	@Autowired
	private SqlSession session;
	
	private String mapper = "memberMapper.%s";
	
	public MembersDTO selectLogin(MembersDTO data) {
		String mapId = String.format(mapper, "selectLogin");
		MembersDTO result = session.selectOne(mapId, data);
		return result;
	}
	public MembersDTO typeSelectLogin(MembersDTO data) {
		String mapId = String.format(mapper, "typeSelectLogin");
		MembersDTO result = session.selectOne(mapId, data);
		return result;
	}
	
	@Override
	public List<MembersDTO> selectAll() {
		return null;
	}
	
	@Override
	public List<MembersDTO> selectDatas(int i) {
		return null;
	}

	@Override
	public List<MembersDTO> selectDatas(String s) {
		return null;
	}

	@Override
	public MembersDTO selectData(int id) {
		String mapId = String.format(mapper, "selectMemberData");
		MembersDTO data = session.selectOne(mapId, id);
		return data;
	}

	@Override
	public MembersDTO selectData(String memberId) {
		String mapId = String.format(mapper, "selectData");
		MembersDTO bookmarkData = session.selectOne(mapId, memberId);
		return bookmarkData;
	}

	@Override
	public MembersDTO selectData(MembersDTO dto) {
		String mapId = String.format(mapper, "selectMemberData");
		MembersDTO data = session.selectOne(mapId,dto);
		return data;
	}

	public MembersDTO selectMemData(String id) {
		String mapId = String.format(mapper, "selectMemberData");
		MembersDTO data = session.selectOne(mapId, id);
		return data;
	}

	@Override
	public int getNextSeq() {
		String mapId = String.format(mapper, "getNextSeq");
		int seq = session.selectOne(mapId);
		return seq;
	}

	@Override
	public boolean insertData(MembersDTO data) {
		String mapId = String.format(mapper, "insertData");
		int res = session.insert(mapId, data);
		return res == 1 ? true : false;
	}

	@Override
	public boolean updateData(MembersDTO data) {
		String mapId = String.format(mapper, "updateData");
		int res = session.insert(mapId, data);
		return res == 1 ? true : false;
	}
	public boolean basicUpdateData(MembersDTO data) {
		String mapId = String.format(mapper, "basicupdateData");
		int res = session.insert(mapId, data);
		return res == 1 ? true : false;
	}

	public boolean updateCate(MembersDTO dto) {
		String mapId = String.format(mapper, "updateCate");
		int res = session.insert(mapId, dto);
		return res == 1 ? true : false;
	}

	@Override
	public boolean deleteData(MembersDTO dto) {
		return false;
	}

	@Override
	public boolean deleteData(int id) {
		return false;
	}


	public MembersDTO selectFindId(MembersDTO data) {
		String mapId = String.format(mapper, "selectFindId");
		MembersDTO res = session.selectOne(mapId, data);
		return res;
	}


	public MembersDTO selectFindPw(MembersDTO data) {
		String mapId = String.format(mapper, "selectFindPw");
		MembersDTO res = session.selectOne(mapId, data);

		// 비밀번호 찾기 후 바로 업데이트 
		session.update("memberMapper.updatePw", res);
		return res;
		
	}
	

	public boolean updateBookmark(MembersDTO data) {
		String mapId = String.format(mapper, "updateBookmark");
		int result = session.update(mapId, data);
		return result == 1 ? true : false;
	}

	public int idchk(MembersDTO membersDTO) {
		String mapId = String.format(mapper, "idChk");
		int result = session.selectOne(mapId,membersDTO);
		return result;
	}



	public int kakaoIdchk(MembersDTO membersDTO) {
		String mapId = String.format(mapper, "kakaoidChk");
		String kakaoId = membersDTO.getMemberId();
		int result = session.selectOne(mapId,kakaoId);
		return result;
	}
	public int phonechk(MembersDTO membersDTO) {
		String mapId = String.format(mapper, "phoneChk");
		int result = session.selectOne(mapId, membersDTO);
		return result;
	}



}
