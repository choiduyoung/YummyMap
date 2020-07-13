package com.yummymap.mmy.Service.api;

import java.io.BufferedReader;
import java.io.Reader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.springframework.stereotype.Service;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Service()
public class JsonConnectApiImpl implements JsonConnectApi {
	
	private ConnectApi connectApi;
	
	public JsonConnectApiImpl(SimpleConnectApi connectApi) {
		this.connectApi = connectApi;
	}

	@Override
	public HttpURLConnection getHttpUrlConnection(URL url) {
		return connectApi.getHttpUrlConnection(url);
	}

	@Override
	public BufferedReader getBufferedReader(HttpURLConnection conn) {
		return connectApi.getBufferedReader(conn);
	}

	@Override
	public URL getUrl(String urlStr) {
		return connectApi.getUrl(urlStr);
	}

	@Override
	public void disconnectApi(HttpURLConnection conn, Reader reader) {
		connectApi.disconnectApi(conn, reader);
		
	}
	public String setURLEncoding(String query) {
		return connectApi.setURLEncoding(query);
	}

	@Override
	public void setMethod(HttpURLConnection conn, String method) {
		connectApi.setMethod(conn, method);
		
	}
	public int getRespCode(HttpURLConnection conn) {
		return connectApi.getRespCode(conn);
	}

	@Override
	public StringBuilder readLine(BufferedReader rd) {
		return connectApi.readLine(rd);
	}
	@Override
	public JsonObject toJsonObject(String jsonStr) {
		JsonObject jsonObject = (JsonObject) new JsonParser().parse(jsonStr);
		return jsonObject;
	}

}
