package com.my.megabox.common.service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.megabox.common.dto.DateDTO;
import com.my.megabox.common.dto.MovieDTO;
import com.my.megabox.common.repository.ICommonDAO;

@Service
public class CommonService implements ICommonService {
	
	@Autowired
	private HttpServletRequest request;
	
	@Autowired
	private ICommonDAO dao;
	
	private ServletContext application;
	
	private String[] sList = {"����", "���", "��õ", "����,��û,����", "�λ�,�뱸,���", "����,����", "����"};
	
	@Override
	public void showAllMovie() {
		ArrayList<MovieDTO> mList = dao.showAllMovie();
		if(mList != null) {
			application = request.getServletContext();
			application.setAttribute("mList", mList);
		}
	}

	@Override
	public void showCinemaByState() {
		System.out.println("������ �´� ���� �������� �Լ� �����");
		HashMap<String, ArrayList> result = new HashMap();
		
		for(String state : sList) {
			String[] splitState = state.split(",");
			if(splitState.length >= 2) {
				ArrayList<String> tmp = new ArrayList();
				for(int i = 0; i < splitState.length; i++) 
					tmp.addAll(dao.showCinemaByState(splitState[i]));
				result.put(splitState[0], tmp);
			}
			result.put(state, dao.showCinemaByState(state));
		}
		if(result != null) {
			application = request.getServletContext();
			application.setAttribute("sList", result);
		}
	}

	@Override
	public void showDatesFromToday() {
		ArrayList<DateDTO> dList = new ArrayList<>();
		LocalDate day = LocalDate.now().minusDays(1);
		
		for (int i = 0; i < 14; i++) {
			LocalDate now = day.plusDays(i);
			int year = now.getYear();
			String month = now.getMonthValue() + "";
			String date = now.getDayOfMonth() + "";
			String dayOfWeek = now.getDayOfWeek().toString();
			
			switch (dayOfWeek) {
				case "MONDAY":
					dayOfWeek = "��"; break;
				case "TUESDAY":
					dayOfWeek = "ȭ"; break;
				case "WEDNESDAY":
					dayOfWeek = "��"; break;
				case "THURSDAY":
					dayOfWeek = "��"; break;
				case "FRIDAY":
					dayOfWeek = "��"; break;
				case "SATURDAY":
					dayOfWeek = "��"; break;
				case "SUNDAY":
					dayOfWeek = "��"; 
			}
			
			DateDTO tmp = new DateDTO(year, month, date, dayOfWeek);
			if(now.isEqual(LocalDate.now()))
				tmp.setDayOfWeek("����");
			else if(now.isEqual(LocalDate.now().plusDays(1)))
				tmp.setDayOfWeek("����");
			
			if(month.length() == 1) 
				tmp.setMonth("0" + month);
			if(date.length() == 1)
				tmp.setDate("0" + date);
			
			System.out.println(tmp.getYear() + ":" + tmp.getMonth() + tmp.getDate() + ":" + tmp.getDayOfWeek());
			dList.add(tmp);
		}
		application = request.getServletContext();
		application.setAttribute("dList", dList);
	}

}
