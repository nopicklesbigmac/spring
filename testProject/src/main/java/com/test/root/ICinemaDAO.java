package com.test.root;

import java.util.List;

public interface ICinemaDAO {
	
	List<CinemaDTO> selectstate(String c_state);

	CinemaDTO selectbrchNo(int brchNo);
	
	List<FacilityDTO> facility(int brchNo);
	 
	List<FloorDTO> floor(int brchNo);
	
	List<CinemaDTO> selectall();
	
}
