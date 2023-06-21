package com.my.megabox.movie.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.my.megabox.booking.dto.BookingDTO;
import com.my.megabox.movie.dto.CommentDTO;
import com.my.megabox.movie.dto.LikeDTO;
import com.my.megabox.movie.dto.MovieDTO;
import com.my.megabox.movie.dto.RunningDTO;
import com.my.megabox.movie.dto.ScreenDTO;
import com.my.megabox.movie.dto.PostDTO;
import com.my.megabox.movie.dto.ReplyDTO;
@Repository
public interface IMovieDAO {
	

	MovieDTO selectMovieNo(int rpstMovieNo);
	
	List<MovieDTO> selectall();

	List<PostDTO> selectpost();
	
	List<Integer> postrank1();
	List<Integer> postrank2();
	
	void writeProc(PostDTO post);

	List<MovieDTO> titleSearch(String m_name);
	
	List<RunningDTO> selectrun(@Param("c_num")int c_num,@Param("m_num") int m_num,@Param("r_date") String r_date);

	List<PostDTO> selectpostNum(int rpstMovieNo);

	List<CommentDTO> selectcomment(int rpstMovieNo);
	
	void likeAdd(LikeDTO dto);

	void upLike(int m_num);

	void downLike(int m_num);

	void likeCancel(LikeDTO dto);

	List<LikeDTO> like(@Param("u_num")int loginNum);

	void replyProc(ReplyDTO dto);

	void deletepost(PostDTO post);	
	
	PostDTO selectpost_d(@Param("p_num") int p_num);

	ScreenDTO selectScreen(int s_num);

	List<BookingDTO> bookinguser(int loginNum);

	MovieDTO selectbooking(Integer m_num);
	

	
}
