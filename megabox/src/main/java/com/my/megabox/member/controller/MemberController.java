package com.my.megabox.member.controller;

import java.util.ArrayList;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.my.megabox.booking.dto.BookingDTO;
import com.my.megabox.member.dto.InquiryDTO;
import com.my.megabox.member.dto.MemberDTO;
import com.my.megabox.member.repository.MemberDAO;
import com.my.megabox.member.service.MemberService;
import com.my.megabox.member.service.MessageService;
import com.my.megabox.movie.dto.LikeDTO;
import com.my.megabox.movie.dto.PostDTO;

import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Controller 
public class MemberController {
	@Autowired private MemberDAO dao;
	@Autowired private MemberService service;
	@Autowired private MessageService mservice;
	@Autowired private HttpSession session;
	
	@RequestMapping("Membermain")
	public String Membermain(RedirectAttributes ra, Model model) {
		String id = (String) session.getAttribute("loginId");
		Integer unumSession = (Integer)session.getAttribute("loginNum");
		if(id == null || id == "" || unumSession == null) {
			ra.addFlashAttribute("errMsg", "로그인 후 이용해주세요");
			return "redirect:main";
		}
		
		MemberDTO member = dao.selectId(id);
		model.addAttribute("userImage", member.getU_image());
		// 예매 내역userImage
		ArrayList<BookingDTO> ymList = service.YMList(unumSession);
		model.addAttribute("ymList", ymList);
		
		ArrayList<InquiryDTO> iqList = service.IQList(unumSession);
		model.addAttribute("iqList", iqList);
		
		ArrayList<BookingDTO> movieList = service.watchedmovie(unumSession);
		System.out.println(movieList);
		model.addAttribute("movieList", movieList);
		
		//본영화
		
		//무비포스트
		int postNum = dao.postnum(id);	
		model.addAttribute("postNum", postNum);
		//좋아요
		int likeNum = dao.likenum(unumSession);
		model.addAttribute("likeNum", likeNum);
		
		return "member/Membermain";
	}
	
	@RequestMapping("BookingList")
	public String TicketHistory(RedirectAttributes ra, String num, Model model) {
		Integer unumSession = (Integer)session.getAttribute("loginNum");
		System.out.println("TicketHistory's unumSession: " + unumSession);
		if(unumSession == null) {
			ra.addFlashAttribute("errMsg", "로그인 후 이용해주세요");
			return "redirect:main";
		}else {
		ArrayList<BookingDTO> ymList = service.YMList(unumSession);
		model.addAttribute("ymList", ymList);
		ArrayList<BookingDTO> cList = service.cList(unumSession);
		model.addAttribute("cList", cList);
		return "member/BookingList";
		}
	}
	
	@GetMapping("cancelBooking")
	public @ResponseBody String cancelBooking(int b_num) {
		System.out.println("jsp에서 넘어오는 b_num : "+b_num);
		String msg = service.cancelBooking(b_num);
		return msg;
	}
	
	@ResponseBody
	@RequestMapping(value="optionBuylist", produces="html/text; charset=UTF-8")
	public String optionBuylist(String radPurc, String startDate, String endDate, Model model) {
		System.out.println("radPurc : " + radPurc);
		System.out.println("startDate : " + startDate);
		System.out.println("endDate : " + endDate);
		String result = service.optionBuyList(radPurc, startDate, endDate);
		model.addAttribute("result", result);
		System.out.println("result : " + result);
		return result;
	}
	
	@RequestMapping("MovieStory")
	public String MovieStory(RedirectAttributes ra, Model model) {
		String id = (String)session.getAttribute("loginId");
		if(id == null || id == "") {
			ra.addFlashAttribute("errMsg", "로그인 후 이용해주세요");
			return "redirect:main";
		}
		int unumSession = (int)session.getAttribute("loginNum");
		//무비타임라인
//		HashMap<String, Object> result = new HashMap<String, Object>();
		//무비포스트
		ArrayList<PostDTO> postList = service.postList(unumSession);
		model.addAttribute("postList", postList);
		
		//본영화
		ArrayList<BookingDTO> movieList = service.watchedmovie(unumSession);
		model.addAttribute("movieList", movieList);
		
		//보고싶어(좋아요)
		ArrayList<LikeDTO> likeList = service.lList(unumSession);
		model.addAttribute("likeList", likeList);

//		model.addAttribute("result", result);
		return "member/MovieStory";
	}
	
	@GetMapping("unlikeMovie")
	public @ResponseBody void unlikeMovie(int l_num) {
		int unum = (int) session.getAttribute("loginNum");
		System.out.println("영화번호 잘 넘어오나 : " + l_num);
		service.unlikeMovie(l_num, unum);
	}
	
	@RequestMapping("MyInquiry")
	public String MyInquiry(RedirectAttributes ra, Model model) {
		String id = (String)session.getAttribute("loginId");
		if(id == null || id == "") {
			ra.addFlashAttribute("errMsg", "로그인 후 이용해주세요");
			return "redirect:main";
		}
		int unumSession = (int)session.getAttribute("loginNum");
		ArrayList<InquiryDTO> iqList = service.IQList(unumSession);
		model.addAttribute("iqList", iqList);
		return "member/MyInquiry";
	}
	
