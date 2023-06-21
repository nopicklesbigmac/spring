package com.my.megabox.booking.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.my.megabox.booking.dto.MemberDTO;
import com.my.megabox.booking.service.KakaoService;
import com.my.megabox.booking.service.LoginService;

@Controller
public class LoginController {
	
	@Autowired private LoginService loginService;
	@Autowired private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	
	//���ǿ� �α��ε� ���̵� �ִ��� Ȯ��
	@PostMapping("/login/selectLoginSession")
	@ResponseBody
	public String selectLoginSession(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String session_loginId = (String) session.getAttribute("loginId");
		if(session_loginId==null) {
			return "false";
		}else {
			return "true";
		}
	}
	
	//�α��� ����(success or fail ��ȯ)
	@PostMapping("login/selectMbLoginInfo")
	@ResponseBody
	public Map<String,String> loginAjax(@RequestBody Map<String,String> map_request, HttpServletRequest request){
		Map<String,String> map_response = new HashMap<String,String>();
		String id = map_request.get("loginId");
		String pw = map_request.get("loginPwd");
		MemberDTO dto = loginService.login(id);
		if(dto!=null) {
			if(bcryptPasswordEncoder.matches(pw,dto.getU_pw())) {
				map_response.put("revStr","loginSuccess");
				HttpSession session = request.getSession();
				session.setAttribute("loginId", id);
				session.setAttribute("loginNum", dto.getU_num());
				session.setAttribute("name", dto.getU_name());
				session.setAttribute("tel", dto.getU_tel());
			}else {
				map_response.put("revStr","loginPwdFail");
			}
		}
		else {
			map_response.put("revStr","loginPwdFail");
		}
		return map_response;
	}
	//�α��� ���̵� ���� ��ȯ(success or fail ��ȯ)
	@PostMapping("login/selectMbLoginInfoData")
	@ResponseBody
	public Map<String,String> loginIdDataAjax(@RequestBody Map<String,String> map_request, HttpServletRequest request){
		Map<String,String> map_response = new HashMap<String,String>();
		String id = map_request.get("loginId");
		MemberDTO dto = loginService.login(id);
		if(dto!=null) {
				map_response.put("u_email", dto.getU_email());
				map_response.put("u_name", dto.getU_name());
				map_response.put("u_tel", dto.getU_tel());
				map_response.put("u_num", Integer.toString(dto.getU_num()));
				}
		return map_response;
	}
	
	
	//�α׾ƿ�(���ǿ��� ����)
	@PostMapping("login/logoutSession")
	@ResponseBody
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		if(session.getAttribute("socialLogin")!=null) {
			kakaoService.logout((String)session.getAttribute("loginId"));
			session.removeAttribute("socialLogin");
		}
		session.removeAttribute("loginId");
		return "�α׾ƿ� �Ǿ����ϴ�";
	}
	
	
	@Autowired private KakaoService kakaoService;
	
	//īī�� �α���
	@RequestMapping("login/kakaoLogin")
	public String kakaoLogin(String code, HttpSession session, HttpServletRequest request) {
		
		String accessToken = kakaoService.getAccessToken(code,request);
		HashMap<String, String> map = kakaoService.getUserInfo(accessToken);
		System.out.println("�̸��� : " + map.get("email"));
		if(map.get("email")!=null) {
			session.setAttribute("loginId", accessToken);
			session.setAttribute("socialLogin", "true");
		}
		return "login/kakaoLoginFinish";
	}
	
	//īī�� �α��� ���� �� ��ũ��Ʈ ������ ���� ����
	@RequestMapping("login/kakoLoginFinish")
	public void requestKakaoLoginFinish() {
		
	}
}
