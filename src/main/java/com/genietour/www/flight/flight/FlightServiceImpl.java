package com.genietour.www.flight.flight;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.genietour.www.mapper.FlightMapper;

@Service
public class FlightServiceImpl implements FlightService {
	private static final Logger logger = LoggerFactory.getLogger(FlightServiceImpl.class);
	@Autowired FlightDTO flight;
	@Autowired SqlSession session;
	
	private FlightMapper getMapper() {
		return session.getMapper(FlightMapper.class);
	}
	
	@Override
	public int insertFlight(FlightDTO flight) {
		logger.info("FlightService : insertFlight() 진입");
		
		return this.getMapper().insertFlight(flight);
	}

	@Override
	public List<FlightDTO> selectListAll() {
		logger.info("FlightService : selectListAll() 진입");
		
		return this.getMapper().selectListAll();
	}

	@Override
	public FlightDTO selectFlightByFliCode(FlightDTO flight) {
		logger.info("FlightService : selectFlightByFliCode() 진입");
		
		return this.getMapper().selectFlightByFliCode(flight);
	}

	@Override
	public List<FlightDTO> selectListByAirline(FlightDTO flight) {
		logger.info("FlightService : selectListByAirline() 진입");
		
		return this.getMapper().selectListByAirline(flight);
	}

	@Override
	public List<FlightDTO> selectListDepCity() {
		logger.info("FlightService : selectListDepCity() 진입, {}", this.getMapper().selectListDepCity().get(0).getDepCity());
		
		return this.getMapper().selectListDepCity();
	}

	@Override
	public List<FlightDTO> selectListDepByArrCity(FlightDTO flight) {
		logger.info("FlightService : selectListDepByArrCity() 진입");
		logger.info(">> arrCity, {}", this.getMapper().selectListDepByArrCity(flight).get(0).getArrCity());
		
		return this.getMapper().selectListDepByArrCity(flight);
	}
	
	@Override
	public int countFlight() {
		logger.info("FlightService : countFlight() 진입");
		
		return this.getMapper().countFlight();
	}
	
	@Override
	public int updateFlight(FlightDTO flight) {
		logger.info("FlightService : updateFlight() 진입");
		
		return this.getMapper().updateFlight(flight);
	}
	
	@Override
	public int deleteFlight(FlightDTO flight) {
		logger.info("FlightService : deleteFlight() 진입");
		
		return this.getMapper().deleteFlight(flight);
	}

	@Override
	public int selectMaxFliCode() {
		logger.info("FlightService :selectMaxFliCode() 진입");
		return this.getMapper().selectMaxFliCode();
	}

	@Override
	public int selectNextFliCode() {
		logger.info("FlightService :nextFliCode() 진입");
		return this.selectMaxFliCode()+1;
	}

	@Override
	public List<FlightDTO> selectListArrCity() {
		logger.info("FlightService :selectListArrCity() 진입");
		return this.getMapper().selectListArrCity();
	}

	@Override
	public List<FlightDTO> selectListAirline() {
		logger.info("FlightService :selectListAirline() 진입");
		return this.getMapper().selectListAirline();
	}
	
}
