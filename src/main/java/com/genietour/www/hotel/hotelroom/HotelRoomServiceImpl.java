package com.genietour.www.hotel.hotelroom;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.genietour.www.hotel.hotel.HotelDTO;
import com.genietour.www.hotel.hotel.HotelService;
import com.genietour.www.hotel.hotelroomres.HotelRoomResDTO;
import com.genietour.www.hotel.room.RoomDTO;
import com.genietour.www.hotel.room.RoomService;
import com.genietour.www.mapper.HotelRoomMapper;

@Service
public class HotelRoomServiceImpl implements HotelRoomService {
	private static final Logger logger = LoggerFactory
			.getLogger(HotelService.class);

	@Autowired SqlSession session;
	@Autowired HotelService	hotelService;
	@Autowired RoomService	roomService;
	

	private HotelRoomMapper getMapper() {
		return session.getMapper(HotelRoomMapper.class);
	}

	@Override
	public List<HotelRoomDTO> selectListAll() {
		logger.info("----HotelRoomService : selectListAll()----");
		return this.getMapper().selectListAll();
	}

	@Override
	public HotelRoomDTO selectHotelRoomByRoomCode(HotelRoomDTO hotelRoom) {
		logger.info("----HotelRoomService : selectHotelRoomByRoomCode()----");
		return this.getMapper().selectHotelRoomByRoomCode(hotelRoom);
	}

	@Override
	public List<HotelRoomDTO> selectListByRoomType(HotelRoomDTO hotelRoom) {
		logger.info("----HotelRoomService : selectListByRoomType()----");
		return this.getMapper().selectListByRoomType(hotelRoom);
	}

	@Override
	public List<HotelRoomDTO> selectListByPrice(HotelRoomDTO hotelRoom) {
		logger.info("----HotelRoomService : selectListByPrice()----");
		return this.getMapper().selectListByPrice(hotelRoom);
	}

	@Override
	public List<HotelRoomDTO> selectListByVacancy(HotelRoomDTO hotelRoom) {
		logger.info("----HotelRoomService : selectListByVacancy()----");
		return this.getMapper().selectListByVacancy(hotelRoom);
	}

	@Override
	public List<HotelRoomDTO> selectListByCity(HotelRoomDTO hotelRoom) {
		logger.info("----HotelRoomService : selectListByCity()----");
		return this.getMapper().selectListByCity(hotelRoom);
	}

	@Override
	public List<HotelRoomDTO> selectListByOptions(HotelRoomDTO hotelRoom) {
		logger.info("----HotelRoomService : selectListByOptions()----");
		return this.getMapper().selectListByOptions(hotelRoom);
	}
	
	@Override
	public List<HotelRoomDTO> selectListByHotCode(HotelRoomDTO hotelRoom) {
		logger.info("----HotelRoomService : selectListByHotCode()----");
		return this.getMapper().selectListByHotCode(hotelRoom);
	}

	@Override
	public List<HotelRoomDTO> selectListByAll(HotelRoomResDTO hotelRoomRes) {
		logger.info("----HotelRoomService : selectListByAll()----");
		return this.getMapper().selectListByAll(hotelRoomRes);
	}
	
	@Override
	public List<HotelRoomDTO> selectListByHotCodeAndAll(HotelRoomResDTO hotelRoomRes) {
		logger.info("----HotelRoomService : selectListByHotCodeAndAll()----");
		return this.getMapper().selectListByHotCodeAndAll(hotelRoomRes);
	}
	
	@Override
	public List<HotelRoomDTO> selectListByInnerDate(HotelRoomResDTO hotelRoomRes) {
		logger.info("----HotelRoomService : selectListByInnerDate()----");
		return this.getMapper().selectListByInnerDate(hotelRoomRes);
	}
	
	@Override
	public HotelRoomDTO selectHotelRoomByRoomType(HotelRoomDTO hotelRoom) {
		logger.info("----HotelRoomService : selectHotelRoomByRoomType()----");
		return this.getMapper().selectHotelRoomByRoomType(hotelRoom);
	}


	/*public int insertHotelRoom(HotelDTO hotel, RoomDTO[] rooms) {
		hotelService.insertHotel(hotel);
		for( RoomDTO room : rooms) {
			roomService.insertRoom(room);
		}		
		return 0;
	}*/
	
	@Override	
	public int insertHotelRoom(HotelRoomDTO hotelRoom) {
		HotelDTO	hotel	= new HotelDTO();
		RoomDTO		room	= new RoomDTO();
		int result;
		hotel.setAddress(hotelRoom.getAddress());
		hotel.setCity(hotelRoom.getCity());
		hotel.setCountry(hotelRoom.getCountry());
		hotel.setHomepage(hotelRoom.getHomepage());
		hotel.setHotCode(hotelRoom.getHotCode());
		hotel.setHotName(hotelRoom.getHotName());
		hotel.setOptions(hotelRoom.getOptions());
		hotel.setTel(hotelRoom.getTel());		  
		int result1 = hotelService.insertHotel(hotel);
		
		room.setHotCode(hotelRoom.getHotCode());
		room.setPrice(hotelRoom.getPrice());
		room.setRoomCode(hotelRoom.getRoomCode());
		room.setRoomType(hotelRoom.getRoomType());
		room.setVacancy(hotelRoom.getVacancy());		
		int result2 = roomService.insertRoom(room);
		
		if(result1+result2==2){
			result=1;
		}else{
			result=0;
		}
		return result;
	}

	@Override
	public int deleteHotelRoom(HotelRoomDTO hotelRoom) {
		HotelDTO	hotel	= new HotelDTO();
		RoomDTO		room	= new RoomDTO();
		int result;
		hotel.setAddress(hotelRoom.getAddress());
		hotel.setCity(hotelRoom.getCity());
		hotel.setCountry(hotelRoom.getCountry());
		hotel.setHomepage(hotelRoom.getHomepage());
		hotel.setHotCode(hotelRoom.getHotCode());
		hotel.setHotName(hotelRoom.getHotName());
		hotel.setOptions(hotelRoom.getOptions());
		hotel.setTel(hotelRoom.getTel());		  
		int result1 = hotelService.deleteHotel(hotel);
		
		room.setHotCode(hotelRoom.getHotCode());
		room.setPrice(hotelRoom.getPrice());
		room.setRoomCode(hotelRoom.getRoomCode());
		room.setRoomType(hotelRoom.getRoomType());
		room.setVacancy(hotelRoom.getVacancy());		
		int result2 = roomService.deleteRoom(room);
		
		if(result1+result2==2){
			result=1;
		}else{
			result=0;
		}
		return result;
	}

	@Override
	public int countHotelRoom() {
		logger.info("----HotelRoomService : selectListByHotCode()----");
		return this.getMapper().countAll();
	}

	
	

	

}
