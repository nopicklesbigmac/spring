package com.care.springRequest.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.care.springRequest.dto.LoginDTO;
import com.care.springRequest.service.RequestService;

@Controller
public class RequestController {
	@Autowired private RequestService service;
	
	//http://localhost:8085/springRequest/login
	@GetMapping("login")
	public void login() {
		System.out.println("get 요청의 login 메소드 실행");
//		return "login"; // @GetMapping("login") == login.jsp 동일한 경우 생략 가능.
	}
	
//	@PostMapping("login")
//	public void login(String ids, String pw) {
//	public void login(HttpServletRequest req) {
//	public void login(@RequestParam("ids")String id,@RequestParam("pwd")String pw) {
//	public void login(LoginDTO login) {
//		System.out.println("post 요청의 login 메소드 실행");
//		System.out.println("아이디 : " + ids);
//		System.out.println("비밀번호 : " + pw);
//		System.out.println("아이디 : " + req.getParameter("ids"));
//		System.out.println("비밀번호 : " + req.getParameter("pw"));
//		
//		
//		System.out.println("아이디 : " + login.getId());
//		System.out.println("비밀번호 : " + login.getPw());
//	}
	
	@PostMapping("login")
	public String login(LoginDTO login, Model model) {
		System.out.println("post 요청의 login 메소드 실행");
		System.out.println("아이디 : " + login.getId());
		System.out.println("비밀번호 : " + login.getPw());
		model.addAttribute("id", login.getId());
		model.addAttribute("pw", login.getPw());
		model.addAttribute("login", login);
 
		/*
		 * return "index";
		 * viewResolver에게 전달하여 jsp파일을 찾아 실행 후 결과를 클라이언트에게 응답.
		 */
		/* 
		 * return "redirect:index"; 
		 * 요청 경로를 클라이언트에게 응답.
		 * 요청 경로를 받은 클라이언트가 서버로 재요청함.
		 */
		/* 
		 * return "forward:index"; 
		 * 요청 경로를 서버 내부에서 요청함.
		 * 서버 내부에서 Mapping을 찾아 메소드 실행.
		 */
		 return "forward:index"; 
	}
	@RequestMapping("index")
	public void index() {
		System.out.println("index 메소드 실행");
	}
	
	//http://localhost:8085/springRequest/register
	@GetMapping("register")
	public void getRegister() {}
	
	@PostMapping("register")
	public String postRegister(LoginDTO login, String name, 
			Model model, RedirectAttributes ra) {
		
		String result = service.register(login, name);
		if(result.equals("가입 완료")) {
			//RedirectAttributes : redirect 시 데이터를 담아 전달하기 위해서 사용하는 객체.
			ra.addFlashAttribute("msg", result);
			return "redirect:index";
		}
		model.addAttribute("msg", result);
		return "register";
		
	}
}

















