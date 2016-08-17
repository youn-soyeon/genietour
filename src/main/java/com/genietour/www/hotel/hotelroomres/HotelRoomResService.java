package com.genietour.www.hotel.hotelroomres;
import java.util.List;

import com.genietour.www.hotel.hotel.HotelDTO;
import com.genietour.www.hotel.room.RoomDTO;



public interface HotelRoomResService {
	
	public List<HotelRoomResDTO> selectListAll();
	public int insertHotelSeat(HotelDTO hotel, RoomDTO ... rooms);
	

	public int deleteHotelSeat(HotelDTO hotel);
	
	public int selectMaxHotCode();
	public int selectNextHotCode();
}
