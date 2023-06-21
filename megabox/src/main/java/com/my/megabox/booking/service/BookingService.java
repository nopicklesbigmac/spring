package com.my.megabox.booking.service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.megabox.booking.dto.AllDTO;
import com.my.megabox.booking.dto.BookingDTO;
import com.my.megabox.booking.repository.IBookingDAO;

@Service
public class BookingService {

	@Autowired IBookingDAO dao;
	
	public String insertBookingInfo(HttpSession session, AllDTO allDto) {
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("rStart",allDto.getR_start() );
		paramMap.put("rEnd", allDto.getR_end());
		paramMap.put("cNum", allDto.getC_num());
		paramMap.put("sNum", allDto.getS_num());
		paramMap.put("mNum", allDto.getM_num());
		paramMap.put("rNum", allDto.getR_num());
		paramMap.put("seats", allDto.getS_seat().trim());		
		paramMap.put("fee", allDto.getTotal_fee());
		paramMap.put("seatCnt", allDto.getTotal_seat_cnt());
		int num = (int)session.getAttribute("loginNum");
		paramMap.put("uNum", num);		
		int insert = dao.insertBookingInfo(paramMap);
		int chk = dao.updateAbleSeatNum(paramMap);
		
		System.out.println("insert : " + insert);
		System.out.println("change : " + chk);
		if(chk != 1)
			return "InsertFail";
		
		return "InsertSuccess";
	}
	
	public ArrayList<HashMap> sendAllByCinema(String cName, String day) {
		HashMap<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("cName", cName);
		paramMap.put("day", day);
		
		ArrayList<AllDTO> allList = dao.sendAllByCinema(paramMap);
		if(allList == null || allList.isEmpty())
			return null;
		return makeCinemaResult(allList); 
	}
	
	public ArrayList<HashMap> sendAllByMovieAndState(String mName, String day, String sName) {
		Integer mNum = -1;
		if(mName == null || mName == "")
			mNum = 1;
		mNum = dao.selectMovieNumByName(mName);
		if(mNum == -1)
			return null;
		
		if(day == null)
			day = LocalDate.now().toString().replace("/", ".");
		
		if(sName == null)
			sName = "서울";
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("mNum", mNum);
		paramMap.put("day", day);
		paramMap.put("sName", sName);
		
		ArrayList<AllDTO> allList = dao.sendAllByMovieAndState(paramMap);
		if(allList == null || allList.isEmpty())
			return null;
		return makeResult(allList); 
	}
	
	public HashMap<String, Object> sendTicketingInfo(String num) {
		if(num == null || num == "")
			return null;
		
		int rNum = -1;
		try {
			rNum = Integer.parseInt(num);
		}catch(Exception e) {
			return null;
		}
		
		AllDTO condition = dao.selectCondition(rNum);
		if(condition == null)
			return null;
		
		HashMap<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("cName", condition.getC_name());
		paramMap.put("sName", condition.getS_name());
		paramMap.put("mName", condition.getM_name());
		paramMap.put("day", condition.getR_date());
		
		String seatList = "";
		ArrayList<BookingDTO> tmp = dao.selectBookedSeat(rNum);
		for(BookingDTO b : tmp)
			seatList += b.getB_seat() + " ";
		
		ArrayList<AllDTO> ticketingInfo = dao.sendTicketingInfo(paramMap);
		for(AllDTO a : ticketingInfo)
			System.out.println(a.toString());
		
		if(ticketingInfo == null)
			return null;
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		System.out.println("사진: " + condition.getM_poster());
		result.put("condition", condition);
		result.put("bookedSeat", seatList);
		result.put("ticketingInfo", ticketingInfo);
		
		return result;
	}
	
	public String insertBookingInfo(HttpSession session, HashMap<String, String> map) {
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("rNum", map.get("rNum"));
		paramMap.put("seats", map.get("seats").trim());
		
		int tmpFee = 0;
		try {
			tmpFee = Integer.parseInt(map.get("fee"));
		}catch(Exception e) {
			
		}
		paramMap.put("fee", tmpFee);
		
		int tmpSCnt = 0;
		try {
			tmpFee = Integer.parseInt(map.get("seatCnt"));
		}catch(Exception e) {
			
		}
		paramMap.put("seatCnt", tmpFee);
		
		String num = (String)session.getAttribute("num");
		int uNum = 0;
		try {
			uNum = Integer.parseInt(num);
		}catch(Exception e) {
			
		}
		paramMap.put("uNum", uNum);		
		
		dao.insertBookingInfo(paramMap);
		int chk = dao.updateAbleSeatNum(paramMap);
		if(chk != 1)
			return "예매에 실패했습니다";
		
		return "예매되었습니다";
	}
	
