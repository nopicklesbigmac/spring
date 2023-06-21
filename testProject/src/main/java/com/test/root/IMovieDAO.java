package com.test.root;

import java.util.List;

public interface IMovieDAO {
	

	MovieDTO selectMovieNo(int rpstMovieNo);
	
	List<MovieDTO> selectall();
	
}
