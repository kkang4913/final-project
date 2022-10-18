package com.myweb.somoim.moim.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.myweb.somoim.common.abstracts.AbstractDAO;
import com.myweb.somoim.model.SomoimDTO;

@Repository
public class BoardsDAO extends AbstractDAO<List<BoardsDTO>, BoardsDTO> {

	@Autowired
	private SqlSession session ;
	private String mapper ="boardsMapper.%s";
	
	
	@Override
	public List<BoardsDTO> selectAll() {
		return null;
	}
	
	@Override
	public List<BoardsDTO> selectDatas(int id) {
		String mapperId = String.format(mapper, "selectDatas");
		List<BoardsDTO> res = session.selectList(mapperId,id);
		return res;
	}

	@Override
	public List<BoardsDTO> selectDatas(String id) {
		String mapperId = String.format(mapper, "selectWriteDatas");
		List<BoardsDTO> res = session.selectList(mapperId,id);
		return res;
	}
	
	@Override
	public BoardsDTO selectData(int id) { //boardId로 데이터 가져오기
		String mapperId = String.format(mapper, "selectData");
	    BoardsDTO data = session.selectOne(mapperId,id);
		return data;
	}

	@Override
	public BoardsDTO selectData(String s) {
		return null;
	}

	@Override
	public BoardsDTO selectData(BoardsDTO dto) { //board 상세정보가져오기
		String mapperId = String.format(mapper, "selectBoardData");
	    BoardsDTO data = session.selectOne(mapperId,dto);
		return data;
	}

	
	
	
	@Override
	public int getNextSeq() {
		return 0;
	}

	@Override
	public boolean insertData(BoardsDTO dto) {
		String mapperId = String.format(mapper, "insertData");
		int  result = session.insert(mapperId,dto);
		
		if(result == 1) {
			return true;
		}
		return false;
	}

	@Override
	public boolean updateData(BoardsDTO dto) {
		String mapperId = String.format(mapper, "updateData");
		int  result = session.update(mapperId,dto);
		
		
		if(result == 1) {
			return true;
		}
		return false;
	}
	
	@Override
	public boolean deleteData(BoardsDTO dto) {
		return false;
	}

	@Override
	public boolean deleteData(int id) {
		String mapperId = String.format(mapper, "deleteData");
		int  result = session.delete(mapperId,id);
		
		if(result == 1) {
			return true;
		}
		return false;
	}
	public boolean deleteBoardsData(int id) {
		String mapperId = String.format(mapper, "deleteBoardsData");
		int  result = session.insert(mapperId, id);

		return result > 0 ? true : false;
	}

	public List<BoardsDTO> selectBoardDatas(int id) {
		String mapperId = String.format(mapper, "selectBoardInfoList");
		List<BoardsDTO>  datas = session.selectList(mapperId, id);

		return datas;
	}
	
	public BoardsDTO selectBoardData(int id) {
		String mapperId = String.format(mapper, "selectBoardInfo");
		BoardsDTO  datas = session.selectOne(mapperId, id);

		return datas;
	}
	
}