	public AllDTO sendBookingInfo(HashMap<String, String> map) {
		if(map == null || map.isEmpty())
			return null;
		
		String c_name = map.get("cName");
		String s_name = map.get("sName");
		String m_name = map.get("mName");
		String tmp = map.get("mAge");
		String r_date = map.get("rDate");
		String r_start = map.get("rStart");
		String r_end = map.get("rEnd");
		
		String adultCnt = map.get("adultCnt");
		String teenCnt = map.get("teenCnt");
		String oldCnt = map.get("oldCnt");
		String totalFee = map.get("totalFee");
		
		String rNumTmp = map.get("rNum");
		String s_seat = map.get("seats").trim();
		
		int r_num = 0;
		int adult_cnt = 0;
		int teenager_cnt = 0;
		int oldMan_cnt = 0;
		int total_fee = 0;
		
		try {
			r_num = Integer.parseInt(rNumTmp);
			adult_cnt = Integer.parseInt(adultCnt);
			teenager_cnt = Integer.parseInt(teenCnt);
			oldMan_cnt = Integer.parseInt(oldCnt);
			total_fee = Integer.parseInt(totalFee);
		}catch(Exception e) {
			
		}
		
		String m_age = "movie-grade small age-" + tmp.substring(0, 2);
		
		AllDTO dto = new AllDTO();
		dto.setC_name(c_name);
		dto.setS_name(s_name);
		dto.setM_name(m_name);
		dto.setM_age(m_age);
		dto.setR_num(r_num);
		dto.setR_date(r_date);
		dto.setR_start(r_start);
		dto.setR_end(r_end);
		dto.setAdult_cnt(adult_cnt);
		dto.setTeenager_cnt(teenager_cnt);
		dto.setOldMan_cnt(oldMan_cnt);
		dto.setTotal_seat_cnt(adult_cnt + teenager_cnt + oldMan_cnt);
		dto.setTotal_fee(total_fee);
		dto.setS_seat(s_seat);
		System.out.println(dto.toString());
		return dto;
	}
	
	private static LinkedHashMap<String, ArrayList> sortMapByKey(Map<String, ArrayList> map) {
	    List<Map.Entry<String, ArrayList>> entries = new LinkedList<>(map.entrySet());
	    Collections.sort(entries, (o1, o2) -> o1.getKey().compareTo(o2.getKey()));

	    LinkedHashMap<String, ArrayList> result = new LinkedHashMap<>();
	    for (Map.Entry<String, ArrayList> entry : entries) {
	        result.put(entry.getKey(), entry.getValue());
	    }
	    return result;
	}
	
