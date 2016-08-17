package com.genietour.www.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.genietour.www.hotel.hotel.HotelDTO;
import com.genietour.www.hotel.hotelroom.HotelRoomDTO;
import com.genietour.www.hotel.hotelroomres.HotelRoomResDTO;
@Repository
public interface HotelMapper {
	
	
	public int insertHotel(HotelDTO hotel);
	public List<HotelDTO> selectListAll();
	public List<HotelDTO> selectListByCity(HotelDTO hotName);
	public List<HotelDTO> selectListByHotName(HotelDTO hotName);
	public HotelDTO selectHotelByHotCode(HotelDTO hotCode);	
	public List<HotelDTO> selectListByDate(HotelRoomResDTO hotelRoomRes);
	
	public int updateHotel(HotelDTO hotel);
	public int deleteHotel(HotelDTO hotel);
	
	public int countHotel();
	
	public int selectMaxHotCode();

}