package com.my.megabox.movie.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.my.megabox.booking.dto.BookingDTO;
import com.my.megabox.cinema.dto.CinemaDTO;
import com.my.megabox.cinema.repository.ICinemaDAO;
import com.my.megabox.cinema.service.CinemaService;
import com.my.megabox.movie.dto.CommentDTO;
import com.my.megabox.movie.dto.LikeDTO;
import com.my.megabox.movie.dto.MovieDTO;
import com.my.megabox.movie.dto.RunningDTO;
import com.my.megabox.movie.dto.PostDTO;
import com.my.megabox.movie.dto.ReplyDTO;
import com.my.megabox.movie.repository.IMovieDAO;
import com.my.megabox.movie.service.MovieService;

@Controller
public class MovieController {
	@Autowired
	private IMovieDAO movieDao;
	@Autowired
	private MovieService service;
	@Autowired
	HttpSession session;
	@ResponseBody
	@PostMapping("/movie")
	public String movie_ajax(@RequestBody(required = false) String title, Model model) {
		System.err.println(title);
		if (title == null || title.isEmpty()) {
			List<MovieDTO> list = movieDao.selectall();
			for (MovieDTO m : list) {
				service.attendance(m);
			}
			model.addAttribute("list", list);
			return service.titleSearch(title, model);
		} else {
			// 검색어에 맞는 결과
			return service.titleSearch(title, model);
		}
	}
	@RequestMapping(value = "/movie")
	public String movie(Model model) {
		List<MovieDTO> list = movieDao.selectall();
		model.addAttribute("list", list);
		likecheck(model);
		if (session.getAttribute("loginNum")!=null){
			int loginNum = (int) session.getAttribute("loginNum");
			List<LikeDTO> like = movieDao.like(loginNum);
			HashMap<Integer, Boolean> map = new HashMap<>();
			for (LikeDTO lll : like) {
				int num = lll.getL_num();
				int inum = lll.getU_num();
				map.put(num, true);
			}
			model.addAttribute("map", map);
		}
		return "movie/movie";
	}
	@RequestMapping(value = "/movie/comingsoon")
	public String comingsoon(Model model) {
		List<MovieDTO> list = movieDao.selectall();
		model.addAttribute("list", list);
		return "movie/comingsoon";
	}
	@RequestMapping(value = "/search")
	public String movie_search(String mName, Model model) {
		List<MovieDTO> list = movieDao.titleSearch(mName);
		model.addAttribute("list", list);
		model.addAttribute("search", true);
		likecheck(model);
		if (session.getAttribute("loginNum")!=null){
			int loginNum = (int) session.getAttribute("loginNum");
			List<LikeDTO> like = movieDao.like(loginNum);
			HashMap<Integer, Boolean> map = new HashMap<>();
			for (LikeDTO lll : like) {
				int num = lll.getL_num();
				int inum = lll.getU_num();
				map.put(num, true);
			}
			model.addAttribute("map", map);
		}
		return "movie/movie";
	}
	
