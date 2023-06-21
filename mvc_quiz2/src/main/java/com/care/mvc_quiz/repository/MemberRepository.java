package com.care.mvc_quiz.repository;

import java.util.ArrayList;
import com.care.mvc_quiz.dto.MemberDTO;

public class MemberRepository {
	private ArrayList<MemberDTO> db;
	
	public MemberRepository() {
		db = new ArrayList<MemberDTO>();
	}
	
	public MemberDTO isExist(String id) {
		for(MemberDTO m : db) {
			if(m.getId().equals(id)) {
				return m;
			}
		}
		return null;
	}
	public void register(MemberDTO member) {
		db.add(member);
	}
	/*
	 * header.jsp 에서 페이지 매핑 
	 * register 기능 구현 (Controller -> Service -> Repository)
	 * Login 기능 구현 (Controller -> Service -> Repository)
	 */

	public ArrayList<MemberDTO> memberInfo() {
		return db;
	}

	public void update(MemberDTO member) {
		MemberDTO tmp = isExist(member.getId());
		int index = db.indexOf(tmp);
		db.set(index, member);
	}

	public void delete(MemberDTO result) {
		db.remove(result);
	}
}
