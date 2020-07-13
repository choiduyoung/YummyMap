/**
 * @author 유태희
 * @sinec 2020.06.13
 * 	이클래스는 RsaService 를 구현 하는 RSA 암/복호화 클래스 입니다
 * 
 */
package com.yummymap.mmy.Service.rsa;

import java.security.Key;
import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.spec.RSAPublicKeySpec;
import java.util.Base64;
import java.util.HashMap;

import javax.crypto.Cipher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;


@Service
public class RsaServiceImpl implements RsaService {
	private String RSA_WEB_KEY = "WEB_key"; //개인키
	private String RSA_INSTANCE = "RSA"; 
	private Key PUBLIC_KEY; 
	private HashMap<String, PrivateKey> map = new HashMap<String, PrivateKey>();
	
	public String getRSA_WEB_KEY() {
		return RSA_WEB_KEY;
	}

	public String getRSA_INSTANCE() {
		return RSA_INSTANCE;
	}
	
	public HashMap<String, PrivateKey> getMap() {
		return map;
	}

	//키생성 
	@Override
	public void initRsa(HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		KeyPairGenerator generator;
		
		try {
			generator = KeyPairGenerator.getInstance(RSA_INSTANCE);
			generator.initialize(1024);
			
			KeyPair keyPair = generator.genKeyPair();
			KeyFactory keyFactory = KeyFactory.getInstance(RSA_INSTANCE);
			PublicKey publicKey = keyPair.getPublic();
			PrivateKey privateKey = keyPair.getPrivate();
			this.PUBLIC_KEY = publicKey;
//			session.setAttribute(RSA_WEB_KEY, privateKey); //세션에 rsa 개인키를 세션에 저장
			
			RSAPublicKeySpec publicSpec = (RSAPublicKeySpec) keyFactory.getKeySpec(publicKey, RSAPublicKeySpec.class);
            String publicKeyModulus = publicSpec.getModulus().toString(16);
            String publicKeyExponent = publicSpec.getPublicExponent().toString(16);
            map.put(publicKeyModulus , privateKey);
 
            request.setAttribute("RSAModulus", publicKeyModulus); // rsa modulus 를 request 에 추가
            request.setAttribute("RSAExponent", publicKeyExponent); // rsa exponent 를 request 에 추가
            
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//복호화 
	@Override
	public byte[] hexToByteArray(String hex) {
        if (hex == null || hex.length() % 2 != 0) { return new byte[] {}; }
        
        byte[] bytes = new byte[hex.length() / 2];
        for (int i = 0; i < hex.length(); i += 2) {
            byte value = (byte) Integer.parseInt(hex.substring(i, i + 2), 16);
            bytes[(int) Math.floor(i / 2)] = value;
        }
        return bytes;
	}

	@Override
	public String decryptRsa(PrivateKey privateKey, String securedValue) throws Exception {
		Cipher cipher = Cipher.getInstance(RSA_INSTANCE);
        byte[] encryptedBytes = hexToByteArray(securedValue);
        cipher.init(Cipher.DECRYPT_MODE, privateKey);
        byte[] decryptedBytes = cipher.doFinal(encryptedBytes);
        String decryptedValue = new String(decryptedBytes, "utf-8"); // 문자 인코딩 주의.
        return decryptedValue;
	}

	
	//암호화
	@Override
	public String encrypt(String inputStr) throws Exception {
        Cipher c = Cipher.getInstance(RSA_INSTANCE);
        c.init(Cipher.ENCRYPT_MODE, PUBLIC_KEY);
        byte[] encrypted = c.doFinal(inputStr.getBytes("UTF-8"));// 암호화된 데이터(byte 배열)
        return new String(Base64.getEncoder().encode(encrypted));
	}



}
