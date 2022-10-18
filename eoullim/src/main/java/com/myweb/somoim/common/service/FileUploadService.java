package com.myweb.somoim.common.service;



import com.myweb.somoim.members.model.MembersDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.myweb.somoim.common.model.FilesDAO;
import com.myweb.somoim.model.SomoimDAO;
import com.myweb.somoim.model.SomoimDTO;


@Service
public class FileUploadService {
	
	@Autowired
	private FilesDAO dao;

	
	public boolean modifyMoimImage(SomoimDTO data){
        boolean result = dao.modifyImage(data);
		return result;
	}
	public boolean modifyInfoImage(MembersDTO data){
		boolean result = dao.modifyInfoImage(data);
		return result;
	}


	public boolean modifyProfileImage(MembersDTO data) {
		boolean result = dao.modifyProfileImage(data);
		return result;
	}
}
