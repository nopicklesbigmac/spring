package com.my.megabox.movie.service;

import java.io.File;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.my.megabox.movie.dto.MovieDTO;
import com.my.megabox.movie.dto.RunningDTO;
import com.my.megabox.movie.dto.ScreenDTO;
import com.my.megabox.movie.dto.PostDTO;
import com.my.megabox.movie.repository.IMovieDAO;

@Service
public class MovieService {
	@Autowired
	IMovieDAO dao;
	@Autowired
	HttpSession session;

	public String titleSearch(String title, Model model) {
		List<MovieDTO> list = dao.titleSearch(title);
		if (list.isEmpty()) {
			model.addAttribute("msg", "검색결과가 없습니다.");
			return fromJson(list);
		}
		for (MovieDTO m : list) {
			attendance(m);
			System.err.println(m.getM_name());
		}
		model.addAttribute("list", list);
		return fromJson(list);
	}

	public void attendance(MovieDTO movie) {
		DecimalFormat decFormat = new DecimalFormat("###,###");
		movie.setM_attendancestr(decFormat.format(movie.getM_attendance()));
		int str0 = movie.getM_avg() / 10;
		int str1 = movie.getM_avg() % 10;
		String str = String.valueOf(str0) + "." + String.valueOf(str1);
		movie.setM_avgstr(str);
	}

	public void urlstr(MovieDTO movie) {
		String[] strArr = movie.getM_trailer().split("=");
		movie.setM_trailer(strArr[1]);

	}

	public void writeProc(MultipartHttpServletRequest req) {
		// String id = (String)session.getAttribute("id");
		String session_loginId = (String) session.getAttribute("loginId");
		// post.setU_num(id);
		 if(session.getAttribute("loginId")==null) {
			 
	      }else {
	    	int loginNum = (int) session.getAttribute("loginNum");
	    	System.out.println(session_loginId);
	    	System.out.println(loginNum);
	    	String content = req.getParameter("content");
	  		String movienum = req.getParameter("movienum");
	  		int m_num = 0;
	  		if (movienum != null) {
	  			m_num = Integer.parseInt(movienum);
	  			System.out.println(m_num);
	  		}
	  		PostDTO post = new PostDTO();
	  		post.setU_id(session_loginId);
	  		//IMemberDAO dao;
	  		post.setU_num(loginNum);
	  		post.setM_num(m_num);
	  		post.setP_content(content);
	  		post.setP_like(0);
	  		Date date = new Date();
	  		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
	  		post.setP_time(sdf.format(date));
	  		MultipartFile file = req.getFile("fileName");
	  		if (file.getSize() != 0) {

	  			String path = "C:\\javas\\spring_workspace\\megabox\\src\\main\\webapp\\resources\\img\\upload\\"; // 폴더 경로
	  			File Folder = new File(path);
	  			if (!Folder.exists()) {
	  				Folder.mkdir();
	  			}
	  			String fileName = file.getOriginalFilename();
	  			File save = new File(path + fileName);
	  			post.setP_image(fileName);// "resources/img/upload/" +
	  			
	  			try {
	  				file.transferTo(save);
	  			} catch (Exception e) {
	  				e.printStackTrace();
	  			}
	  		} else {
	  			post.setP_image("파일 없음");
	  		}
	  		
	  		dao.writeProc(post);
	      }
	}

	public String fromJson(List<MovieDTO> list) {
		String data = "{\"cd\" : [";
		for (MovieDTO tmp : list) {
			data += "{ \"m_num\" : \"" + tmp.getM_num() + "\",";
			data += " \"m_name\" : \"" + tmp.getM_name() + "\",";
			data += " \"m_poster\" : \"" + tmp.getM_poster() + "\",";
			data += " \"m_story\" : \"" + tmp.getM_story() + "\",";
			data += " \"m_date\" : \"" + tmp.getM_date() + "\",";
			data += " \"m_age\" : \"" + tmp.getM_age() + "\",";
			data += " \"m_like\" : \"" + tmp.getM_like() + "\",";
			data += " \"m_avg\" : \"" + tmp.getM_avg() + "\",";
			data += " \"m_avgstr\" : \"" + tmp.getM_avgstr() + "\" },";

		}
		data = data.substring(0, data.length() - 1);
		data += "]}";
		return data;
	}

	public String fromJson_r(List<RunningDTO> list, String c_name, String m_name) {
		String data = "{\"cd\" : [";
		Date date = new Date();
		SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy.MM.dd");
		SimpleDateFormat format2 = new SimpleDateFormat("kkMM");
		String datestr = format1.format(date);
		String nowstr = format2.format(date);
		int now = Integer.parseInt(nowstr);
		for (RunningDTO tmp : list) {
			String[] start = tmp.getR_start().split(":");
			String hhmmstr =start[0]+start[1];
			int hhmm = Integer.parseInt(hhmmstr);
			/*스크린 정보 받아오기 */
			System.out.println(tmp.getS_num());
			ScreenDTO screen = dao.selectScreen(tmp.getS_num());
			/*
			 * String s_name ="";// screen.getS_name(); int s_seat = 0;//screen.getS_seat();
			 */		
			
			String s_type ="";
			String s_name ;
			int s_seat = screen.getS_seat();
			s_name = screen.getS_name().replace("관", "");
			if(s_name.contains("컴포트")) {
				s_type = "com";
				s_name = s_name.replace("컴포트", "");
				System.out.println(s_name);}
			else {
				
			}
			
			if (tmp.getR_date().equals(datestr)) {
				if (now <= hhmm) {
					data += "{ \"r_num\" : \"" + tmp.getR_num() + "\",";
					data += " \"r_able\" : \"" + tmp.getR_able() + "\",";
					data += " \"r_start\" : \"" + tmp.getR_start() + "\",";
					data += " \"r_end\" : \"" + tmp.getR_end() + "\",";
					data += " \"c_name\" : \"" + c_name + "\",";
					data += " \"s_num\" : \"" + tmp.getS_num() + "\",";
					data += " \"m_name\" : \"" + m_name + "\",";
					data += " \"s_name\" : \"" + s_name + "\",";
					data += " \"s_seat\" : \"" + screen.getS_seat() + "\",";
					data += " \"r_date\" : \"" + tmp.getR_date() + "\" },";
				}
			}else {
				data += "{ \"r_num\" : \"" + tmp.getR_num() + "\",";
				data += " \"r_able\" : \"" + tmp.getR_able() + "\",";
				data += " \"r_start\" : \"" + tmp.getR_start() + "\",";
				data += " \"r_end\" : \"" + tmp.getR_end() + "\",";
				data += " \"c_name\" : \"" + c_name + "\",";
				data += " \"s_num\" : \"" + tmp.getS_num() + "\",";
				data += " \"m_name\" : \"" + m_name + "\",";
				data += " \"s_name\" : \"" + s_name + "\",";
				data += " \"s_seat\" : \"" + screen.getS_seat() + "\",";
				data += " \"r_date\" : \"" + tmp.getR_date() + "\" },";
			}
		}
		data = data.substring(0, data.length() - 1);
		data += "]}";
		System.out.println(data);
		return data;
	}
}
