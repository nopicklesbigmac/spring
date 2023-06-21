package com.test.root;

import java.lang.reflect.Member;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired private ICinemaDAO cinemaDao;
	@Autowired private IMovieDAO movieDao;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "header_main";
	}

	@RequestMapping(value = "/list")
	public String list(Model model) {
		List<CinemaDTO> list = cinemaDao.selectall();
		model.addAttribute("list",list);
		return "cinema/list";
	}
	@RequestMapping(value = "/booking")
	public String booking() {
		return "booking";
	}
	
	@RequestMapping(value = "/theater") 
	public String theater(int brchNo,Model model) {
		List<CinemaDTO> list = cinemaDao.selectall();
		model.addAttribute("list",list);
		
		CinemaDTO cinema = cinemaDao.selectbrchNo(brchNo);
		model.addAttribute("cinema",cinema);
		
		List<FacilityDTO> facility = cinemaDao.facility(brchNo);
		model.addAttribute("facility",facility);
		
		List<FloorDTO> floor = cinemaDao.floor(brchNo);
		model.addAttribute("floor",floor);
		
		return "cinema/theater";	
	}

	@RequestMapping(value = "/movie") 
	public String movie(Model model) {
		List<MovieDTO> list = movieDao.selectall();
		model.addAttribute("list",list);
		return "movie/movie"; 
	}
	@RequestMapping(value = "/movie-detail") 
	public String movie_detail(int rpstMovieNo, Model model) {
		MovieDTO movie = movieDao.selectMovieNo(rpstMovieNo);
		model.addAttribute("movie",movie);
		return "movie/movie-detail"; 
	}
	
	@RequestMapping(value = "/movie-trailer") 
	public String movie_trailer(int rpstMovieNo, Model model) {
		MovieDTO movie = movieDao.selectMovieNo(rpstMovieNo);
		MovieService ms = new MovieService();
		ms.urlstr(movie); 
		model.addAttribute("movie",movie);
		return "movie/movie-trailer"; 
	}
	
}
