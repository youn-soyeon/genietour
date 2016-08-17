package com.genietour.www.flight.flightseat;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.genietour.www.flight.flight.FlightDTO;
import com.genietour.www.flight.flight.FlightService;
import com.genietour.www.flight.seat.SeatDTO;
import com.genietour.www.flight.flightseat.FlightSeatDTO;
import com.genietour.www.flight.seat.SeatService;
import com.genietour.www.mapper.FlightSeatMapper;

@Service
public class FlighSeatServiceImpl implements FlightSeatService {
	private static final Logger logger = LoggerFactory.getLogger(FlighSeatServiceImpl.class);
	@Autowired SqlSession session;
	@Autowired FlightService	flightService;
	@Autowired SeatService		seatService;
	
	
	private FlightSeatMapper getMapper() {
		return session.getMapper(FlightSeatMapper.class);
	}

	@Override
	public List<FlightSeatDTO> selectListAll() {
		logger.info("FlightSeatService : selectListAll() 진입");
		
		return this.getMapper().selectListAll();
	}
	
	@Override
	public List<FlightSeatDTO> selectListSearchFlight(FlightSeatDTO fliSeat) {
		logger.info("FlightSeatService : selectListSearchFlight() 진입");
		
		return this.getMapper().selectListSearchFlight(fliSeat);
	}

	@Override
	public FlightSeatDTO selectSearchVacancy(FlightSeatDTO fliSeat) {
		logger.info("FlightSeatService : selectSearchVacancy() 진입");
		
		return this.getMapper().selectSearchVacancy(fliSeat);
	}

	
	
	
	@Override
	public int selectMaxFliCode() {
		logger.info("FlightSeatService : selectMaxFliCode() 진입");
		return flightService.selectMaxFliCode()+1;
	}

	@Override
	public int selectNextFliCode() {
		return selectMaxFliCode() + 1;
	}

	

	@Override
	public int insertFlightSeat(FlightDTO flight, SeatDTO ... seats) {
		int fliCode = flightService.selectNextFliCode();
		flight.setFliCode(fliCode);
		
		flightService.insertFlight(flight);
		
		for( SeatDTO seat: seats ) {
			seat.setFliCode(fliCode);
			seatService.insertSeat(seat);
		}
		return 1;
	}

	@Override
	public int deleteFlightSeat(FlightDTO flight) {
		SeatDTO temp = new SeatDTO();
		temp.setFliCode(flight.getFliCode());
		
		List<SeatDTO> list = seatService.selectListByFliCode(temp);
		
		for( SeatDTO seat : list ) {
			seatService.deleteSeat(seat);
		}
		flightService.deleteFlight(flight);
		return 1;
	}

	@Override
	public int countFlightSeatAll() {
		logger.info("flightSeatServiceImpl : countFlightSeatAll() 진입");
		return this.getMapper().countFlightSeatAll();
	}

		
}
