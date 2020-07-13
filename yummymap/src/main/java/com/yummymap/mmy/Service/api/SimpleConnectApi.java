package com.yummymap.mmy.Service.api;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Reader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import java.net.URLEncoder;

import org.springframework.stereotype.Service;

@Service
public class SimpleConnectApi implements ConnectApi {

	@Override
	public HttpURLConnection getHttpUrlConnection(URL url) {
		HttpURLConnection conn = null;
		try {
			conn = (HttpURLConnection) url.openConnection();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return conn;
	}

	@Override
	public BufferedReader getBufferedReader(HttpURLConnection conn) {
		BufferedReader br = null;
		InputStreamReader isr = null;
		try {
			isr = new InputStreamReader(conn.getInputStream());
			br = new BufferedReader(isr);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return br;
	}

	@Override
	public URL getUrl(String urlStr) {
		URL url = null;
		try {
			url = new URL(urlStr);
		} catch (MalformedURLException e) {
			e.printStackTrace();
		}
		return url;
	}


	@Override
	public void disconnectApi(HttpURLConnection conn, Reader reader) {
		if(reader != null) {
			try {
				reader.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		if(conn != null)
			conn.disconnect();
		
	}
	
	@Override
	public String setURLEncoding(String query) {
		try {
			query = URLEncoder.encode(query,"UTF-8");
			return query;
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return query;
	}

	@Override
	public void setMethod(HttpURLConnection conn, String method) {
		try {
			conn.setRequestMethod(method);
		} catch (ProtocolException e) {
			e.printStackTrace();
		}
	}

	@Override
	public int getRespCode(HttpURLConnection conn) {
		int code = -1;
		try {
			code = conn.getResponseCode();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return code;
	}

	@Override
	public StringBuilder readLine(BufferedReader rd) {
		StringBuilder sb = new StringBuilder();
		String line;
		try {
			while((line = rd.readLine()) != null) {
				sb.append(line);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return sb;
	}


}
