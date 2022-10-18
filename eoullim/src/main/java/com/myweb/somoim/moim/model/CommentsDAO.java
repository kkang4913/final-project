package com.myweb.somoim.moim.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.myweb.somoim.members.model.MembersDTO;

@Repository
public class CommentsDAO {
	
	@Autowired
	private SqlSession session ;
	private String mapper ="commentsMapper.%s";
	
	
	
	public List<CommentsDTO> selectDatas(Map map) {
		String mapperId = String.format(mapper, "selectDatas");
		List<CommentsDTO> datas = session.selectList(mapperId,map);
		return datas;
		
	}
	public List<CommentsDTO> selectDatas(String id) {
		String mapperId = String.format(mapper, "selectWriteDatas");
		List<CommentsDTO> datas = session.selectList(mapperId, id);
		return datas;
	}

	

	public CommentsDTO selectData(int id) { //댓글존재확인
		String mapperId = String.format(mapper, "selectData");
		System.out.println("댓글존재확인" + id);
		CommentsDTO datas = session.selectOne(mapperId,id);
		System.out.println("결과확인"+ datas);
		return datas;
		
	}
	

    public boolean insert(CommentsDTO commentsDto) {
    	String mapperId = String.format(mapper, "insertData");
		int res = session.insert(mapperId,commentsDto);
		return res == 1 ? true : false;
	}


	public boolean delete(int id) {
		String mapperId = String.format(mapper, "deleteData");
	    int res = session.delete(mapperId,id);
	    return res == 1 ? true : false;
		
	}


    public boolean deleteComment(int id) { //특정코멘트삭제
		String mapperId = String.format(mapper, "deleteCommentData");
	    int res = session.delete(mapperId,id);
	    return res == 1 ? true : false;
	}



	public boolean updateComment(CommentsDTO commentsDto) { //코멘트수정
		String mapperId = String.format(mapper, "updateCommentData");
	    int res = session.delete(mapperId,commentsDto);
	    return res == 1 ? true : false;
	}



}
