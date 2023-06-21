package com.my.megabox.booking.repository;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Repository;

import com.my.megabox.booking.dto.AllDTO;
import com.my.megabox.booking.dto.BookingDTO;

@Repository
public interface IBookingDAO {

	int insertBookingInfo(HashMap<String, Object> paramMap);

	int updateAbleSeatNum(HashMap<String, Object> paramMap);

	ArrayList<AllDTO> sendAll();

	ArrayList<AllDTO> sendAllByCinema(HashMap<String, String> paramMap);

	ArrayList<AllDTO> sendAllByMovieAndState(HashMap<String, Object> paramMap);

	int selectMovieNumByName(String mName);

	AllDTO selectCondition(int rNum);

	ArrayList<AllDTO> sendTicketingInfo(HashMap<String, String> paramMap);

	ArrayList<BookingDTO> selectBookedSeat(int rNum);

}
