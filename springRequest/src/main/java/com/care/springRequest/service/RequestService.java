package com.care.springRequest.service;

import org.springframework.stereotype.Service;

import com.care.springRequest.dto.LoginDTO;

@Service
public class RequestService {
	// 검증
	public String register(LoginDTO login, String name) {
		if(login.getId() == null || login.getId().isEmpty()) {
			return "아이디를 입력하세요";
		}else if(login.getPw() == null || login.getPw().isEmpty()) {
			return "비밀번호를 입력하세요";
		}
	
		// 데이터베이스에 데이터 저장 완료했다고 가정
		
		return "가입 완료";
	}

}
