package com.care.member.dao;

import java.util.ArrayList;

import com.care.member.dto.MemberDTO;

public class MemberDAO {
	private ArrayList<MemberDTO> list;
	
	public MemberDAO() {
		list = new ArrayList<MemberDTO>();
	}
	
	public ArrayList<MemberDTO> list() {
		return list;
	}
	
	public int register(MemberDTO member) {
		boolean tmp = list.add(member);
		if(tmp == true)
			return 1;
		return 0;
	}
	
}
