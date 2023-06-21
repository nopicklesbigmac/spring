package com.care.db_quiz.repository;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import com.care.db_quiz.dto.MemberDTO;

@Repository
public interface IMemberDAO {
	MemberDTO login(String id);

	void register(MemberDTO member);

	ArrayList<MemberDTO> memberInfo();

	void update(MemberDTO member);

	void delete(String id);
}
