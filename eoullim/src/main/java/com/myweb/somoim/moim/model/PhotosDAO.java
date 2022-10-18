package com.myweb.somoim.moim.model;

import java.util.List;

import com.myweb.somoim.common.abstracts.AbstractDAO;

public class PhotosDAO extends AbstractDAO<List<PhotosDTO>, PhotosDTO> {

	@Override
	public List<PhotosDTO> selectAll() {
		return null;
	}
	
	@Override
	public List<PhotosDTO> selectDatas(int i) {
		return null;
	}

	@Override
	public List<PhotosDTO> selectDatas(String s) {
		return null;
	}

	@Override
	public PhotosDTO selectData(int id) {
		return null;
	}

	@Override
	public PhotosDTO selectData(String s) {
		return null;
	}

	@Override
	public PhotosDTO selectData(PhotosDTO dto) {
		return null;
	}

	@Override
	public int getNextSeq() {
		return 0;
	}

	@Override
	public boolean insertData(PhotosDTO dto) {
		return false;
	}

	@Override
	public boolean updateData(PhotosDTO dto) {
		return false;
	}

	@Override
	public boolean deleteData(PhotosDTO dto) {
		return false;
	}

	@Override
	public boolean deleteData(int id) {
		return false;
	}	
}
