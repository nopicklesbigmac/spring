package com.my.megabox.booking.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.megabox.booking.dto.MemberDTO;
import com.my.megabox.booking.repository.IMemberDAO;

@Service
public class LoginService {

	@Autowired private IMemberDAO dao;
	
	public MemberDTO login(String id) {
		
		return dao.login(id);
	}
}