	private ArrayList<HashMap> makeCinemaResult(ArrayList<AllDTO> allList){
		ArrayList<AllDTO> dtos = new ArrayList<AllDTO>();
		HashMap<String, ArrayList> matchScreen = new HashMap<String, ArrayList>();
		ArrayList<HashMap> screenMap = new ArrayList<HashMap>();

		HashMap<String, ArrayList> eachMovie = new HashMap<String, ArrayList>();
		ArrayList<HashMap> result = null;

		if (!allList.isEmpty()) {
			result = new ArrayList<HashMap>();
			for (int i = 0; i < allList.size(); i++) {
				AllDTO tmp = allList.get(i);
				System.out.println(tmp.toString());
				if (!eachMovie.containsKey(tmp.getM_name()))
					eachMovie.put(tmp.getM_name(), null);
			}
			System.out.println("eachMovie's size:" + eachMovie + "\n");

			for (String m : eachMovie.keySet()) {
				// 새롭게 할당 받기
				matchScreen = new HashMap<String, ArrayList>();
				screenMap = new ArrayList<HashMap>();

				for (int i = 0; i < allList.size(); i++) {
					AllDTO tmp = allList.get(i);
					if (tmp.getM_name().equals(m)) { 
						if (!matchScreen.containsKey(tmp.getS_name()))
							matchScreen.put(tmp.getS_name(), null);
					}
				}
				HashMap<String, ArrayList> tmp = new HashMap<String, ArrayList>();
				tmp = sortMapByKey(matchScreen); //키 오름차순 정렬
				System.out.println("matchScreen:" + tmp);

				screenMap.add(tmp);
				eachMovie.put(m, screenMap);
			}
			System.out.println("eachCinema:" + eachMovie);

			for(String m : eachMovie.keySet()) {
				System.out.println(m + "차례");
				screenMap = eachMovie.get(m);
				System.out.println(m + "의 screenMap: " + screenMap);
				
				for(int i = 0; i < screenMap.size(); i++) {
					matchScreen = screenMap.get(i);
					for(String s : matchScreen.keySet()) {
						ArrayList<AllDTO> tmpList = new ArrayList<AllDTO>();
						dtos = matchScreen.get(s);
						for(int j = 0; j < allList.size(); j++) {
							AllDTO tmp = allList.get(j);
							if(tmp.getM_name().equals(m) && tmp.getS_name().equals(s)) {
								tmpList.add(tmp);
							}
						}
						dtos = tmpList;
						matchScreen.put(s, dtos);
						System.out.println(s + "의 dtos: " + dtos);
					}
				}
			}
			result.add(eachMovie);
			System.out.println("결과: " + result + "\n");
		}
		return result;
	}

	
	private ArrayList<HashMap> makeResult(ArrayList<AllDTO> allList){
		ArrayList<AllDTO> dtos = new ArrayList<AllDTO>();
		HashMap<String, ArrayList> matchScreen = new HashMap<String, ArrayList>();
		ArrayList<HashMap> screenMap = new ArrayList<HashMap>();

		HashMap<String, ArrayList> eachCinema = new HashMap<String, ArrayList>();
		ArrayList<HashMap> result = null;

		if (!allList.isEmpty()) {
			result = new ArrayList<HashMap>();
			for (int i = 0; i < allList.size(); i++) {
				AllDTO tmp = allList.get(i);
				System.out.println(tmp.toString());
				if (!eachCinema.containsKey(tmp.getC_name()))
					eachCinema.put(tmp.getC_name(), null);
			}
			System.out.println("eachCinema's size:" + eachCinema + "\n");

			for (String c : eachCinema.keySet()) {
				// 새롭게 할당 받기
				matchScreen = new HashMap<String, ArrayList>();
				screenMap = new ArrayList<HashMap>();

				for (int i = 0; i < allList.size(); i++) {
					AllDTO tmp = allList.get(i);
					if (tmp.getC_name().equals(c)) { // 강남
						if (!matchScreen.containsKey(tmp.getS_name())) // 강남의 상영관 개수 파악
							matchScreen.put(tmp.getS_name(), null);
					}
				}
				HashMap<String, ArrayList> tmp = new HashMap<String, ArrayList>();
				tmp = sortMapByKey(matchScreen); //키 오름차순 정렬
				System.out.println("matchScreen:" + tmp);

				screenMap.add(tmp);
				eachCinema.put(c, screenMap);
			}
			System.out.println("eachCinema:" + eachCinema);

			for(String c : eachCinema.keySet()) {
				System.out.println(c + "차례");
				screenMap = eachCinema.get(c);
				System.out.println(c + "의 screenMap: " + screenMap);
				
				for(int i = 0; i < screenMap.size(); i++) {
					matchScreen = screenMap.get(i);
					for(String s : matchScreen.keySet()) {
						ArrayList<AllDTO> tmpList = new ArrayList<AllDTO>();
						dtos = matchScreen.get(s);
						for(int j = 0; j < allList.size(); j++) {
							AllDTO tmp = allList.get(j);
							if(tmp.getC_name().equals(c) && tmp.getS_name().equals(s)) {
								tmpList.add(tmp);
							}
						}
						dtos = tmpList;
						matchScreen.put(s, dtos);
						System.out.println(s + "의 dtos: " + dtos);
					}
				}
			}
			result.add(eachCinema);
			System.out.println("결과: " + result + "\n");
		}
		return result;
	}

	public String makeResultCode(ArrayList<HashMap> tmp) {
		
		String result = "";
		
		ArrayList<HashMap> screenMap = new ArrayList<HashMap>();
		HashMap<String, ArrayList> matchScreen = new HashMap<String, ArrayList>();
		ArrayList<AllDTO> dtos = new ArrayList<AllDTO>();
		
		HashMap<String, ArrayList> eachCinema =  tmp.get(0);
		for(String c : eachCinema.keySet()) {
			screenMap = eachCinema.get(c);
			result += "<div class=\'theater-list\'><div class=\'theater-area-click\'><a href=\'showCinema?cName=" + c + "'\" title=\"" + c + " 상세보기\">" + c + "</a></div>";
			for(int i = 0; i < screenMap.size(); i++) {
				matchScreen = screenMap.get(i);
				for(String s : matchScreen.keySet()) {
					dtos = matchScreen.get(s);
					result += "<div class=\"theater-type-box\"><div class=\"theater-type\"><p class=\"theater-name\">" + s + "</p></div><div class=\"theater-time\"><div class=\"theater-type-area\">2D</div>" + 
							"<div class=\"theater-time-box\"><table class=\"time-list-table\"><caption>상영시간을 보여주는 표 입니다.</caption><colgroup><col style=\"width: 99px;\"><col style=\"width: 99px;\"><col style=\"width: 99px;\">" + 
							"<col style=\"width: 99px;\"><col style=\"width: 99px;\"><col style=\"width: 99px;\"><col style=\"width: 99px;\"><col style=\"width: 99px;\"></colgroup><tbody><tr>";
					for(AllDTO d : dtos) {
						result += "<td class=\"\" brch-no=\"1372\" play-schdl-no=\"2208031372006\"\r\n" + 
								"															rpst-movie-no=\"21084100\" theab-no=\"01\" play-de=\"20220803\"\r\n" + 
								"															play-seq=\"1\">\r\n" + 
								"															<div class=\"td-ab\">\r\n" + 
								"																<div class=\"txt-center\">\r\n" + 
								"																	<div title=\"영화예매하기\" onclick=\"move_booking_page(" + d.getR_num() + ")\">\r\n" + 
								"																		<div class=\"ico-box\">\r\n" + 
								"																			<i class=\"iconset ico-sun\"></i>\r\n" + 
								"																		</div>\r\n" + 
								"																		<p class=\"time\">" + d.getR_start().substring(0, 5) + "</p>\r\n" + 
								"																		<p class=\"chair\">" + d.getR_able() + "/" + d.getS_seat() + "석</p>\r\n" + 
								"																		<div class=\"play-time\">\r\n" + 
								"																			<p>" + d.getR_start().substring(0, 5) + "~\r\n" + d.getR_end().substring(0, 5) + 
								"																	</p></div></div>\r\n" + 
								"																</div>\r\n" + 
								"															</div>\r\n" + 
								"														</td>";
					}
					result += "</tr>\r\n" + 
							"												</tbody>\r\n" + 
							"											</table>\r\n" + 
							"										</div>\r\n" + 
							"									</div>\r\n" + 
							"								</div>\r\n";
				}
				result += "</div>";
			}
		}
		
		return result;
	}

