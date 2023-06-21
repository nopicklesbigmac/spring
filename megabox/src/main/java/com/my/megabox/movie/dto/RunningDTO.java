package com.my.megabox.movie.dto;

public class RunningDTO {
	/*
	 CREATE TABLE RUNNING (
 r_num number primary key,
 r_able number not null,
 r_start varchar2(5) not null,
 r_end varchar2(5) not null,
 c_num number not null,
 s_num number not null,
 m_num number not null,
 r_date varchar2(10) 
	 	*/
	private int r_num;
	private int r_able;// 잔여좌석 
	private String r_start;
	private String r_end;
	private int c_num;
	private int s_num;
	private int m_num;
	private String r_date;
	
	public int getR_num() {
		return r_num;
	}
	public void setR_num(int r_num) {
		this.r_num = r_num;
	}
	public int getR_able() {
		return r_able;
	}
	public void setR_able(int r_able) {
		this.r_able = r_able;
	}
	public String getR_start() {
		return r_start;
	}
	public void setR_start(String r_start) {
		this.r_start = r_start;
	}
	public String getR_end() {
		return r_end;
	}
	public void setR_end(String r_end) {
		this.r_end = r_end;
	}
	public int getC_num() {
		return c_num;
	}
	public void setC_num(int c_num) {
		this.c_num = c_num;
	}
	public int getS_num() {
		return s_num;
	}
	public void setS_num(int s_num) {
		this.s_num = s_num;
	}
	public int getM_num() {
		return m_num;
	}
	public void setM_num(int m_num) {
		this.m_num = m_num;
	}
	public String getR_date() {
		return r_date;
	}
	public void setR_date(String r_date) {
		this.r_date = r_date;
	}

	
	
}
