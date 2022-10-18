package com.myweb.somoim.moim.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myweb.somoim.members.model.MembersDTO;
import com.myweb.somoim.moim.model.BoardsDTO;
import com.myweb.somoim.moim.model.CommentsDAO;
import com.myweb.somoim.moim.model.CommentsDTO;

@Service
public class CommentsService {
	
	@Autowired
	private CommentsDAO dao;
	
	
	public List<CommentsDTO> getDatas(Map map) {  //추가메서드
		List<CommentsDTO> datas = dao.selectDatas(map);
		return datas;
	}

	public List<CommentsDTO> getDatas(String id) {  //추가메서드
		List<CommentsDTO> datas = dao.selectDatas(id);
		return datas;
	}


	public CommentsDTO getData(int id) {  //댓글 존재확인
		CommentsDTO data = dao.selectData(id);
		return data;
	}
	
	
	public boolean addData(CommentsDTO commentsDto) {
		boolean res = dao.insert(commentsDto);
		return res;
	}


	public boolean removeData(int id) { //코멘트전체삭제
		
		boolean res = dao.delete(id);
		return res;
		
	}


	public boolean removeComment(int cid) { //특정코멘트만삭제
		boolean res = dao.deleteComment(cid);
		return res;
	
	}


	public boolean modifyComment(CommentsDTO commentsDto) { //코멘트수정
		boolean res = dao.updateComment(commentsDto);
		return res;
	}


	


}
