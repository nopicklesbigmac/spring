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
	
	private String[] sList = {"서울", "경기", "인천", "대전,충청,세종", "부산,대구,경상", "광주,전라", "강원"};
	
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
		System.out.println("지역에 맞는 극장 가져오는 함수 실행됨");
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
					dayOfWeek = "월"; break;
				case "TUESDAY":
					dayOfWeek = "화"; break;
				case "WEDNESDAY":
					dayOfWeek = "수"; break;
				case "THURSDAY":
					dayOfWeek = "목"; break;
				case "FRIDAY":
					dayOfWeek = "금"; break;
				case "SATURDAY":
					dayOfWeek = "토"; break;
				case "SUNDAY":
					dayOfWeek = "일"; 
			}
			
			DateDTO tmp = new DateDTO(year, month, date, dayOfWeek);
			if(now.isEqual(LocalDate.now()))
				tmp.setDayOfWeek("오늘");
			else if(now.isEqual(LocalDate.now().plusDays(1)))
				tmp.setDayOfWeek("내일");
			
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
