package com.my.megabox.movie.dto;
/*
p_num 포스팅 번호 number  primary  key
u_num 회원 번호  number foreign key
p_time 포스팅 작성 날짜  varchar2(10)
p_image 포스팅 사진  varchar2(300)
p_content 포스팅 내용  varchar2(150)
p_like 포스팅 좋아요 개수 number

 */
public class LikeDTO {
	private int l_num; 
	private String l_time;
	private int u_num;
	private String m_name;
	private String m_age;
	private String m_poster;
	private int m_like;
	private String m_date;
	private String m_director;
	private String m_type;
	private int m_r_time;
	
	public int getL_num() {
		return l_num;
	}
	public void setL_num(int l_num) {
		this.l_num = l_num;
	}
	public String getL_time() {
		return l_time;
	}
	public void setL_time(String l_time) {
		this.l_time = l_time;
	}
	public int getU_num() {
		return u_num;
	}
	public void setU_num(int u_num) {
		this.u_num = u_num;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_age() {
		return m_age;
	}
	public void setM_age(String m_age) {
		this.m_age = m_age;
	}
	public String getM_poster() {
		return m_poster;
	}
	public void setM_poster(String m_poster) {
		this.m_poster = m_poster;
	}
	public int getM_like() {
		return m_like;
	}
	public void setM_like(int m_like) {
		this.m_like = m_like;
	}
	public String getM_date() {
		return m_date;
	}
	public void setM_date(String m_date) {
		this.m_date = m_date;
	}
	
	public String getM_director() {
		return m_director;
	}
	public void setM_director(String m_director) {
		this.m_director = m_director;
	}
	
	public String getM_type() {
		return m_type;
	}
	public void setM_type(String m_type) {
		this.m_type = m_type;
	}
	public int getM_r_time() {
		return m_r_time;
	}
	public void setM_r_time(int m_r_time) {
		this.m_r_time = m_r_time;
	}
	public void Like(int l_num,String l_time, int u_num ) {
		this.l_num = l_num;
		this.l_time = l_time;
		this.u_num = u_num;
	}
	
}
