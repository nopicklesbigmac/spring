package com.care.member.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.care.member.dao.MemberDAO;
import com.care.member.dto.MemberDTO;

@Service
public class MemberService {
	private MemberDAO dao;
	
	public MemberService() {
		dao = new MemberDAO();
	}
	
	public ArrayList<MemberDTO> list() {
		ArrayList<MemberDTO> list = dao.list();
		if(list == null || list.isEmpty())
			return null;
		return list;
	}

	public String register(MemberDTO dto) {
		if(dto.getId() == null || dto.getId().isEmpty())
			return "아이디를 입력하세요";
		
		int returnData = dao.register(dto);
		if(returnData == 1)
			return "가입 완료";
		return "가입 실패";
	}

}
