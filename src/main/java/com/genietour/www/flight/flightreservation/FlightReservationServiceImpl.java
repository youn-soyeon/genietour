package com.genietour.www.flight.flightreservation;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.genietour.www.mapper.FlightReservationMapper;


@Service
public class FlightReservationServiceImpl implements FlightReservationService {
	private static final Logger logger = LoggerFactory.getLogger(FlightReservationServiceImpl.class);
	@Autowired SqlSession session;
	@Autowired FlightReservationDTO flightReservation;
	
	private FlightReservationMapper getMapper() {
		return session.getMapper(FlightReservationMapper.class);
	}
	
	@Override
	public int insertFlightReservaion(FlightReservationDTO flightReservation) {
		logger.info("===== insertFlightReservaion() =====");
		return this.getMapper().insertFlightReservaion(flightReservation);
	}

	@Override
	public int insertFlightReservaionWithNoCode(FlightReservationDTO flightReservation) {
		logger.info("===== insertFlightReservaion() =====");
		return this.getMapper().insertFlightReservaionWithNoCode(flightReservation);
	}
	
	@Override
	public List<FlightReservationDTO> selectListAll() {
		logger.info("===== selectListAll() =====");
		return this.getMapper().selectListAll();
	}

	@Override
	public List<FlightReservationDTO> selectListByResDate(FlightReservationDTO fliRes) {
		logger.info("===== selectListByResDate() =====");
		
		return this.getMapper().selectListByResDate(fliRes);
	}

	@Override
	public List<FlightReservationDTO> selectListByKorName(FlightReservationDTO fliRes) {
		logger.info("===== selectListByKorName() =====");
		
		return this.getMapper().selectListByKorName(fliRes);
	}

	@Override
	public int countFlgihtReservaion() {
		logger.info("===== countFlgihtReservaion() 진입 =====");
		int result = this.getMapper().countFlgihtReservaion();
		logger.info("countFlgihtReservaion 결과 : {}", result);
		
		return this.getMapper().countFlgihtReservaion();
	}

	@Override
	public List<FlightReservationDTO> selectListByMemId(FlightReservationDTO fliRes) {
		logger.info("===== selectListByMemId() =====");
		
		return this.getMapper().selectListByMemId(fliRes);
	}
/*
	@Override
	public int countIdByReservation(FlightReservationDTO fliRes) {
		logger.info("===== countIdByReservation() =====");
		
		return this.getMapper().countIdByReservation(fliRes);
	}
*/
	@Override
	public int updateMember(FlightReservationDTO fliRes) {
		logger.info("===== updateMember() =====");
		
		return this.getMapper().updateMember(fliRes);
	}
	
	@Override
	public int updateAdmin(FlightReservationDTO fliRes) {
		logger.info("===== updateAdmin() =====");
		
		return this.getMapper().updateAdmin(fliRes);
	}

	@Override
	public int updateVacancy(FlightReservationDTO fliRes) {
		logger.info("FlightReservationService : updateVacancy() 진입");
		return this.getMapper().updateVacancy(fliRes);
	}

	@Override
	public int deleteFlightReservation(FlightReservationDTO fliRes) {
		logger.info("===== deleteFlgihtReservation() =====");
		
		return this.getMapper().deleteFlightReservation(fliRes);
	}

	@Override
	public int countFlightReservationByMemId(String memId) {
		logger.info("FlightReservationService: countFlightReservationByMemId");
		return this.getMapper().countFlightReservationByMemId(memId);
	}

}
