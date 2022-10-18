package com.myweb.somoim.common.model;

import java.util.List;

import com.myweb.somoim.members.model.MembersDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.myweb.somoim.model.SomoimDTO;

@Repository
public class FilesDAO {
	
	@Autowired
	private SqlSession session;
	
	private String mapper = "moimsMapper.%s";
	
	public boolean modifyImage(SomoimDTO data) {
		String mapperId = String.format(mapper, "updateImage");
		int res = session.update(mapperId,data);

		if(res == 1) {
			return true;
		}
		return false;
}

	public boolean modifyInfoImage(MembersDTO data) {
		String mapperId = String.format(mapper, "updateInfoImage");
		int res = session.update(mapperId,data);

		if(res == 1) {
			return true;
		}
		return false;
	}

    public boolean modifyProfileImage(MembersDTO data) {
		String mapperId = String.format(mapper, "updateProfileImage");
		int res = session.update(mapperId,data);

		if(res == 1) {
			return true;
		}
		return false;
    }
}