	@RequestMapping(value = "/moviepost")
	public String moviepost(Model model) {
		List<PostDTO> list = movieDao.selectpost();
		List<MovieDTO> movie = movieDao.selectall();
		HashMap<Integer, MovieDTO> map = new HashMap<>();
		
		for (MovieDTO m : movie) {
			int num = m.getM_num();
			map.put(num, m);
		}
		model.addAttribute("list", list);
		model.addAttribute("map", map);

		return "movie/moviepost";
	}
	@RequestMapping(value = "/postdelete")
	public String postdelete(int p_num, Model model) {
		PostDTO post = movieDao.selectpost_d(p_num);
		if (post!=null) {
			movieDao.deletepost(post);
		}
		
		List<PostDTO> list = movieDao.selectpost();
		List<MovieDTO> movie = movieDao.selectall();
		HashMap<Integer, MovieDTO> map = new HashMap<>();
		
		for (MovieDTO m : movie) {
			int num = m.getM_num();
			map.put(num, m);
		}
		model.addAttribute("list", list);
		model.addAttribute("map", map);

		return "movie/moviepost";
	}
	@ResponseBody
	@PostMapping(value = "/like")
	public void map(@RequestBody(required = false) HashMap<String, String> map) {
		String liketype = map.get("l_type");
		int m_num = Integer.parseInt(map.get("m_num"));

		int loginNum = (int) session.getAttribute("loginNum");
		
		if (session.getAttribute("loginNum")!=null){
			if (liketype == "off" || liketype.equals("off")) {
				Date date = new Date();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
				String l_time = sdf.format(date);
				LikeDTO dto = new LikeDTO();
				dto.Like(m_num, l_time, loginNum);
				movieDao.likeAdd(dto);
				movieDao.upLike(m_num);
			} else if (liketype == "on" || liketype.equals("on")) {
				LikeDTO dto = new LikeDTO();
				dto.Like(m_num, "", loginNum);
				movieDao.likeCancel(dto);
				movieDao.downLike(m_num);
			}
		}
		
	}
	@ResponseBody 
	@PostMapping(value = "/reply")
	public void reply(@RequestBody(required = false) HashMap<String, String> map, Model model) {
		System.err.println("dwd");
		// String cinema = map.get("cinema");
		int p_num = Integer.parseInt(map.get("p_num"));
		String d_content = map.get("d_content");
		int loginNum = (int) session.getAttribute("loginNum");
		String loginId = (String) session.getAttribute("loginId");
		Date date = new Date();
  		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
  		
  		String d_time = sdf.format(date);
  		ReplyDTO dto = new ReplyDTO();
  		dto.setD_content(d_content);
  		dto.setD_num(0);
  		dto.setD_time(d_time);
  		dto.setP_num(p_num); 
  		dto.setU_id(loginId);
  		dto.setU_num(loginNum);
  		movieDao.replyProc(dto);
	}
	@RequestMapping(value = "/write")
	public String write(Model model) {
		//  전체영화목록 >> 본영화 목록 
		if (session.getAttribute("loginNum")!=null) {
			int loginNum = (int) session.getAttribute("loginNum");
			List<BookingDTO> bookinglist = movieDao.bookinguser(loginNum);
			if (bookinglist!=null) {
				List<MovieDTO> list = new ArrayList<MovieDTO>();
				for (BookingDTO item : bookinglist) {
					MovieDTO dto = movieDao.selectbooking(item.getM_num());
					list.add(dto);
				}
				model.addAttribute("list", list);
			}else {
				//List<MovieDTO> list = movieDao.selectall();
				model.addAttribute("msg", "관람한 영화목록이 없습니다.");
				//model.addAttribute("list", list);
			}
		}
		return "movie/write";
	}
	@RequestMapping(value = "/writeProc")
	public String writeProc(MultipartHttpServletRequest multi, Model model) {
		String content = multi.getParameter("content");
		if (content.equals("")) {
			model.addAttribute("msg", "내용을 작성해주새요");
			return "movie/write";
		}
		service.writeProc(multi);
		model.addAttribute("msg", "작성완료");
		
		return write(model);
	}
	// 영화상세 페이지
	@RequestMapping(value = "/movie-detail")
	public String movie_detail(int rpstMovieNo, Model model) {
		MovieDTO movie = movieDao.selectMovieNo(rpstMovieNo);
		service.attendance(movie);
		model.addAttribute("movie", movie);
		likecheck(model);
		return "movie/movie-detail";
	}
	@RequestMapping(value = "/movie-comment")
	public String movie_comment(int rpstMovieNo, Model model) {
		MovieDTO movie = movieDao.selectMovieNo(rpstMovieNo);
		List<CommentDTO> comment = movieDao.selectcomment(rpstMovieNo);
		service.urlstr(movie);
		service.attendance(movie);
		model.addAttribute("movie", movie);
		model.addAttribute("comment", comment);
		likecheck(model);
		return "movie/movie-comment";
	}
	@RequestMapping(value = "/movie-post")
	public String movie_post(int rpstMovieNo, Model model) {
		List<PostDTO> post = movieDao.selectpostNum(rpstMovieNo);
		MovieDTO movie = movieDao.selectMovieNo(rpstMovieNo);
		service.urlstr(movie);
		service.attendance(movie);
		model.addAttribute("movie", movie);
		model.addAttribute("post", post);
		likecheck(model);
		return "movie/movie-post";
	}

	@RequestMapping(value = "/movie-trailer")
	public String movie_trailer(int rpstMovieNo, Model model) {
		MovieDTO movie = movieDao.selectMovieNo(rpstMovieNo);
		service.urlstr(movie);
		service.attendance(movie);
		model.addAttribute("movie", movie);
		likecheck(model);
		return "movie/movie-trailer";
	}
	// 빠른 예매
	@Autowired
	private ICinemaDAO cinemaDao;
	@Autowired
	private CinemaService cinamaService;

	@RequestMapping(value = "/booking")
	public String booking(Model model) {
		List<MovieDTO> m_list = movieDao.selectall();
		List<CinemaDTO> c_list = cinemaDao.selectall();
		cinamaService.list(c_list, model);
		model.addAttribute("m_list", m_list);
		model.addAttribute("c_list", c_list);
		return "booking/booking";
	}

//	@RequestMapping(value = "/map")
//	public String map(Model model) {
//		List<MovieDTO> m_list = movieDao.selectall();
//		List<CinemaDTO> c_list = cinemaDao.selectall();
//		cinamaService.list(c_list, model);
//		model.addAttribute("m_list", m_list);
//		model.addAttribute("c_list", c_list);
//		return "booking/map";
//	}
	
	// 빠른예매 상영시간표 ajax
	@ResponseBody
	@PostMapping(value = "/map")
	public String map(@RequestBody(required = false) HashMap<String, String> map, Model model) {
		int c_num = Integer.parseInt(map.get("c_num"));
		int m_num = Integer.parseInt(map.get("m_num"));
		String c_name = map.get("c_name");
		String m_name = map.get("m_name");
		String t_date = map.get("t_date");
		List<RunningDTO> list = movieDao.selectrun(c_num, m_num, t_date);
		if (list == null || list.isEmpty()) {
			return "false";
		} else {
			return service.fromJson_r(list, c_name, m_name);
		}
	}
	
	private void likecheck(Model model) {
		if (session.getAttribute("loginNum") != null) {
			int loginNum = (int) session.getAttribute("loginNum");
			List<LikeDTO> like = movieDao.like(loginNum);
			HashMap<Integer, Boolean> map = new HashMap<>();
			for (LikeDTO lll : like) {
				int num = lll.getL_num();
				int inum = lll.getU_num();
				map.put(num, true);
			}
			model.addAttribute("map", map);
		}
	}
}
