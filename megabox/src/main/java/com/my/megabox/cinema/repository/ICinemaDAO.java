package com.my.megabox.cinema.repository;

import java.util.ArrayList;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.my.megabox.cinema.dto.CinemaDTO;
import com.my.megabox.cinema.dto.FacilityDTO;
import com.my.megabox.cinema.dto.FloorDTO;
import com.my.megabox.common.dto.AllDTO;

@Repository
public interface ICinemaDAO {
	
	List<CinemaDTO> selectstate(String c_state);

	CinemaDTO selectbrchNo(int brchNo);
	
	List<FacilityDTO> facility(int brchNo);
	 
	List<FloorDTO> floor(int brchNo);
	
	List<CinemaDTO> selectall();
	
	public CinemaDTO showCinema(String cName);

	public ArrayList<FloorDTO> showFloor(String cName);

	public ArrayList<FacilityDTO> showFacility(String cName);
	
	ArrayList<AllDTO> sendAllByCinema(HashMap<String, String> paramMap);
	
}
