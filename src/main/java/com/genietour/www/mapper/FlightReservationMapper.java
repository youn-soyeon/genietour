package com.genietour.www.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.genietour.www.flight.flightreservation.FlightReservationDTO;

@Repository
public interface FlightReservationMapper {
	public int insertFlightReservaion(FlightReservationDTO fliRes);
	public int insertFlightReservaionWithNoCode(FlightReservationDTO fliRes);
	
	public List<FlightReservationDTO> selectListAll();
	public List<FlightReservationDTO> selectListByResDate(FlightReservationDTO fliRes);
	public List<FlightReservationDTO> selectListByKorName(FlightReservationDTO fliRes);
	public List<FlightReservationDTO> selectListByMemId(FlightReservationDTO fliRes);
	public int countFlgihtReservaion();
	/*public int countIdByReservation(FlightReservationDTO fliRes);*/
	
	public int updateMember(FlightReservationDTO fliRes);
	public int updateAdmin(FlightReservationDTO fliRes);
	public int updateVacancy(FlightReservationDTO fliRes);
	
	public int deleteFlightReservation(FlightReservationDTO fliRes);
	public int countFlightReservationByMemId(String memId);

}
