package com.yummymap.mmy.Service.main;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.yummymap.mmy.dao.MainDAO;
import com.yummymap.mmy.util.FileUtil;
import com.yummymap.mmy.vo.ImageFileVO;

@Service
public class FileService {
	
	public List<ImageFileVO> uploadProcess(HttpSession session, MultipartFile[] files) {
		List<ImageFileVO> imageFileVoList = new ArrayList<ImageFileVO>();
		String path = session.getServletContext().getRealPath("resources");
		path = path + "/upsoImg";
		for(int i=0; i<files.length - 1; i++) {
			ImageFileVO imageFileVo = new ImageFileVO();
			String original_name = files[i].getOriginalFilename();
			original_name = original_name.replaceAll(" ", "");
			if(original_name == null || original_name.length() == 0) {
				continue;
			}
			String save_name = FileUtil.rename(path, original_name);
			try {
				File saveFile = new File(path, save_name);
				files[i].transferTo(saveFile);
			} catch (Exception e) {
				e.printStackTrace();
			}
			imageFileVo.setOriginal_name(original_name);
			imageFileVo.setSave_name(save_name);
			imageFileVoList.add(imageFileVo);
		}
		return imageFileVoList;
	}
	
}
