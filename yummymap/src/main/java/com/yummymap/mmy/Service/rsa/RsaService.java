package com.yummymap.mmy.Service.rsa;

import java.security.PrivateKey;
import java.security.PublicKey;

import javax.servlet.http.HttpServletRequest;

public interface RsaService {
		
	public void initRsa(HttpServletRequest request);
	
	public byte[] hexToByteArray(String hex);
	
	public String decryptRsa(PrivateKey  privateKey, String securedValue) throws Exception;
	
	public String encrypt (String inputStr) throws Exception;


}
