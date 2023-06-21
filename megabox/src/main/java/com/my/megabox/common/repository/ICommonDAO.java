package com.my.megabox.common.repository;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import com.my.megabox.common.dto.MovieDTO;

@Repository
public interface ICommonDAO {
	
	ArrayList<MovieDTO> showAllMovie(); 
	
	ArrayList<String> showCinemaByState(String sName);

}
