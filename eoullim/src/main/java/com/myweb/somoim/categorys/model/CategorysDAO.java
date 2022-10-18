package com.myweb.somoim.categorys.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.myweb.somoim.common.abstracts.AbstractDAO;
@Repository
public class CategorysDAO extends AbstractDAO<List<CategorysDTO>, CategorysDTO> {

	@Autowired
	private SqlSession session;
	
	private String mapper = "categoryMapper.%s";

	
	@Override
	public List<CategorysDTO> selectAll() {
		String mapperId = String.format(mapper, "selectAll");
		List<CategorysDTO> res = session.selectList(mapperId);
		return res;
	}
	
	@Override
	public List<CategorysDTO> selectDatas(int i) {
		return null;
	}

	@Override
	public List<CategorysDTO> selectDatas(String s) {
		return null;
	}

	@Override
	public CategorysDTO selectData(int id) {
		String mapperId = String.format(mapper, "selectData");
		CategorysDTO data = session.selectOne(mapperId, id);
		return data;
	}

	@Override
	public CategorysDTO selectData(String s) {
		return null;
	}

	@Override
	public CategorysDTO selectData(CategorysDTO dto) {
		return null;
	}

	@Override
	public int getNextSeq() {
		return 0;
	}

	@Override
	public boolean insertData(CategorysDTO dto) {
		return false;
	}

	@Override
	public boolean updateData(CategorysDTO dto) {
		return false;
	}

	@Override
	public boolean deleteData(CategorysDTO dto) {
		return false;
	}

	@Override
	public boolean deleteData(int id) {
		return false;
	}
}
