package com.db.basic.controller;

import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.db.basic.service.MailService;

@RestController
public class EmailController {
	@Autowired private MailService service;
	private String number;
	
	@PostMapping(value = "sendAuth", produces = "text/html; charset=UTF-8")
	public String sendAuth(@RequestBody(required = false)String email) {
		//자료형은 문자열, 구성된 문자열은 0~9,자릿수는6자리, 랜덤 값
		if(email == null||email.isEmpty())
			return "이메일 주소를 입력하세요";
		Random r = new Random();
		r.nextInt(1000000);
		int begin = 111111;
		int end = 999999;
		number = String.format("%06d", r.nextInt(end-begin+1)+begin);
		service.sendMail(email, "[인증번호]", number);
		return "이메일을 확인 하세요.";
	}
	@PostMapping(value = "checkAuth", produces = "text/html; charset=UTF-8")
	public String checkAuth(@RequestBody(required = false)String authNumber,
			HttpSession session) {
		if(authNumber == null||authNumber.isEmpty())
			return "인증 번호를 입력하세요";
		if(authNumber.equals(number)==false)
			return "인증 실패";
		session.setAttribute("authState", "success");
		return "인증 성공";
	}
}
