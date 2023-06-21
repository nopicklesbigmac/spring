package com.my.megabox.movie.dto;

public class ReplyDTO {
	/*
	 CREATE TABLE reply(
d_num number primary key,
d_content varchar2(300) NOT NULL,
d_time varchar2(20) NOT NULL,
u_num number NOT NULL,
p_num number NOT NULL,
u_id 회원 varchar2(30)  NOT NULL,
CONSTRAINT r_fk_u FOREIGN KEY(u_num) REFERENCES USER_INFO(u_num) ON DELETE SET NULL,
CONSTRAINT r_fk_p FOREIGN KEY(p_num) REFERENCES POSTING(p_num) ON DELETE SET NULL
);

	  */
	private int p_num;
	private int u_num;
	private String u_id;
	private int d_num;
	private String d_content;
	private String d_time;
	public int getD_num() {
		return d_num;
	}
	public void setD_num(int d_num) {
		this.d_num = d_num;
	}
	public String getD_content() {
		return d_content;
	}
	public void setD_content(String d_content) {
		this.d_content = d_content;
	}
	public String getD_time() {
		return d_time;
	}
	public void setD_time(String d_time) {
		this.d_time = d_time;
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
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

}
