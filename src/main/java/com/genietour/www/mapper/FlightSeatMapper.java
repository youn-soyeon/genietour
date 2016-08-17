package com.genietour.www.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.genietour.www.flight.flightseat.FlightSeatDTO;

@Repository
public interface FlightSeatMapper {
	public List<FlightSeatDTO> selectListAll();
	public List<FlightSeatDTO> selectListSearchFlight(FlightSeatDTO fliSeat);
	public FlightSeatDTO selectSearchVacancy(FlightSeatDTO fliSeat);
	
	/*public int insertFlightSeat(FlightDTO flight, SeatDTO[] seats);

	public int deleteFlightSeat(FlightDTO flight, SeatDTO[] seats);*/
	
	public int countFlightSeatAll();
}
