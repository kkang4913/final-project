package com.myweb.somoim.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myweb.somoim.common.abstracts.AbstractService;
import com.myweb.somoim.common.model.PagingDTO;
import com.myweb.somoim.model.SomoimDAO;
import com.myweb.somoim.model.SomoimDTO;
import com.myweb.somoim.participants.model.MoimParticipantsDTO;

import oracle.net.aso.b;

@Service
public class SomoimService extends AbstractService<List<SomoimDTO>, SomoimDTO>{


	@Autowired
	private SomoimDAO dao;


	@Override
	public List<SomoimDTO> getAll() {
		List<SomoimDTO> datas = dao.selectAll();
		return datas;
	}
	
	public Map<String,Object> getAll(int page, int limit, String search, int categoryId) {
		int countPage = 10;
		int num_start = ((page-1) * limit) + 1;
		int num_end   = (page * limit);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("num_start", num_start);
		map.put("num_end", num_end);
		map.put("search_title", search);
		map.put("category_id", categoryId);
		List<SomoimDTO> datas = dao.selectAll(map);
		int total = dao.selectAllCnt(map);
		PagingDTO pager = new PagingDTO(total, page, limit);
		Map res_data = new HashMap<String, Object>();
		res_data.put("datas", datas);
		res_data.put("page_data", pager);
		return res_data;
	}

	@Override
	public List<SomoimDTO> getDatas(int i) {
		return null;
	}

	@Override
	public List<SomoimDTO> getDatas(String memberId) {
		List<SomoimDTO> data = dao.selectSubDatas(memberId);
		return data;
	}
	
	public List<SomoimDTO> getDatas_bmk(List<String> moimIds) {
		List<SomoimDTO> data = dao.selectSubDatas_bmk(moimIds);
		return data;
	}
	
	public int getDataCnt(String memberId) {
		int count = dao.selectCnt(memberId);
		return count;
	}
	
	@Override
	public SomoimDTO getData(String s) {
		return null;
	}

	@Override
	public SomoimDTO getData(int id) {
	     SomoimDTO data = dao.selectData(id);
		return data;
	}

	@Override
	public SomoimDTO getData(SomoimDTO dto) {
		return null;
	}

	@Override
	public boolean addData(SomoimDTO dto) {
		boolean result = dao.insertData(dto);
		return result;
	}
	
	public boolean addDataSub(MoimParticipantsDTO dto) {
		
		boolean result = dao.insertDataSub(dto);
		return result;
	}

	@Override
	public boolean modifyData(SomoimDTO dto) {
		boolean result = dao.updateData(dto);
		return result;
	}

	@Override
	public boolean removeData(SomoimDTO dto) {
		return false;
	}

	@Override
	public boolean removeData(int id) {
		boolean result = dao.deleteData(id);
		return result;
	}

	

}