	public String makeCinemaAndDateResultCode(ArrayList<HashMap> tmp) {
		
		String result = "";
		
		ArrayList<HashMap> screenMap = new ArrayList<HashMap>();
		HashMap<String, ArrayList> matchScreen = new HashMap<String, ArrayList>();
		ArrayList<AllDTO> dtos = new ArrayList<AllDTO>();
		
		HashMap<String, ArrayList> eachMovie =  tmp.get(0);
		for(String m : eachMovie.keySet()) {
			screenMap = eachMovie.get(m);
			result += "<div class=\'theater-list\'><div class=\'theater-tit\'><p><a href=\"/movie-detail?rpstMovieNo=21084100\" title=\"" + m + " 상세보기\">" + m + "</a></p><p class=\"infomation\"><span>상영중</span></p></div>";
			for(int i = 0; i < screenMap.size(); i++) {
				matchScreen = screenMap.get(i);
				for(String s : matchScreen.keySet()) {
					dtos = matchScreen.get(s);
					result += "<div class=\"theater-type-box\"><div class=\"theater-type\"><p class=\"theater-name\">" + s + "</p></div><div class=\"theater-time\"><div class=\"theater-type-area\">2D</div>" + 
							"<div class=\"theater-time-box\"><table class=\"time-list-table\"><caption>상영시간을 보여주는 표 입니다.</caption><colgroup><col style=\"width: 99px;\"><col style=\"width: 99px;\"><col style=\"width: 99px;\">" + 
							"<col style=\"width: 99px;\"><col style=\"width: 99px;\"><col style=\"width: 99px;\"><col style=\"width: 99px;\"><col style=\"width: 99px;\"></colgroup><tbody><tr>";
					for(AllDTO d : dtos) {
						result += "<td class=\"\" brch-no=\"1372\" play-schdl-no=\"2208031372006\"\r\n" + 
								"															rpst-movie-no=\"21084100\" theab-no=\"01\" play-de=\"20220803\"\r\n" + 
								"															play-seq=\"1\">\r\n" + 
								"															<div class=\"td-ab\">\r\n" + 
								"																<div class=\"txt-center\">\r\n" + 
								"																	<div title=\"영화예매하기\" onclick=\"move_booking_page(" + d.getR_num() + ")\">\r\n" + 
								"																		<div class=\"ico-box\">\r\n" + 
								"																			<i class=\"iconset ico-sun\"></i>\r\n" + 
								"																		</div>\r\n" + 
								"																		<p class=\"time\">" + d.getR_start().substring(0, 5) + "</p>\r\n" + 
								"																		<p class=\"chair\">" + d.getR_able() + "/" + d.getS_seat() + "석</p>\r\n" + 
								"																		<div class=\"play-time\">\r\n" + 
								"																			<p>" + d.getR_start().substring(0, 5) + "~\r\n" + d.getR_end().substring(0, 5) + 
								"																	</p></div></div>\r\n" + 
								"																</div>\r\n" + 
								"															</div>\r\n" + 
								"														</td>";
					}
					result += "</tr>\r\n" + 
							"												</tbody>\r\n" + 
							"											</table>\r\n" + 
							"										</div>\r\n" + 
							"									</div>\r\n" + 
							"								</div>\r\n";
				}
				result += "</div>";
			}
		}
		
		return result;
	}

	
}