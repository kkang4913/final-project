package com.myweb.somoim.moim.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.myweb.somoim.common.abstracts.AbstractService;
import com.myweb.somoim.moim.model.BoardsDAO;
import com.myweb.somoim.moim.model.BoardsDTO;


@Service
public class BoardsService extends AbstractService<List<BoardsDTO>, BoardsDTO> {

	@Autowired
	private BoardsDAO dao;

	@Override
	public List<BoardsDTO> getAll() {
		return null;
	}


	public List<BoardsDTO> getDatas(int id) {  //추가메서드
		List<BoardsDTO> datas = dao.selectDatas(id);
		return datas;
	}

	@Override
	public List<BoardsDTO> getDatas(String id) {
		List<BoardsDTO> datas = dao.selectDatas(id);
		return datas;
	}


	@Override
	public BoardsDTO getData(int id) {
		BoardsDTO data = dao.selectData(id);
		return data;
	}

	@Override
	public BoardsDTO getData(String s) {
		return null;
	}

	@Override
	public BoardsDTO getData(BoardsDTO dto) {
		BoardsDTO data = dao.selectData(dto);
		return data;
	}

	@Override
	public boolean addData(BoardsDTO dto) {
		boolean result = dao.insertData(dto);
		
		return result;
	}

	@Override
	public boolean modifyData(BoardsDTO dto) {
	
		boolean result = dao.updateData(dto);
		return result;
	}

	@Override
	public boolean removeData(BoardsDTO dto) {
		return false;
	}

	@Override
	public boolean removeData(int id) {
		boolean result = dao.deleteData(id);
		return result;
	}

	public boolean removeBoardsData(int id) {
		boolean result = dao.deleteBoardsData(id);
		return result;
	}
	

	public List<BoardsDTO> getBoardDatas(int id) {  //게시물정보가져오기
		List<BoardsDTO> data = dao.selectBoardDatas(id);
		return data;
		
	}
	
	public BoardsDTO getBoardData(int id) {
	BoardsDTO data = dao.selectBoardData(id);
	return data;
	}

}
