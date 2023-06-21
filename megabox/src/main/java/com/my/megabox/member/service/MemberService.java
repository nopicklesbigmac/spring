package com.my.megabox.member.service;

import java.util.ArrayList;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.my.megabox.booking.dto.BookingDTO;
import com.my.megabox.cinema.dto.CinemaDTO;
import com.my.megabox.member.dto.InquiryDTO;
import com.my.megabox.member.dto.MemberDTO;
import com.my.megabox.member.repository.MemberDAO;
import com.my.megabox.movie.dto.LikeDTO;
import com.my.megabox.movie.dto.MovieDTO;
import com.my.megabox.movie.dto.PostDTO;
import com.my.megabox.movie.dto.RunningDTO;
import com.my.megabox.movie.dto.ScreenDTO;

@Service
public class MemberService implements IMemberService{ 
	@Autowired private MemberDAO dao;
	@Autowired private HttpSession session;
	@Autowired private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	public MemberDTO userInfo(String id) {
		MemberDTO result = dao.selectId(id);
		return result;
	}

	public String inquiryProc(InquiryDTO inquiry) {
		System.out.println("이건 서비스에서 확인하는 지점유형 : " + inquiry.getI_cinema());
		int num = (int)session.getAttribute("loginNum");
		inquiry.setU_num(num);
		System.out.println(inquiry.getU_num());
		if(inquiry.getI_title() == null || inquiry.getI_title() == "")
			return "제목을 입력해주세요.";
		if(inquiry.getI_content() == null || inquiry.getI_content() == "")
			return "내용을 입력해주세요.";
		
		dao.makeInquiry(inquiry);
		return "게시글 작성 완료";
	}

	public String changePw(String id, String pw, String pwnew, String checkpwnew) {
		MemberDTO result = dao.selectId(id);
		if(bcryptPasswordEncoder.matches(pw,result.getU_pw()) == false)
			return "현재 비밀번호가 일치하지 않습니다.";
		if(pwnew.equals(checkpwnew) == false)
			return  "새 비밀번호가 일치하지 않습니다."; 
		
		String lenReg = "[a-zA-Z0-9!@#$%^&*]{10,}";
		String engReg = "[a-zA-Z]";
		String numReg = "[0-9]";
		String specReg = "[!@#$%^&*]";
		int has = 0;
		
		if(Pattern.matches(lenReg, pwnew)) {
			has += Pattern.compile(engReg).matcher(pwnew).find() ? 1:0;
			has += Pattern.compile(numReg).matcher(pwnew).find() ? 1:0;
			has += Pattern.compile(specReg).matcher(pwnew).find() ? 1:0;
			if(has < 2) return "비밀번호 형식이 아닙니다.";
			else {
				//비밀번호 암호화
				
				dao.chagePw(id, bcryptPasswordEncoder.encode(pwnew));
				return "적합한 비밀번호입니다.";
			}
		}else {
			return "비밀번호 형식이 아닙니다.";
		}
		
	}

	public String deleteMember(String id, String pw, String useroutcheck) {
		
		if(id == null || id == "")
			return "로그인을 해주세요.";
		if(pw == null || pw == "")
			return "비밀번호를 입력해주세요.";
		MemberDTO result = dao.selectId(id);
		if(bcryptPasswordEncoder.matches(pw,result.getU_pw()) == false)
			return "비밀번호가 일치하지 않습니다.";
		if(useroutcheck == null || useroutcheck == "")
			return "회원탈퇴 사유를 정해주세요.";
					
		dao.deleteMember(id);
		return "회원탈퇴 완료";
	}
	
	// 예매 내역
	public ArrayList<BookingDTO> YMList(int num) {
		ArrayList<BookingDTO> list = dao.YMList(num);
		
		for(BookingDTO b : list) {
			System.out.println(b.toString());
			MovieDTO mInfo = dao.mInfo(b.getM_num());
			CinemaDTO cInfo = dao.cInfo(b.getC_num());
			RunningDTO rInfo = dao.rInfo(b.getR_num());
			ScreenDTO sInfo = dao.sInfo(b.getS_num());
			if(mInfo != null) {
				b.setM_name(mInfo.getM_name());
				b.setM_poster(mInfo.getM_poster());
			}
			if(cInfo != null)
				b.setC_name(cInfo.getC_name());
			if(rInfo != null)
				b.setR_date(rInfo.getR_date());
			if(sInfo != null)
				b.setS_name(sInfo.getS_name());
		}
		return list;
	}
	
	// 취소 내역
	public ArrayList<BookingDTO> cList(int num) {
		int unum = (int)session.getAttribute("loginNum");
		ArrayList<BookingDTO> list = dao.cList(unum);
		
		for(BookingDTO b : list) {
			System.out.println(b.toString());
			MovieDTO mInfo = dao.mInfo(b.getM_num());
			CinemaDTO cInfo = dao.cInfo(b.getC_num());
			if(mInfo != null) {
				System.out.println(mInfo.toString());
				b.setM_name(mInfo.getM_name());
				b.setM_poster(mInfo.getM_poster());
				System.out.println("추가 후: " + b.toString());
			}
			if(cInfo != null) {
				System.out.println(cInfo.toString());
				b.setC_name(cInfo.getC_name());
				System.out.println("추가 후: " + b.toString());
			}
		}
		return list;
	}	
	
