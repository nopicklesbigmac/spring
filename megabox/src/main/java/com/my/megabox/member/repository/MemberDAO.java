package com.my.megabox.member.repository;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.my.megabox.booking.dto.BookingDTO;
import com.my.megabox.cinema.dto.CinemaDTO;
import com.my.megabox.member.dto.InquiryDTO;
import com.my.megabox.member.dto.MemberDTO;
import com.my.megabox.movie.dto.LikeDTO;
import com.my.megabox.movie.dto.MovieDTO;
import com.my.megabox.movie.dto.PostDTO;
import com.my.megabox.movie.dto.RunningDTO;
import com.my.megabox.movie.dto.ScreenDTO;

@Repository
public interface MemberDAO {
 
	MemberDTO selectId(String id); // 회원 id로 정보 조회

	void chagePw(@Param("id")String id, @Param("pwnew")String pwnew); // 비밀번호 변경

	void deleteMember(String id); //회원 id로 회원삭제
	
	MovieDTO mInfo(int mNum);
	
	CinemaDTO cInfo(int c_num);
	
	RunningDTO rInfo(Integer r_num);
	
	ScreenDTO sInfo(Integer s_num);

	ArrayList<BookingDTO> YMList(int unum); // 예매 내역
	
	ArrayList<BookingDTO> cList(int num); // 취소 내역

	BookingDTO selectBooking(int b_num); // 예매 데이터 가져오기

	int cancelBooking(int num); 
	
	BookingDTO rNumAndBCnt(int num);
	
	int updateCnt(BookingDTO dto);
	 
	void deleteBooking(int b_num); // 예매 테이블에서 예매 내역 삭제

	ArrayList<BookingDTO> GMOptionList(@Param("uNum") int uNum, @Param("start")String startDate, @Param("end")String endDate); // 구매 내역 날짜별 조회

	ArrayList<BookingDTO> CCOptionList(@Param("uNum") int uNum, @Param("start")String startDate, @Param("end")String endDate); // 예매 내역 날짜별 조회

	ArrayList<BookingDTO> AllList(@Param("uNum") int uNum, @Param("start")String startDate, @Param("end")String endDate);

	int modifyUserInfo(MemberDTO member); // 회원 정보 수정

	void makeInquiry(InquiryDTO inquiry); // 문의글 작성

	ArrayList<InquiryDTO> IQList(int num); // 문의 내역 조회

	InquiryDTO detailIQ(int i_num); // 문의 내용 조회

	ArrayList<BookingDTO> AllListWithinMonth();

	ArrayList<LikeDTO> lList(int unum); // 보고싶어(좋아요)

	ArrayList<PostDTO> PostList(int unum); // 무비포스트

	void unlikeMovie(@Param("m_num")int m_num, @Param("unum")int unum); // 좋아요 취소

	void minusLike(String m_name); // 좋아요 수 감소

	int likenum(int unum); // 회원이 누른 좋아요 수

	int postnum(String id); // 회원이 작성한 포스트 수

	ArrayList<BookingDTO> alreadySaw(int unum);

}