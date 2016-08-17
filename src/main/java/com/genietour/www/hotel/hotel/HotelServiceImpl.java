package com.genietour.www.hotel.hotel;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.genietour.www.hotel.hotelroom.HotelRoomDTO;
import com.genietour.www.hotel.hotelroomres.HotelRoomResDTO;
import com.genietour.www.mapper.HotelMapper;

@Service
public class HotelServiceImpl implements HotelService{
	private static final Logger logger = LoggerFactory.getLogger(HotelService.class);
	
	@Autowired	SqlSession session;
	
	private HotelMapper getMapper() {
		return session.getMapper(HotelMapper.class);
	}

	@Override
	public int insertHotel(HotelDTO hotel) {
		logger.info("----HotelService : insertHotel()----");
		return this.getMapper().insertHotel(hotel);
	}

	@Override
	public List<HotelDTO> selectListAll() {
		logger.info("----HotelService : selectListAll()----");
		return this.getMapper().selectListAll();
	}

	@Override
	public List<HotelDTO> selectListByHotName(HotelDTO hotel) {
		logger.info("----HotelService : selectListByHotName()----");
		return this.getMapper().selectListByHotName(hotel);
	}

	@Override
	public HotelDTO selectHotelByHotCode(HotelDTO hotel) {
		logger.info("----HotelService : selectHotelByHotCode()----");
		return this.getMapper().selectHotelByHotCode(hotel);
	}

	/*@Override
	public List<HotelDTO> getByOptions(String options) {
		logger.info("----HotelService : getByOptions()----");
		HotelMapper this.getMapper() = session.getMapper(HotelMapper.class);
		return this.getMapper().selectByOptions(options);
	}*/

	@Override
	public int countHotel() {
		logger.info("----HotelService : countHotel()----");
		return this.getMapper().countHotel();
	}

	@Override
	public int updateHotel(HotelDTO hotel) {
		logger.info("----HotelService : updateHotel()----");
		return this.getMapper().updateHotel(hotel);
	}

	@Override
	public int deleteHotel(HotelDTO hotel) {
		logger.info("----HotelService : deleteHotel()----");
		return this.getMapper().deleteHotel(hotel);
	}

	@Override
	public int selectMaxHotCode() {
		
		logger.info("----HotelService : selectMaxHotCode()----");
		return this.getMapper().selectMaxHotCode();
	}

	@Override
	public int selectNextHotCode() {
		logger.info("----HotelService : selectNextHotCode()----");
		return this.selectMaxHotCode()+1;
		
	}

	@Override
	public List<HotelDTO> selectListByCity(HotelDTO hotel) {
		logger.info("----HotelService : selectListByCity()----");
		return this.getMapper().selectListByCity(hotel);
	}
	
	@Override
	public List<HotelDTO> selectListByDate(HotelRoomResDTO hotelRoomRes){
		logger.info("----HotelRoomService : selectListByDate()----");
		return this.getMapper().selectListByDate(hotelRoomRes);
	}

}
