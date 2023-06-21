package com.care.member.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.care.member.dto.MemberDTO;
import com.care.member.service.MemberService;

@Controller
public class MemberController {
	@Autowired private MemberService service;
	
	@RequestMapping("list")
	public String list(Model model) {
		ArrayList<MemberDTO> list = service.list();
		if(list == null || list.isEmpty())
			model.addAttribute("list", "등록된 정보가 없습니다.");
		model.addAttribute("list", list);
		return "list";
	}
	
	@GetMapping("register")
	public void register() {}
	
	@PostMapping("register")
	public String register(MemberDTO dto) {
		String msg = service.register(dto);
		if(msg.equals("가입 완료")) {
			return "redirect:list";
		}else {
			return "register";
		}
		
	}
}
