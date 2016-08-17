package com.genietour.www.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.genietour.www.flight.flight.FlightDTO;

@Repository
public interface FlightMapper {
	public int insertFlight(FlightDTO flight);
	public List<FlightDTO> selectListAll();
	public FlightDTO selectFlightByFliCode(FlightDTO flight);
	public List<FlightDTO> selectListByAirline(FlightDTO flight);
	public List<FlightDTO> selectListAirline();
	public List<FlightDTO> selectListDepCity();
	public List<FlightDTO> selectListArrCity();
	public List<FlightDTO> selectListDepByArrCity(FlightDTO flight);
	public int countFlight();
	public int updateFlight(FlightDTO flight);
	public int deleteFlight(FlightDTO flight);
	
	public int selectMaxFliCode();
}
