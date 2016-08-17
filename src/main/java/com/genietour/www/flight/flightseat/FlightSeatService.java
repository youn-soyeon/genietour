package com.genietour.www.flight.flightseat;

import java.util.List;

import com.genietour.www.flight.flight.FlightDTO;
import com.genietour.www.flight.seat.SeatDTO;

public interface FlightSeatService {
	public List<FlightSeatDTO> selectListAll();

	public int insertFlightSeat(FlightDTO flight, SeatDTO ... seats);

	public int deleteFlightSeat(FlightDTO flight);
	
	// 조건 검색 항공 리스트 조회
	public List<FlightSeatDTO> selectListSearchFlight(FlightSeatDTO fliSeat);

	// 조건 선택시 빈 좌석 수
	public FlightSeatDTO selectSearchVacancy(FlightSeatDTO fliSeat);
	
	
	public int selectMaxFliCode();
	public int selectNextFliCode();
	public int countFlightSeatAll();

	
}
