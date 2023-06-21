package com.my.megabox.movie.dto;

public class ScreenDTO {
	/*
	 * CREATE TABLE SCREEN( 
	 * s_num number primary key, 
	 * s_name varchar2(60) not null,
	 * s_seat number not null, 
	 * s_status number default 1 not null, 
	 * c_num number not null );
	 * 
	 */
	private int s_num;
	private String s_name;
	private int s_seat;
	private int s_status;
	private int c_num;
	
	public int getS_num() {
		return s_num;
	}
	public void setS_num(int s_num) {
		this.s_num = s_num;
	}
	public String getS_name() {
		return s_name;
	}
	public void setS_name(String s_name) {
		this.s_name = s_name;
	}
	public int getS_seat() {
		return s_seat;
	}
	public void setS_seat(int s_seat) {
		this.s_seat = s_seat;
	}
	public int getS_status() {
		return s_status;
	}
	public void setS_status(int s_status) {
		this.s_status = s_status;
	}
	public int getC_num() {
		return c_num;
	}
	public void setC_num(int c_num) {
		this.c_num = c_num;
	}
	
	
}
