package com.my.megabox.cinema.service;


import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.my.megabox.cinema.dto.CinemaDTO;
import com.my.megabox.cinema.dto.FacilityDTO;
import com.my.megabox.cinema.dto.FloorDTO;
import com.my.megabox.cinema.repository.ICinemaDAO;
import com.my.megabox.common.dto.AllDTO;
@Service
public class CinemaService {
	@Autowired private ICinemaDAO dao;
	
	public void list(List<CinemaDTO> c_list , Model model) {
		for(CinemaDTO list:c_list) {
			int num = list.getC_num();
			if (1<= num && num<=19) {
				list.setCities("서울");
			}else if (20<=num && num<=50) {
				list.setCities("경기");
			}else if (51<=num &&num<=55) {
				list.setCities("인천");
			}else if (56<=num &&num<=72) {
				list.setCities("대전");
			}else if (73<=num &&num<=94) {
				list.setCities("부산");
			}else if (95<=num &&num<=103) {
				list.setCities("광주");
			}else if (104<=num &&num<=108) {
				list.setCities("강원");
			}

			
		}
		
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
	
	private ArrayList<HashMap> makeResult(ArrayList<AllDTO> allList){
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

	public HashMap<String, Object> showCinema(String cName) {
		HashMap<String, Object> info = null;
		
		if(cName == null || cName == "")
			cName = "강남";
		
		CinemaDTO cinema = dao.showCinema(cName);
		ArrayList<FloorDTO> floor = dao.showFloor(cName);
		ArrayList<FacilityDTO> facility = dao.showFacility(cName);
		
		if(cinema != null) {
			info = new HashMap();
			info.put("cinema", cinema);
			info.put("floor", floor);
			info.put("facility", facility);
		}
		return info;
	}

	public ArrayList<HashMap> sendAllByCinema(String cName, String day) {
		if(day == null || day == "") {
			day =  LocalDate.now().toString().replace("-", ".");
			System.out.println("변환한 날짜: " + day);
		}
		
		HashMap<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("cName", cName);
		paramMap.put("day", day);
		
		ArrayList<AllDTO> list = dao.sendAllByCinema(paramMap);
		return makeResult(list);
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
