package com.my.megabox.movie.dto;

public class CommentDTO {
	
	/*
	 CREATE TABLE OPINION(
 o_num number primary key,
 o_avg number not null,
 o_content varchar2(300) not null,
 o_point varchar2(50) not null,
 u_num number not null,
 CONSTRAINT o_fk_u FOREIGN KEY(u_num) REFERENCES USER_INFO(u_num) ON DELETE SET NULL
);

	 	*/
	// 평점 관격수 문자열 
	private int o_num;
	private int o_avg;
	private String o_content;
	private String o_point;
	public int getO_num() {
		return o_num;
	}
	public void setO_num(int o_num) {
		this.o_num = o_num;
	}
	public int getO_avg() {
		return o_avg;
	}
	public void setO_avg(int o_avg) {
		this.o_avg = o_avg;
	}
	public String getO_content() {
		return o_content;
	}
	public void setO_content(String o_content) {
		this.o_content = o_content;
	}
	public String getO_point() {
		return o_point;
	}
	public void setO_point(String o_point) {
		this.o_point = o_point;
	}
	public int getU_num() {
		return u_num;
	}
	public void setU_num(int u_num) {
		this.u_num = u_num;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	private int u_num;
	private String u_id;
	





}
