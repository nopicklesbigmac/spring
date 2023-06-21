package com.db.basic.dto;
/*
  create table db_basic_post(
    id varchar2(20),
    zonecode varchar2(6),
    addr1 varchar2(110),
    addr2 varchar2(110),
    constraint fk_post foreign key (id) references db_basic(id) on delete cascade
    );
 */
public class PostDTO {
	
	private String id;
	private String zonecode;
	private String addr1;
	private String addr2;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getZonecode() {
		return zonecode;
	}
	public void setZonecode(String zonecode) {
		this.zonecode = zonecode;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
}