	@GetMapping("OneOnOne_1")
	public String OneOnOne(Model model) {
		String id = (String)session.getAttribute("loginId");
		MemberDTO user = service.userInfo(id);
		model.addAttribute("user", user);
		return "member/OneOnOne_1";
	}
	
	@PostMapping("OneOnOne_1")
	public String OneOnOne(InquiryDTO inquiry, String agreebox, String inqMclCd, String firstAddress, String secondAddress, HttpServletRequest request) {
		if(agreebox == null || agreebox == "") {
			request.setAttribute("msg", "개인정보 수집에 대한 동의가 필요합니다.");
			request.setAttribute("url", "OneOnOne_1");
			return "member/alert";
		}
		if(inquiry.getI_type() == null || inquiry.getI_type() == "") {
			request.setAttribute("msg", "문의유형을 선택해주세요.");
			request.setAttribute("url", "OneOnOne_1");
			return "member/alert";
		}
		System.out.println(firstAddress + " - " + secondAddress);
		if(inqMclCd.equals("Jijum")) {
			if(firstAddress == null || firstAddress == "") {
				request.setAttribute("msg", "지점을 선택해주세요.");
				request.setAttribute("url", "OneOnOne_1");
				return "member/alert";
			}
			String juso = firstAddress + " - " + secondAddress;
			inquiry.setI_cinema(juso);
		} else if(inqMclCd.equals("Gita")) {
			inquiry.setI_cinema("서울 - 센터");
		}
		System.out.println("지점유형 데이터가 바뀌었나 체크 : " + inquiry.getI_cinema());
		String msg = service.inquiryProc(inquiry);
		if(msg == "게시글 작성 완료")
			return "redirect:MyInquiry";
		else {
			request.setAttribute("msg", msg);
			request.setAttribute("url", "OneOnOne_1");
			return "member/alert";
		}
	}
	
	@RequestMapping("MyInfo")
	public String MyInfo() {
		return "member/MyInfo";
	}
	
	@GetMapping("UserInfo")
	public String UserInfo(String id, Model model) {
		System.out.println("아이디를 받아오나 : " + id);
		MemberDTO user = service.userInfo(id);
		model.addAttribute("user", user);
		return "member/UserInfo";
	}
	
	@PostMapping("UserInfo")
	public String UserInfo(MemberDTO member, String chPhone) {
		
		System.out.println(member.getU_tel());
		if(chPhone == null || chPhone == "") 
			member.setU_tel(member.getU_tel());
		else 
			member.setU_tel(chPhone);
		
		String msg = service.modifyUserInfo(member);
		if(msg == "회원정보 수정 완료")
			return "member/Membermain";
		else {
			System.out.println("수정 실패~");
			return "member/Membermain";
		}
	}
	
	// Test page
	@RequestMapping("select_test")
	public String select_test(String toNumber, HttpServletRequest request, Model model) {
		return "member/select_test";
	}
	
	// 문자인증
	@GetMapping("messageRequest")
	public @ResponseBody String messageRequest(String phoneNumber) throws CoolsmsException {
		Random r = new Random();
		r.nextInt(1000000);
		int begin = 111111;
		int end = 999999;
		String randomNumber = String.format("%06d", r.nextInt(end - begin + 1) + begin);
		mservice.sendMessage(phoneNumber, randomNumber);
		return randomNumber;
	}
	
	@GetMapping("ChangePw")
	public String ChangePw() {
		return "member/ChangePw";
	}
	
	@PostMapping("ChangePw")
	public String ChangePw(String id, String pw, String pwnew, String checkpwnew, HttpServletRequest request) {
		String sessionid = (String)session.getAttribute("loginId");
		System.out.println("id : " + sessionid + "pw : " + pw + "pwnew : " + pwnew + "checkpwnew : " + checkpwnew);
		String msg = service.changePw(sessionid, pw, pwnew, checkpwnew);
		if(msg == "적합한 비밀번호입니다.") {
			request.setAttribute("msg", "비밀번호 변경 완료");
			request.setAttribute("url", "main");
			return "member/alert";
		}else {
			request.setAttribute("msg", msg);
			request.setAttribute("url", "ChangePw");
			return "member/alert";
		}
	}
	
	// 회원 탈퇴
	@GetMapping("goodbye_mega")
	public String goodbye_mega() {
		return "member/goodbye_mega";
	}
	
	@PostMapping("goodbye_mega")
	public String goodbye_mega(String pw, String useroutcheck, HttpServletRequest request) {
		String id = (String) session.getAttribute("loginId");
		String msg = service.deleteMember(id, pw, useroutcheck);
		if(msg == "회원탈퇴 완료") {
			request.setAttribute("msg", "다음에 또 만나요 :)");
			request.setAttribute("url", "main");
			return "member/alert";
		}else {
			request.setAttribute("msg", msg);
			request.setAttribute("url", "goodbye_mega");
			return "member/alert";
		}
	}
	
	@RequestMapping("detailIQ")
	public String detailIQ(int i_num, Model model) {
		InquiryDTO inquiry = service.detailIQ(i_num);
		model.addAttribute("detailIQ", inquiry);
		return "member/detailIQ";
	}
	
	//test
	@PostMapping(value = "askhobby")
	public @ResponseBody String askhobby(String hobby, Model model) {
		System.out.println("잘넘어왔나 : " + hobby);
		model.addAttribute("hobby", hobby);
		return hobby;
	}
}