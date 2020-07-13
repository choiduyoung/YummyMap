package com.yummymap.mmy.Service.api;
/**
 * RestAPI 파싱을 위해 제작된 인터페이스입니다.
 * 
 * @author	김종형
 */
import java.io.BufferedReader;
import java.io.Reader;
import java.net.HttpURLConnection;
import java.net.URL;

public interface ConnectApi {
	
	HttpURLConnection getHttpUrlConnection(URL url);
	
	BufferedReader getBufferedReader(HttpURLConnection conn);
	
	URL getUrl(String urlStr);
	
	void disconnectApi(HttpURLConnection conn, Reader reader);
	
	String setURLEncoding(String query);
	
	void setMethod(HttpURLConnection conn, String method);
	
	int getRespCode(HttpURLConnection conn);
	
	StringBuilder readLine(BufferedReader rd);
}
