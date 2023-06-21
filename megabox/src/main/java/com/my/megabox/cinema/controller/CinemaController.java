package com.my.megabox.cinema.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.my.megabox.cinema.service.CinemaService;
import com.my.megabox.common.dto.DateDTO;
import com.my.megabox.common.service.CommonService;
import com.my.megabox.cinema.dto.CinemaDTO;
import com.my.megabox.cinema.dto.FacilityDTO;
import com.my.megabox.cinema.dto.FloorDTO;
import com.my.megabox.cinema.repository.ICinemaDAO;

@Controller 
public class CinemaController {
	@Autowired private ICinemaDAO cinemaDao;
	
	@Autowired
	private HttpServletRequest request;
	 
	@Autowired
	private CinemaService service;
	
	@Autowired
	private CommonService cService;
	
	@GetMapping("showCinema")
	public String showCinema(Model model, String cName) {
		ServletContext application = request.getServletContext();
		HashMap<String, ArrayList> sList = (HashMap)application.getAttribute("sList");
		if(sList == null || sList.isEmpty())
			cService.showCinemaByState();
		
		ArrayList<DateDTO> dList = (ArrayList)application.getAttribute("dList");
		if(dList == null || dList.isEmpty())
			cService.showDatesFromToday();
		
		HashMap<String, Object> info = service.showCinema(cName);
		if(info == null || info.isEmpty()) 
			return "cinema/showCinema";
		
		model.addAttribute("cinema", info.get("cinema"));
		model.addAttribute("floor", info.get("floor"));
		model.addAttribute("facility", info.get("facility"));
		return "cinema/showCinema";
	} 
	
	@PostMapping(value = "sendCinemaAndDate", produces="html/text; charset=UTF-8")
	@ResponseBody
	public String sendCinemaAndDay(@RequestBody(required = false) HashMap<String, String> map) throws Exception {
		String cName = map.get("cName");
		String day = map.get("day");
		System.out.println("sendCinemaAndDate > " + cName + ": " + day);
		
		ArrayList<HashMap> result = service.sendAllByCinema(cName, day);
		if(result == null)
			return "필터 조건에 맞는 검색결과가 없습니다.";
		String msg = service.makeCinemaAndDateResultCode(result);
		return msg;
	}
	
	@GetMapping("showCinemaTimetable")
	public String showCinemaTimetable(Model model, String cName) {
		ServletContext application = request.getServletContext();
		HashMap<String, ArrayList> sList = (HashMap)application.getAttribute("sList");
		if(sList == null || sList.isEmpty())
			cService.showCinemaByState();
		
		ArrayList<DateDTO> dList = (ArrayList)application.getAttribute("dList");
		if(dList == null || dList.isEmpty())
			cService.showDatesFromToday();
		
		if(cName == null || cName == "")
			cName = "강남";
		model.addAttribute("cName", cName);
		return "cinema/showCinemaTimetable";
	} 

	@RequestMapping(value = "/list")
	public String list(Model model) {
		List<CinemaDTO> list = cinemaDao.selectall();
		model.addAttribute("list",list);
		return "theater/list";
	}
	
	@RequestMapping(value = "/showCinema") 
	public String theater(int cName,Model model) {
		List<CinemaDTO> list = cinemaDao.selectall();
		model.addAttribute("list",list);
		
		CinemaDTO cinema = cinemaDao.selectbrchNo(cName);
		model.addAttribute("cinema",cinema);
		
		List<FacilityDTO> facility = cinemaDao.facility(cName);
		model.addAttribute("facility",facility);
		
		List<FloorDTO> floor = cinemaDao.floor(cName);
		model.addAttribute("floor",floor);
		
		return "theater/theater";	
	}
}
