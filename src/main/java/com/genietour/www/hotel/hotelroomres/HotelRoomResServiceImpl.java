package com.genietour.www.hotel.hotelroomres;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.genietour.www.flight.flightreservation.FlightReservationDTO;
import com.genietour.www.hotel.hotel.HotelDTO;
import com.genietour.www.hotel.hotel.HotelService;
import com.genietour.www.hotel.room.RoomDTO;
import com.genietour.www.hotel.room.RoomService;
import com.genietour.www.mapper.HotelRoomResMapper;

@Service
public class HotelRoomResServiceImpl implements HotelRoomResService {
	private static final Logger logger = LoggerFactory.getLogger(HotelRoomResServiceImpl.class);
	@Autowired SqlSession session;
	@Autowired HotelService	    hotelService;
	@Autowired RoomService		roomService;
	@Autowired HotelRoomResDTO hotelRoomRes;
	
	
	private HotelRoomResMapper getMapper() {
		return session.getMapper(HotelRoomResMapper.class);
	}
	
	@Override
	public int insertHotelSeat(HotelDTO hotel, RoomDTO... rooms) {
		int hotCode = hotelService.selectNextHotCode();
		hotel.setHotCode(hotCode);
		
		hotelService.insertHotel(hotel);
		
		for( RoomDTO room: rooms ) {
			room.setHotCode(hotCode);
			roomService.insertRoom(room);
		}
		return 1;
	}

	@Override
	public int deleteHotelSeat(HotelDTO hotel) {
		RoomDTO temp = new RoomDTO();
		temp.setHotCode(hotel.getHotCode());
		
		List<RoomDTO> list = roomService.selectListByHotCode(temp);
		
		for( RoomDTO room : list ) {
			roomService.deleteRoom(room);
		}
		hotelService.deleteHotel(hotel);
		return 1;
	}

	@Override
	public int selectMaxHotCode() {
		logger.info("HotelroomResService : selectMaxHotCode() 진입");
		return hotelService.selectMaxHotCode()+1;
	
	}

	@Override
	public int selectNextHotCode() {
		
		return selectMaxHotCode()+1;
	}

	@Override
	public List<HotelRoomResDTO> selectListAll() {
		logger.info("===== selectListAll() =====");
		List<HotelRoomResDTO> list =  this.getMapper().selectListAll();
		return list;
	}

}
