package com.myweb.somoim.categorys.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myweb.somoim.categorys.model.CategorysDAO;
import com.myweb.somoim.categorys.model.CategorysDTO;
import com.myweb.somoim.common.abstracts.AbstractService;
@Service
public class CategorysService extends AbstractService<List<CategorysDTO>, CategorysDTO> {
	
	@Autowired
	private CategorysDAO dao;
	
	@Override
	public List<CategorysDTO> getAll() {
		List<CategorysDTO> categorysDatas = dao.selectAll();
		return categorysDatas;
	}

	@Override
	public List<CategorysDTO> getDatas(int i) {
		return null;
	}

	@Override
	public List<CategorysDTO> getDatas(String s) {
		return null;
	}

	@Override
	public CategorysDTO getData(int id) {
		CategorysDTO data = dao.selectData(id);
		return data;
	}

	@Override
	public CategorysDTO getData(String s) {
		return null;
	}

	@Override
	public CategorysDTO getData(CategorysDTO dto) {
		return null;
	}

	@Override
	public boolean addData(CategorysDTO dto) {
		return false;
	}

	@Override
	public boolean modifyData(CategorysDTO dto) {
		return false;
	}

	@Override
	public boolean removeData(CategorysDTO dto) {
		return false;
	}

	@Override
	public boolean removeData(int id) {
		return false;
	}
}