	public String makeResult(ArrayList<BookingDTO> booking) {
		String a = "";
		if(booking == null) {
			a += "<tr><td colspan=\"5\" class=\"a-c\">조회된 내역이 없습니다.</td></tr>";
		}else {
			for(BookingDTO b : booking) {
				a += "<tr>	\r\n" + 
						"					<td>"
				+ b.getB_date(); 
				a += "</td>	\r\n" + 
						"					<th>";
				if(b.getB_condition().equals("c")) {
					a += "<span>취소</span>";
				}else {
					a += "<span>구매</span>";
				}
				a += "</th>	\r\n" + 
						"					<td>" +
				b.getC_name();
				a += "</td>	\r\n" + 
						"					<td>		\r\n" + 
						"					<span class=\"font-red\">" +
				b.getB_fee();
				a += "원</span>	\r\n" + 
						"					</td>\r\n" + 
						"					<td>1</td>\r\n" + 
						"				</tr>\r\n";
			}
		}
		
		return a;
	}

	public String cancelBooking(int b_num) {
		int chk = dao.cancelBooking(b_num);
		if(chk == 1) {
			BookingDTO dto = dao.rNumAndBCnt(b_num);
			System.out.println("출력: " + dto.toString());
			int flag = dao.updateCnt(dto);
			if(flag == 1)
				return "예매 취소 성공";
			else
				return "예매 취소 실패";
		}
		else
			return "예매 취소 실패";
	}
	
	// 회원 수정
	public String modifyUserInfo(MemberDTO member) {
		String sessionId = (String) session.getAttribute("loginId");
		System.out.println("서비스까지 넘어왔나");
		System.out.println("sessionId : " + sessionId);
		System.out.println("tel : " + member.getU_tel());
		System.out.println("email : " + member.getU_email());
		System.out.println("m_agree : " + member.getU_m_agree());
		if(sessionId == null || sessionId == "")
			return "로그인 후 수정해주세요.";
		if(member.getU_email() == null || member.getU_tel() == "")
			return "이메일을 입력해주세요.";
		if(member.getU_m_agree() == null || member.getU_m_agree() == "")
			member.setU_m_agree("disagree");
		member.setU_id(sessionId);
		int result = dao.modifyUserInfo(member);
		if(result == 1)
			System.out.println("mapper는 문제 없음");
		
		session.removeAttribute("tel");
		session.setAttribute("tel", member.getU_tel());
		return "회원정보 수정 완료";
	}

	public ArrayList<InquiryDTO> IQList(int num) {
		return dao.IQList(num);
	}

	public InquiryDTO detailIQ(int i_num) {
		return dao.detailIQ(i_num);
	}

	public String optionBuyList(String radPurc, String startDate, String endDate) {
		Integer uNum = (Integer)session.getAttribute("loginNum");
		System.out.println("uNum : " + uNum);
		
		ArrayList<BookingDTO> result;
		if(startDate == null && endDate == null) {
	         result = dao.AllListWithinMonth();
	         System.out.println("AllListWithinMonth 결과: " + result);
	      }else if(radPurc.equals("A")) {
	         result = dao.AllList(uNum, startDate, endDate);
	      }else if(radPurc.equals("P")) {
	         result = dao.GMOptionList(uNum, startDate, endDate);
	      }else {
	         result = dao.CCOptionList(uNum, startDate, endDate);
	      }
		return makeResult(result);
	}

	public ArrayList<LikeDTO> lList(int unum) {
		ArrayList<LikeDTO> list = dao.lList(unum);
		
		for(LikeDTO l : list) {
			MovieDTO mInfo = dao.mInfo(l.getL_num());
			if(mInfo != null) {
				l.setM_name(mInfo.getM_name());
				l.setM_age(mInfo.getM_age());
				l.setM_poster(mInfo.getM_poster());
				l.setM_like(mInfo.getM_like());
				l.setM_date(mInfo.getM_date());
				l.setM_director(mInfo.getM_director());
				l.setM_r_time(mInfo.getM_r_time());
				l.setM_type(mInfo.getM_type());
				System.out.println("좋아요 수  : " + l.getM_like());
			}
		}
		
		return list;
	}

	public ArrayList<BookingDTO> watchedmovie(int unum) {
		ArrayList<BookingDTO> list = dao.alreadySaw(unum);
		
		for(BookingDTO b : list) {
			RunningDTO rInfo = dao.rInfo(b.getR_num());
			MovieDTO mInfo = dao.mInfo(b.getM_num());
			CinemaDTO cInfo = dao.cInfo(b.getC_num());
			ScreenDTO sInfo = dao.sInfo(b.getS_num());			
			if(mInfo != null) {
				b.setM_name(mInfo.getM_name());
				b.setM_poster(mInfo.getM_poster());
			}
			if(cInfo != null)
				b.setC_name(cInfo.getC_name());
			if(rInfo != null)
				b.setR_date(rInfo.getR_date());
			if(sInfo != null)
				b.setS_name(sInfo.getS_name());
			b.setFull_booking_date(rInfo.getR_date() + " " + b.getB_end());
			System.out.println("영화일시 : " + b.getFull_booking_date());
		}
		
		return list;
	}

	public ArrayList<PostDTO> postList(int unum) {
		ArrayList<PostDTO> list = dao.PostList(unum);
		
		for(PostDTO p : list) {
			MovieDTO mInfo = dao.mInfo(p.getM_num());
			if(mInfo != null) {
				p.setM_name(mInfo.getM_name());
			}
		}
		return list;
	}

	public void unlikeMovie(int m_num, int unum) {
		System.out.println("영화 번호 서비스까지도 잘 넘어온다. : " + m_num);
		dao.unlikeMovie(m_num, unum);
		MovieDTO mInfo = dao.mInfo(m_num);
		dao.minusLike(mInfo.getM_name());
	}

}
