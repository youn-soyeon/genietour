package com.genietour.www.hotel.hotelreservation;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.genietour.www.hotel.hotel.HotelService;
import com.genietour.www.mapper.HotelReservationMapper;

@Service
public class HotelReservationServiceImpl implements HotelReservationService{
private static final Logger logger = LoggerFactory.getLogger(HotelService.class);
	
	@Autowired	SqlSession session;

	private HotelReservationMapper getMapper(){
		return session.getMapper(HotelReservationMapper.class);
	}
	@Override
	public int insertHotelReservation(HotelReservationDTO hotelReservation) {
		logger.info("HotelReservationService : insertHotelReservation()진입 후 = {}");
		return this.getMapper().insertHotelReservation(hotelReservation);
	}

	@Override
	public int insertHotelReservationWithNoCode(HotelReservationDTO hotelReservation) {
		logger.info("HotelReservationService : insertHotelReservation()진입 후 = {}");
		return this.getMapper().insertHotelReservationWithNoCode(hotelReservation);
	}
	
	@Override
	public List<HotelReservationDTO> selectListAll() {
		logger.info("HotelReservationService : selectListAll()진입 후 = {}");
		return this.getMapper().selectListAll();
	}

	@Override
	public HotelReservationDTO selectHotelReservationByHotResCode(HotelReservationDTO hotelReservation) {
		logger.info("HotelReservationService : selectHotelReservationByHotResCode()진입 후 = {}");
		return this.getMapper().selectHotelReservationByHotResCode(hotelReservation);
	}

	@Override
	public List<HotelReservationDTO> selectListByMemId(HotelReservationDTO hotelReservation) {
		logger.info("HotelReservationService : selectListByMemId()진입 후 = {}");
		return this.getMapper().selectListByMemId(hotelReservation);
	}

	@Override
	public int countHotelReservation() {
		logger.info("HotelReservationService : countHotelReservation()진입 후 = {}");
		return this.getMapper().countHotelReservation();
	}

	@Override
	public int updateHotelReservation(HotelReservationDTO hotelReservation) {
		logger.info("HotelReservationService : updateHotelReservation()진입 후 = {}", hotelReservation.getHotResCode());
		return this.getMapper().updateHotelReservation(hotelReservation);
	}

	@Override
	public int deleteHotelReservation(HotelReservationDTO hotelReservation) {
		logger.info("HotelReservationService : deleteHotelReservation()진입 후 = {}");
		return this.getMapper().deleteHotelReservation(hotelReservation);
	}
	@Override
	public int countHotelReservationByMemId(String memId) {
		logger.info("HotelReservationService : countHotelReservationByMemId()진입");
		return this.getMapper().countHotelReservationByMemId(memId);
	}

}
