package com.yummymap.mmy.Service.txt;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.yummymap.mmy.dao.TxtDAO;
import com.yummymap.mmy.util.FileUtil;
import com.yummymap.mmy.vo.txt.TxtVO;

@Service("TxtService")
public class TxtService {
	
	@Autowired
	TxtDAO tDAO;
	
	public int file(TxtVO tVO, HttpSession session) {
		System.out.println("1");
		try {
			MultipartFile file = tVO.getFile();
			System.out.println();
			String filePath = session.getServletContext().getRealPath("resources/img/txtimg");
			String savename = FileUtil.getSavename(session, file, "img/txtimg");
			tVO.setOriname(file.getOriginalFilename());
			tVO.setSavename(savename);
			file.transferTo(new File(filePath, tVO.getOriname()));
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(tVO.getOriname());
		return tDAO.file(tVO);
	}
	
	
}
