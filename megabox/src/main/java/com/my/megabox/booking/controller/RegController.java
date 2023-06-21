package com.my.megabox.booking.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.my.megabox.booking.dto.MemberDTO;
import com.my.megabox.booking.service.RegService;

@Controller
public class RegController {

	@Autowired private RegService regService;
	@Autowired private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	
	@GetMapping("join")
	public void getJoin() {
		
	}
	
	@GetMapping("phoneCheck")
	@ResponseBody
	public String sendSMS(@RequestParam("phone") String userPhoneNumber, HttpServletRequest request) { // 휴대폰 문자보내기
		int randomNumber = (int)((Math.random()* (9999 - 1000 + 1)) + 1000);//난수 생성
		
		HttpSession session = request.getSession();
		session.setAttribute("phoneNum", userPhoneNumber);
		Boolean check = regService.certifiedPhoneNumber(userPhoneNumber,randomNumber);
		if(check) {
			return Integer.toString(randomNumber);	
		}
		else {
			return "error";
		}
		
	}
	
	@PostMapping("join/phoneCheck")
	public void postPhoneCheck() {
		
	}
	
	@GetMapping("join/utilClauPage")
	public void UtilClauPage() {
		
	}
	
	@GetMapping("join/regMain")
	public void regMain() {
		
	}
	
	@PostMapping("idCheck")
	@ResponseBody
	public String idCheckAjax(@RequestParam("id") String id) {
		int num = regService.idDoubleCheck(id);
		String check = Integer.toString(num);
		return check;
	}
	
	@PostMapping("reg")
	@ResponseBody
	public Map<String,String> register(@RequestBody MemberDTO dto,HttpServletRequest request)throws Exception {
		HttpSession session = request.getSession();
		Map<String,String> map = new HashMap<String, String>();
		map.put("name", dto.getU_name());
		session.setAttribute("name", dto.getU_name());
		dto.setU_tel((String) session.getAttribute("phoneNum"));
		//pw 암호화
		dto.setU_pw(bcryptPasswordEncoder.encode(dto.getU_pw()));
		regService.register(dto);
		
		return map;
	}
	
	@GetMapping("join/regFinish")
	public void getRegFinish(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		session.removeAttribute("phoneNum");
	}
}
