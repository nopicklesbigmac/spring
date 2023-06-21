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
 
	MemberDTO selectId(String id); // ȸ�� id�� ���� ��ȸ

	void chagePw(@Param("id")String id, @Param("pwnew")String pwnew); // ��й�ȣ ����

	void deleteMember(String id); //ȸ�� id�� ȸ������
	
	MovieDTO mInfo(int mNum);
	
	CinemaDTO cInfo(int c_num);
	
	RunningDTO rInfo(Integer r_num);
	
	ScreenDTO sInfo(Integer s_num);

	ArrayList<BookingDTO> YMList(int unum); // ���� ����
	
	ArrayList<BookingDTO> cList(int num); // ��� ����

	BookingDTO selectBooking(int b_num); // ���� ������ ��������

	int cancelBooking(int num); 
	
	BookingDTO rNumAndBCnt(int num);
	
	int updateCnt(BookingDTO dto);
	 
	void deleteBooking(int b_num); // ���� ���̺��� ���� ���� ����

	ArrayList<BookingDTO> GMOptionList(@Param("uNum") int uNum, @Param("start")String startDate, @Param("end")String endDate); // ���� ���� ��¥�� ��ȸ

	ArrayList<BookingDTO> CCOptionList(@Param("uNum") int uNum, @Param("start")String startDate, @Param("end")String endDate); // ���� ���� ��¥�� ��ȸ

	ArrayList<BookingDTO> AllList(@Param("uNum") int uNum, @Param("start")String startDate, @Param("end")String endDate);

	int modifyUserInfo(MemberDTO member); // ȸ�� ���� ����

	void makeInquiry(InquiryDTO inquiry); // ���Ǳ� �ۼ�

	ArrayList<InquiryDTO> IQList(int num); // ���� ���� ��ȸ

	InquiryDTO detailIQ(int i_num); // ���� ���� ��ȸ

	ArrayList<BookingDTO> AllListWithinMonth();

	ArrayList<LikeDTO> lList(int unum); // ����;�(���ƿ�)

	ArrayList<PostDTO> PostList(int unum); // ��������Ʈ

	void unlikeMovie(@Param("m_num")int m_num, @Param("unum")int unum); // ���ƿ� ���

	void minusLike(String m_name); // ���ƿ� �� ����

	int likenum(int unum); // ȸ���� ���� ���ƿ� ��

	int postnum(String id); // ȸ���� �ۼ��� ����Ʈ ��

	ArrayList<BookingDTO> alreadySaw(int unum);

}