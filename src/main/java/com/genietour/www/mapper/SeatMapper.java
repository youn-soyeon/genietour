package com.genietour.www.mapper;

import java.util.List;

import com.genietour.www.flight.flightreservation.FlightReservationDTO;
import com.genietour.www.flight.seat.SeatDTO;

public interface SeatMapper {
	public int insertSeat(SeatDTO seat);
	public List<SeatDTO> selectListAll();
	public SeatDTO selectSeatBySeatCode(SeatDTO seat);
	public int countSeat();
	public int updateSeat(SeatDTO seat);
	public int updateVacancy(FlightReservationDTO fliRes);
	public int deleteSeat(SeatDTO seat);
	
	
	
	
	public List<SeatDTO> selectListByFliCode(SeatDTO seat);
}
