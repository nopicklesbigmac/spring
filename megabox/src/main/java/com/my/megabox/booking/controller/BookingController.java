package com.my.megabox.booking.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.my.megabox.booking.dto.AllDTO;
import com.my.megabox.booking.service.BookingService;
import com.my.megabox.common.dto.DateDTO;
import com.my.megabox.common.dto.MovieDTO;
import com.my.megabox.common.service.CommonService;

@Controller
public class BookingController {

	@Autowired BookingService bookingService;

	@Autowired
	private HttpServletRequest request;
	
	@Autowired
	private BookingService service;
	
	@Autowired 
	private CommonService cService;
	
	@GetMapping("booking/completeSeat")
	public String payBooking(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		AllDTO allDto = (AllDTO) session.getAttribute("bookingInfo");
		model.addAttribute("allDto", allDto);
		if(allDto==null) {
			return "main";
		}else {
			return "booking/completeSeat";
		}
	}
	
	
	@PostMapping("booking/saveBookingData")
	@ResponseBody
	public Map<String,String> saveBookingData( HttpServletRequest request,@RequestParam Map<String, Object> map) {
		Map<String,String> map_response = new HashMap<String,String>();
		HttpSession session = request.getSession();
		AllDTO allDto = (AllDTO) session.getAttribute("bookingInfo");
		System.out.println("merchant_uid : " + map.get("merchant_uid"));
		String insert = bookingService.insertBookingInfo(session, allDto);
		return map_response;
	}
	
	@GetMapping("booking/practice")
	public void getaa(HttpServletRequest request) {
		HttpSession session = request.getSession();
		AllDTO dto = new AllDTO();
		dto.setC_name("고양스타필드");
		dto.setS_seat("A2 A6 B4 B9");
		dto.setR_num(125);
		dto.setS_name("9관");
		dto.setR_date("2022.08.30");
		dto.setR_start("11:45");
		dto.setR_end("14:00");
		dto.setM_name("헌트");
		dto.setM_age("movie-grade small age-15");
		dto.setAdult_cnt(2);
		dto.setTeenager_cnt(1);
		dto.setOldMan_cnt(0);
		dto.setTotal_seat_cnt(4);
		dto.setTotal_fee(45000);
		session.setAttribute("bookingInfo", dto);
	}
	
	@GetMapping("timetable")
	public String timetable(Model model) {
		ServletContext application = request.getServletContext();
		ArrayList<MovieDTO> mList = (ArrayList) application.getAttribute("mList");

		if (mList == null || mList.isEmpty())
			cService.showAllMovie();

		HashMap<String, ArrayList> sList = (HashMap) application.getAttribute("sList");
		if (sList == null || sList.isEmpty())
			cService.showCinemaByState();

		ArrayList<DateDTO> dList = (ArrayList) application.getAttribute("dList");
		if (dList == null || dList.isEmpty())
			cService.showDatesFromToday();

		return "booking/timetable";
	}
	
	@PostMapping(value = "sendCinemaAndDay", produces="html/text; charset=UTF-8")
	@ResponseBody
	public String sendCinemaAndDay(@RequestBody(required = false) HashMap<String, String> map) throws Exception {
		String cName = map.get("cName");
		String day = map.get("day");
		System.out.println("sendCinemaAndDay > " + cName + ": " + day);
		
		ArrayList<HashMap> result = service.sendAllByCinema(cName, day);
		if(result == null)
			return "필터 조건에 맞는 검색결과가 없습니다.";
		String msg = service.makeCinemaAndDateResultCode(result);
		return msg;
	}
	
	@PostMapping(value = "sendMovieAndState", produces="html/text; charset=UTF-8")
	@ResponseBody
	public String sendMovieAndState(@RequestBody(required = false) HashMap<String, String> map) throws Exception {
		String mName = map.get("mName");
		String day = map.get("day");
		String sName = map.get("sName");
		System.out.println("sendMovieAndState > " + mName + ": " + day + ": " + sName);
		
		ArrayList<HashMap> result = service.sendAllByMovieAndState(mName, day, sName);
		if(result == null)
			return "필터 조건에 맞는 검색결과가 없습니다.";
		String code = service.makeResultCode(result);
		return code;
	}
	
	@GetMapping("ticketing")
	public String ticketing(HttpSession session, RedirectAttributes ra, Model model, String num) {
		String loginId = (String)session.getAttribute("loginId");
		if(loginId == null || loginId == "") {
			ra.addFlashAttribute("errMsg", "로그인 후 이용해주세요");
			return "redirect:main";
		}
		
		HashMap<String, Object> result = service.sendTicketingInfo(num);
		if(result == null || result.isEmpty())
			return "booking/ticketing";
		
		model.addAttribute("rNum", num);
		model.addAttribute("condition", result.get("condition"));
		model.addAttribute("bookedSeat", result.get("bookedSeat"));
		model.addAttribute("result", result.get("ticketingInfo"));
		return "booking/ticketing";
	}
	
	@PostMapping(value = "sendBookingInfo", produces="html/text; charset=UTF-8")
	@ResponseBody
	public String sendBookingInfo(HttpSession session, @RequestBody(required = false) HashMap<String, String> map) throws Exception {
		System.out.println("sendBookingInfo 요청됨!");
		AllDTO dto = service.sendBookingInfo(map);
		if(dto == null)
			return "실패";
		
		session.setAttribute("bookingInfo", dto);
		return "성공";
	}
}
