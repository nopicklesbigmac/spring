package com.my.megabox.booking.repository;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.my.megabox.booking.dto.MemberDTO;

@Repository
public interface IMemberDAO {
	
	int selectId(@Param("id") String id); 
	int register(MemberDTO dto);
	MemberDTO login(@Param("id") String id);
}
