package com.yummymap.mmy.Service.admin;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

@Service
@Component
public class AdminService {
	static String path;
	private static Logger logger = LoggerFactory.getLogger(AdminService.class);
	public AdminService() {
		path = this.getClass().getResource("/").getPath();
		path = path.substring(0, path.lastIndexOf("/"));
		System.setProperty("spath", path);
	}


	public void PublicKeySrvc(HttpServletRequest req) {

		String ip = req.getHeader("X-FORWARDED-FOR");
		if (ip == null) {
			ip = req.getRemoteAddr();
		}
		Date time = new Date();
		SimpleDateFormat form = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String date = form.format(time);

		logger.info("{} {} {}", date, ip, " - 회원가입");
	}

	public void logView(ModelAndView mv, String logName) {
		String path = this.getClass().getResource("/").getPath() + "/log/";

		File file = new File(path);

		String[] file_name = file.list();

		StringBuffer buffer = new StringBuffer();
		FileInputStream input = null;
		int i = 0;
		try {
			if (logName == null || logName.length() == 0) {
				input = new FileInputStream(path + "join.log");
				logName = "join.log";
			} else {
				input = new FileInputStream(path + logName);
			}
			InputStreamReader inputStreamReader = new InputStreamReader(input, "UTF-8");

			while ((i = inputStreamReader.read()) != -1) {
				buffer.append((char) i);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		String log = buffer.toString();

		log = log.replaceAll("\r\n", "<br>");
		mv.addObject("OPT", file_name);
		mv.addObject("LOG", log);
		mv.addObject("LOGNAME", logName);
		mv.setViewName("admin/logView");

	}
}
