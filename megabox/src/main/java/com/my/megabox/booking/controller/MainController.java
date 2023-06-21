package com.my.megabox.booking.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.my.megabox.movie.dto.LikeDTO;
import com.my.megabox.movie.dto.MovieDTO;
import com.my.megabox.movie.repository.IMovieDAO;

@Controller
public class MainController {
	@Autowired
	private IMovieDAO movieDao;
	@Autowired
	HttpSession session;
	@GetMapping("main")
	public void getMain(Model model) {
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
	@GetMapping("main_test")
	public void getMainTest() {
		
	}
}
