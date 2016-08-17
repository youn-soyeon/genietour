package com.genietour.www.flight.seat;

import java.util.List;



public interface SeatService {
	public int insertSeat(SeatDTO seat);

	public List<SeatDTO> selectListAll();
	public SeatDTO selectSeatBySeatCode(SeatDTO seat);
	
	public int updateSeat(SeatDTO seat);
	public int deleteSeat(SeatDTO seat);

	public int countSeat();

	public List<SeatDTO> selectListByFliCode(SeatDTO seat);
	
}
