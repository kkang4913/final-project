package com.myweb.somoim.common.model;

import java.util.List;

import com.myweb.somoim.common.abstracts.AbstractDAO;

public class JobsDAO extends AbstractDAO<List<JobsDTO>, JobsDTO> {

	@Override
	public List<JobsDTO> selectAll() {
		return null;
	}
	
	@Override
	public List<JobsDTO> selectDatas(int i) {
		return null;
	}

	@Override
	public List<JobsDTO> selectDatas(String s) {
		return null;
	}

	@Override
	public JobsDTO selectData(int id) {
		return null;
	}

	@Override
	public JobsDTO selectData(String s) {
		return null;
	}

	@Override
	public JobsDTO selectData(JobsDTO dto) {
		return null;
	}

	@Override
	public int getNextSeq() {
		return 0;
	}

	@Override
	public boolean insertData(JobsDTO dto) {
		return false;
	}

	@Override
	public boolean updateData(JobsDTO dto) {
		return false;
	}

	@Override
	public boolean deleteData(JobsDTO dto) {
		return false;
	}

	@Override
	public boolean deleteData(int id) {
		return false;
	}
}
