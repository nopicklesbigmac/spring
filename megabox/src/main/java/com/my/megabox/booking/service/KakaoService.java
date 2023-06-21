package com.my.megabox.booking.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Service
public class KakaoService {
	

	public String getAccessToken(String code, HttpServletRequest request) {
		String accessToken = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";
		try {
			String sendMessage = "grant_type=authorization_code" + 
						"&client_id=fc1c6f725158262e3d3008e9eda48e0c"
					+ "&redirect_uri=http://localhost:8085" + request.getContextPath()+
						"/login/kakaoLogin" + "&code=" + code;
			
			System.out.println("url : " + sendMessage);
			URL url = new URL(reqURL); // POST ��û�� �ʿ�� �䱸�ϴ� �Ķ���� ��Ʈ���� ���� ����
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST"); // POST ��û�� ���� �⺻�� false���� setDoOutput�� true�� ����
			conn.setDoOutput(true); // POST �޼ҵ带 �̿��ؼ� �����͸� �����ϱ� ���� ����

			// �⺻ outputStream�� ���� ���ڿ��� ó���� �� �ִ� OutPutStreamWriter ��ȯ �� ó���ӵ��� ������ �ϱ�����
			// BufferedWriter�� ��ȯ�ؼ� ����Ѵ�.
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			bw.write(sendMessage);
			bw.flush();

			int responseCode = conn.getResponseCode(); // ��� �ڵ尡 200�̶�� ����
			System.out.println("responseCode : " + responseCode);

			// ��û�� ���� ���� JSONŸ���� Response �޼��� �о����
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "", result = "";
			while ((line = br.readLine()) != null) {
				result += line;
			}

			System.out.println("response body : " + result);
//			System.out.println("result.split : " + result.split(","));

			// Gson ���̺귯���� ���Ե� Ŭ������ JSON�Ľ� ��ü ����
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
			accessToken = element.getAsJsonObject().get("access_token").getAsString();
			System.out.println("access_token : " + accessToken);

			br.close();
			bw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return accessToken;
	}

	public HashMap<String, String> getUserInfo(String accessToken) {
		HashMap<String, String> userInfo = new HashMap<String, String>();
		String reqURL = "https://kapi.kakao.com/v2/user/me";

		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");

			// ��û�� �ʿ��� Header�� ���Ե� ����
			conn.setRequestProperty("Authorization", "Bearer " + accessToken);

			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";
			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);
			/*
			 * { "id":2346534020, "connected_at":"2022-07-18T10:58:52Z",
			 * "properties":{"nickname":"�迬��"}, "kakao_account":{
			 * "profile_nickname_needs_agreement":false, "profile":{"nickname":"�迬��"},
			 * "has_email":true, "email_needs_agreement":false, "is_email_valid":true,
			 * "is_email_verified":true, "email":"kyes0222@gmail.com" } }
			 */
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);

			
			JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
			//JsonObject profile = kakao_account.getAsJsonObject().get("profile").getAsJsonObject();
			String nickname = "";
			//profile.getAsJsonObject().get("nickname").getAsString();
			String email = kakao_account.getAsJsonObject().get("email").getAsString();

			userInfo.put("nickname", nickname);
			userInfo.put("email", email);
			

		} catch (IOException e) {
			e.printStackTrace();
		}
		return userInfo;
	}

	public void logout(String accessToken) {
		String reqURL = "https://kapi.kakao.com/v1/user/logout";

		URL url;
		try {
			url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			// ��û�� �ʿ��� Header�� ���Ե� ����
			conn.setRequestProperty("Authorization", "Bearer " + accessToken);
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode1 : " + responseCode);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void logout2(HttpServletRequest request) {
		String reqURL = "https://kauth.kakao.com/oauth/logout";
		URL url;
		 StringBuffer params = new StringBuffer();
		 params.append("client_id=" + "fc1c6f725158262e3d3008e9eda48e0c");
		 params.append("&logout_redirect_uri=http://localhost:8085" + request.getContextPath()+"/login/logout");
		try {
			url = new URL(reqURL + "?" + params.toString());
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
//			conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded; charset=utf-8");
//			conn.setDefaultUseCaches(false);
//			conn.connect();
			
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}