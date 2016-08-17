package com.genietour.www.hotel.hotelroom;

import java.util.List;

import com.genietour.www.hotel.hotel.HotelDTO;
import com.genietour.www.hotel.hotelroomres.HotelRoomResDTO;

public interface HotelRoomService {
	public int insertHotelRoom(HotelRoomDTO hotelRoom);
	public List<HotelRoomDTO> selectListAll();
	public HotelRoomDTO 	  selectHotelRoomByRoomCode(HotelRoomDTO hotelRoom);
	public List<HotelRoomDTO> selectListByRoomType(HotelRoomDTO hotelRoom);
	public List<HotelRoomDTO> selectListByPrice(HotelRoomDTO hotelRoom);
	public List<HotelRoomDTO> selectListByVacancy(HotelRoomDTO hotelRoom);
	public List<HotelRoomDTO> selectListByCity(HotelRoomDTO hotelRoom);
	public List<HotelRoomDTO> selectListByOptions(HotelRoomDTO hotelRoom);
	public List<HotelRoomDTO> selectListByHotCode(HotelRoomDTO hotelRoom);
	public int countHotelRoom();

	/*public List<HotelRoomDTO> selectListByDate(HotelRoomResDTO hotelRoomRes);*/
	public List<HotelRoomDTO> selectListByAll(HotelRoomResDTO hotelRoomRes);
	public List<HotelRoomDTO> selectListByHotCodeAndAll(HotelRoomResDTO hotelRoomRes);
	public List<HotelRoomDTO> selectListByInnerDate(HotelRoomResDTO hotelRoomRes);
	public HotelRoomDTO selectHotelRoomByRoomType(HotelRoomDTO hotelRoom);
	public int deleteHotelRoom(HotelRoomDTO hotelRoom);
	
}
