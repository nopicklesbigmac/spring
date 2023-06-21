package com.test.root;


public class MovieService {
	
	public void urlstr(MovieDTO movie) {
		String[] strArr = movie.getM_trailer().split("=");
		movie.setM_trailer(strArr[1]);
		System.err.println( movie.getM_trailer());

	}
}
