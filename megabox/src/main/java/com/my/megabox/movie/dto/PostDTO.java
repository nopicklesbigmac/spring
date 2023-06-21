package com.my.megabox.movie.dto;
/*
p_num 포스팅 번호 number  primary  key
u_num 회원 번호  number foreign key
p_time 포스팅 작성 날짜  varchar2(10)
p_image 포스팅 사진  varchar2(300)
p_content 포스팅 내용  varchar2(150)
p_like 포스팅 좋아요 개수 number

 */
public class PostDTO {
	private int m_num; 
	private String m_name;
	private int p_num;
	private int u_num;
	private String p_time;
	private String p_image;
	private String p_content;
	private int p_like;
	private String u_id;

	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public int getM_num() {
		return m_num;
	}
	public void setM_num(int m_num) {
		this.m_num = m_num;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	

	public int getP_num() {
		return p_num;
	}
	public void setP_num(int p_num) {
		this.p_num = p_num;
	}
	public int getU_num() {
		return u_num;
	}
	public void setU_num(int u_num) {
		this.u_num = u_num;
	}
	public String getP_time() {
		return p_time;
	}
	public void setP_time(String p_time) {
		this.p_time = p_time;
	}
	public String getP_image() {
		return p_image;
	}
	public void setP_image(String p_image) {
		this.p_image = p_image;
	}
	public String getP_content() {
		return p_content;
	}
	public void setP_content(String p_content) {
		this.p_content = p_content;
	}
	public int getP_like() {
		return p_like;
	}
	public void setP_like(int p_like) {
		this.p_like = p_like;
	}
}
