package com.myweb.somoim.moim.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.myweb.somoim.common.abstracts.AbstractDAO;

@Repository
public class MeetingsDAO extends AbstractDAO<List<MeetingsDTO>, MeetingsDTO>{

	@Autowired
	private SqlSession session;
	private String mapper = "mettingsMapper.%s";



	@Override
	public List<MeetingsDTO> selectAll() {
		return null;
	}

	@Override
	public List<MeetingsDTO> selectDatas(String i) {
		return null;
	}

	@Override
	public List<MeetingsDTO> selectDatas(int id){
		String mapperId = String.format(mapper,"selectDatas");
		List<MeetingsDTO> data =  session.selectList(mapperId,id);
		return data;
	}

	@Override
	public MeetingsDTO selectData(int id) {
		String mapperId = String.format(mapper,"selectData");
		MeetingsDTO data =  session.selectOne(mapperId,id);
		return data;
	}

	@Override
	public MeetingsDTO selectData(String s) {
		return null;
	}

	@Override
	public MeetingsDTO selectData(MeetingsDTO dto) {
		return null;
	}

	@Override
	public int getNextSeq() {
		String mapperId = String.format(mapper, "getNextSeq");
		int seq = session.selectOne(mapperId);
		return seq;
	}

	@Override
	public boolean insertData(MeetingsDTO dto) {
		String mapperId = String.format(mapper, "insertData");
		int res = session.insert(mapperId, dto);
		return res == 1 ? true : false;
	}

	@Override
	public boolean updateData(MeetingsDTO dto) {
		String mapperId = String.format(mapper, "updateData");
		int res = session.update(mapperId, dto);
		return res == 1 ? true : false;
	}

	@Override
	public boolean deleteData(MeetingsDTO dto) {
		return false;
	}

	@Override
	public boolean deleteData(int id) {
		String mapperId = String.format(mapper, "deleteData");
		int res = session.delete(mapperId, id);

		return res > 0 ? true : false;
	}

	public boolean deleteMeetingData(int id) {
		String mapperId = String.format(mapper, "deleteMeetingData");
		int res = session.delete(mapperId, id);

		return res == 1 ? true : false;
	}
}
