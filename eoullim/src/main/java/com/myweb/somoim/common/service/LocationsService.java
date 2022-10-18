package com.myweb.somoim.common.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myweb.somoim.common.abstracts.AbstractService;
import com.myweb.somoim.common.model.LocationsDAO;
import com.myweb.somoim.common.model.LocationsDTO;
@Service
public class LocationsService extends AbstractService<List<LocationsDTO>, LocationsDTO> {

	@Autowired
	private LocationsDAO dao;

	@Override
	public List<LocationsDTO> getAll() {
		List<LocationsDTO> locDatas = dao.selectAll();
		return locDatas;
	}

	@Override
	public List<LocationsDTO> getDatas(int i) {
		return null;
	}

	@Override
	public List<LocationsDTO> getDatas(String s) {
		return null;
	}

	@Override
	public LocationsDTO getData(int id) {
		return null;
	}

	@Override
	public LocationsDTO getData(String s) {
		return null;
	}

	@Override
	public LocationsDTO getData(LocationsDTO dto) {
		return null;
	}

	@Override
	public boolean addData(LocationsDTO dto) {
		return false;
	}

	@Override
	public boolean modifyData(LocationsDTO dto) {
		return false;
	}

	@Override
	public boolean removeData(LocationsDTO dto) {
		return false;
	}

	@Override
	public boolean removeData(int id) {
		return false;
	}

}
