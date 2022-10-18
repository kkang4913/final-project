package com.myweb.somoim.common.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.myweb.somoim.common.abstracts.AbstractDAO;
@Repository
public class LocationsDAO extends AbstractDAO<List<LocationsDTO>, LocationsDTO> {

	@Autowired
	private SqlSession session;

	private String mapper = "locMapper.%s";

	@Override
	public List<LocationsDTO> selectAll() {
		String mapperId = String.format(mapper, "selectAll");
		List<LocationsDTO> res = session.selectList(mapperId);
		return res;
	}

	@Override
	public List<LocationsDTO> selectDatas(int i) {
		return null;
	}

	@Override
	public List<LocationsDTO> selectDatas(String s) {
		return null;
	}

	@Override
	public LocationsDTO selectData(int id) {
		return null;
	}

	@Override
	public LocationsDTO selectData(String s) {
		return null;
	}

	@Override
	public LocationsDTO selectData(LocationsDTO dto) {
		return null;
	}

	@Override
	public int getNextSeq() {
		return 0;
	}

	@Override
	public boolean insertData(LocationsDTO dto) {
		return false;
	}

	@Override
	public boolean updateData(LocationsDTO dto) {
		return false;
	}

	@Override
	public boolean deleteData(LocationsDTO dto) {
		return false;
	}

	@Override
	public boolean deleteData(int id) {
		return false;
	}
	
}
