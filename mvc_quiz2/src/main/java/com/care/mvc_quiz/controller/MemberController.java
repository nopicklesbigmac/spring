package com.care.mvc_quiz.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.care.mvc_quiz.dto.MemberDTO;
import com.care.mvc_quiz.service.MemberService;

@Controller
public class MemberController {
	@Autowired private MemberService service;
	
	//http://localhost:8085/mvc_quiz/register
	@GetMapping("register")
	public String register() {
		return "member/register";
	}
	@PostMapping("register")
	public String register(MemberDTO member, Model model) {
		String msg = service.register(member);
		model.addAttribute("msg", msg);
		if(msg.equals(member.getId() + "님 가입 완료"))
			return "member/index";
		
		return "member/register";
	}
	//http://localhost:8085/mvc_quiz/login
	@GetMapping("login")
	public String login() {
		return "member/login";
	}
	@PostMapping("login")
	public String login(String id, String pwd1, Model model) {
		String msg = service.login(id, pwd1);
		model.addAttribute("msg", msg);
		if(msg.equals("로그인 성공"))
			return "member/index";
		return "member/login";
	}
	@RequestMapping("logout")
	public String logout(HttpSession session, RedirectAttributes ra) {
		session.invalidate();
		ra.addFlashAttribute("msg", "로그 아웃");
		return "redirect:index";
	}
	//http://localhost:8085/mvc_quiz/index
	@RequestMapping("index")
	public String index() {
		return "member/index";
	}
	
	@RequestMapping("memberInfo")
	public String memberInfo(Model model) {
		ArrayList<MemberDTO> members = service.memberInfo();
		model.addAttribute("members", members);
		return "member/memberInfo";
	}
	@RequestMapping("userInfo")
	public String userInfo(Model model, String id) {
		MemberDTO member = service.userInfo(id);
		model.addAttribute("member", member);
		return "member/userInfo";
	}
	
	@GetMapping("update")
	public String update(HttpSession session, String id) {
		String sessionId = (String)session.getAttribute("id");
		if(sessionId == null || sessionId.isEmpty())
			return "redirect:login";
		System.out.println("세션 아이디 : " + sessionId);
		System.out.println("버튼 클릭 아이디  : " + id);
		
		if(sessionId.equals(id) == false)
			return "redirect:index";
		return "member/update";
	}
	
	@PostMapping("update")
	public String update(HttpSession session, MemberDTO member, 
			RedirectAttributes ra, Model model) {
		String msg = service.update(member);
		if(msg.equals("수정 완료")) {
			session.invalidate();
			ra.addFlashAttribute("msg", msg);
			return "redirect:index";
		}
		model.addAttribute("msg", msg);
		return "member/update";
	}
	
	@GetMapping("delete")
	public String delete(HttpSession session) {
		String sessionId = (String)session.getAttribute("id");
		if(sessionId == null || sessionId.isEmpty())
			return "redirect:login";
		return "member/delete";
	}
	@PostMapping("delete")
	public String delete(String pwd1, String pwd2, Model model, HttpSession session) {
		String msg = service.delete(pwd1, pwd2);
		model.addAttribute("msg", msg);
		if(msg.equals("삭제 완료")) {
			session.invalidate();
			return "member/index";
		}
		return "member/delete";
	}
}








