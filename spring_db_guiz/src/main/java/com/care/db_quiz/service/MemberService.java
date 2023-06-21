package com.care.db_quiz.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.care.db_quiz.dto.MemberDTO;
import com.care.db_quiz.repository.IMemberDAO;

@Service
public class MemberService {
	@Autowired private IMemberDAO repo;
	
	public String register(MemberDTO member) {
		if(member.getId() == null || member.getId().isEmpty() || member.getPwd1().isEmpty()) {
			return "필수 정보입니다.";
		}
		if( member.getPwd1().equals(member.getPwd2()) == false) {
			return "두 비밀번호는 일치하지 않습니다.";
		}
		
		MemberDTO result = repo.login(member.getId());
		if(result != null) {
			return "중복 아이디 입니다.";
		}else {
			repo.register(member);
			return member.getId() + "님 가입 완료";
		}
	}
	@Autowired private HttpSession session;
	
	public String login(String id, String pwd1) {
		if(id == null || id.isEmpty() || pwd1 == null || pwd1.isEmpty())
			return "필수 정보입니다.";
		MemberDTO result = repo.login(id);
		if(result == null)
			return "아이디 또는 비밀번호가 일치하지 않습니다.";
		
		if(result.getPwd1().equals(pwd1) == false)
			return "아이디 또는 비밀번호가 일치하지 않습니다.";
		
		session.setAttribute("id", result.getId());
		session.setAttribute("name", result.getName());
		session.setAttribute("addr", result.getAddr());
		session.setAttribute("tel", result.getTel());
		return "로그인 성공";
		
	}

	public ArrayList<MemberDTO> memberInfo() {
		return repo.memberInfo();
	}
	
	public MemberDTO userInfo(String id) {
		MemberDTO result = repo.login(id);
		return result;
	}

	public String update(MemberDTO member) {
		String id = (String)session.getAttribute("id");
		if(id == null || id.isEmpty())
			return "로그인 후 수정 가능";
		
		if(member.getPwd1() == null || member.getPwd1().isEmpty())
			return "필수 정보를 입력하세요";
		if(member.getPwd1().equals(member.getPwd2()) == false)
			return "두 비밀번호가 일치하지 않습니다.";
		/*
		 * 빈값이면 빈값으로 덮어쓰기, 기존데이터가 존재하면 빈값을 사용자가 송신하면 기존데이터로 덮어쓰기.
		 */
		if(member.getName() == null || member.getName().isEmpty()) {
			member.setName((String)session.getAttribute("name"));
		}
		if(member.getAddr() == null || member.getAddr().isEmpty()) {
			member.setAddr((String)session.getAttribute("addr"));
		}
		member.setId(id);
		repo.update(member);
		return "수정 완료";
	}

	public String delete(String pwd1, String pwd2) {
		if(pwd1 == null || pwd1.isEmpty())
			return "필수 정보 입니다.";
		if(pwd1.equals(pwd2) == false)
			return "두 비밀번호가 서로 다르게 입력했습니다.";
		
		String id = (String)session.getAttribute("id");
		MemberDTO result = repo.login(id);
		if(result.getPwd1().equals(pwd1) == false) {
			return "두 비밀번호가 서로 다르게 입력했습니다.";
		}
		repo.delete(result.getId());
		
		return "삭제 완료";
	}
}
