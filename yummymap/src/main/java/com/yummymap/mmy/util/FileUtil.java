package com.yummymap.mmy.util;
/**
 * 파일 업로드시 필요한 기능들이 있는 유틸리티클래스입니다.
 * @author	김종형
 */
import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

public class FileUtil {
	public static String rename(String path, String oldName) {
		/*
		 	규칙]
		 		같은 이름의 파일이 존재하면 _1 의 형태로 숫자를 붙여서 바꾸는 방식을 사용하자
		 */
		int count = 0;
		String tmpName = oldName;
		File file = new File(path, oldName);
		while(file.exists()) {
			count++;
			
			int len = tmpName.lastIndexOf(".");
			String tmp1 = tmpName.substring(0, len); // 파일이름
			String tmp2 = tmpName.substring(len);	// 확장자
			
			oldName = tmp1 + "_" + count + tmp2;
			
			file = new File(path, oldName);
		}
		return oldName;
	}
	
	public static String getSavename(HttpSession session, MultipartFile file, String folder) {
		String savename = null;
		String filePath = session.getServletContext().getRealPath("resources")+"/"+folder;

		String oriname = file.getOriginalFilename();
		System.out.println("Util.oriname : " + oriname);
		
		if(oriname != null) {
			savename = getUUID(oriname);
			System.out.println("Util.savename : " + savename);
		}
		try {
			File refile = new File(filePath, savename);
			byte[] Byte = file.getBytes();
			FileCopyUtils.copy(Byte, refile);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return savename;
	}
	
	
	public static String getUUID(String oriname) {
		UUID uuid = UUID.randomUUID();
		String savename = uuid.toString() + "_" + oriname;
		return savename;
	}
	
}
