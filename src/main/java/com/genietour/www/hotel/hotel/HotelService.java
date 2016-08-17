package com.genietour.www.hotel.hotel;

import java.util.List;

import com.genietour.www.hotel.hotelroomres.HotelRoomResDTO;

public interface HotelService {
	
	public int insertHotel(HotelDTO hotel);
	public List<HotelDTO> selectListAll();
	public List<HotelDTO> selectListByCity(HotelDTO hotel);
	public List<HotelDTO> selectListByHotName(HotelDTO hotel);
	public HotelDTO selectHotelByHotCode(HotelDTO hotel);
	public int updateHotel(HotelDTO hotel);
	public int deleteHotel(HotelDTO hotel);
	public List<HotelDTO> selectListByDate(HotelRoomResDTO hotelRoomRes);
	public int countHotel();
	//마지막 호텔코드번호
		public int selectMaxHotCode();
		public int selectNextHotCode();
}
