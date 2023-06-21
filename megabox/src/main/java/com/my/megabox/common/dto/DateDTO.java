package com.my.megabox.common.dto;

public class DateDTO {
	private Integer year;
	private String month;
	private String date;
	private String dayOfWeek;

	public DateDTO(Integer year, String month, String date, String dayOfWeek) {
		this.year = year;
		this.month = month;
		this.date = date;
		this.dayOfWeek = dayOfWeek;
	}

	public Integer getYear() {
		return year;
	}

	public void setYear(Integer year) {
		this.year = year;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getDayOfWeek() {
		return dayOfWeek;
	}

	public void setDayOfWeek(String dayOfWeek) {
		this.dayOfWeek = dayOfWeek;
	}

}
