package com.jajangso.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.jajangso.dao.DietImageDAO;
import com.jajangso.model.Criteria1;
import com.jajangso.model.DietImageVO;

@Service
public class DietImageService {
	
	@Autowired private DietImageDAO dao;
	
	public int insertImage(DietImageVO vo, HttpServletRequest request) throws IllegalStateException, IOException {
		MultipartRequest mpRequest = (MultipartRequest) request;
		MultipartFile imageFile = mpRequest.getFile("imageFile");
		
		String path = "C:\\uploads";
		File dir = new File(path);
		
		if(dir.exists() == false) {
			dir.mkdir();
		}
		String fileName = imageFile.getOriginalFilename();
		
		if("".equals(fileName) == false) {
			File dest = new File(path, fileName);
			imageFile.transferTo(dest);
			vo.setImage(fileName);
		}
		return dao.insertImage(vo);
	}
	
	// 이미지 리스트
	public List<DietImageVO> list(Criteria1 cri){
		return dao.list(cri);
	}
	
	// 게시물 총 개수 
	public int listcount() {
		return dao.listcount();
	}

}
