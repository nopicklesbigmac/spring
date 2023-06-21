package com.care.quiz.membership.dto;


public class MemberDTO extends LoginDTO{
	/*
	SQL> CREATE TABLE member(
	 2 id varchar2(20),
	 3 gender varchar2(2),
	 4 email varchar2(40),
	 5 CONSTRAINT pk_member FOREIGN KEY (id) REFERENCES login(id) ON DELETE CASCADE
	 6 );
	Table created.
	SQL> commit;
	Commit complete.
	*/
	private String gender;
	private String email;
	
	public String getGender() {
	return gender;
	}
	public void setGender(String gender) {
	this.gender = gender;
	}
	public String getEmail() {
	return email;
	}
	public void setEmail(String email) {
	this.email = email;
	}
}
