package com.care.quiz.membership.service;


import com.care.quiz.membership.dto.AllDTO;
import com.care.quiz.membership.dto.LoginDTO;
import com.care.quiz.membership.dto.MemberDTO;
import com.care.quiz.membership.dto.PostcodeDTO;

public interface IMemberService {
	// 중복 확인
	public String isExistId(String id);
	// 회원 가입
	public String memberProc(MemberDTO member, PostcodeDTO post);
	//회원 목록
	public void memberList(int currentPage, String select, String search);
	//회원 정보
	public AllDTO userInfo(String id);

	//수정 전 비밀번호 체크
	public boolean modifyCheckProc(LoginDTO check);
	// 회원 정보 수정
	public String memberModifyProc(AllDTO user);
	
	public boolean deleteAndCheckProc(LoginDTO check);
	
	
}
