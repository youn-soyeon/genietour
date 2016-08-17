package com.genietour.www.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.genietour.www.hotel.hotelroom.HotelRoomDTO;
import com.genietour.www.hotel.hotelroomres.HotelRoomResDTO;
@Repository
public interface HotelRoomMapper {
	public List<HotelRoomDTO> selectListAll();
	public HotelRoomDTO 	  selectHotelRoomByRoomCode(HotelRoomDTO hotelRoomView);
	public List<HotelRoomDTO> selectListByRoomType(HotelRoomDTO hotelRoomView);
	public List<HotelRoomDTO> selectListByPrice(HotelRoomDTO hotelRoomView);
	public List<HotelRoomDTO> selectListByVacancy(HotelRoomDTO hotelRoomView);
	public List<HotelRoomDTO> selectListByCity(HotelRoomDTO hotelRoomView);
	public List<HotelRoomDTO> selectListByOptions(HotelRoomDTO hotelRoomView);
	public List<HotelRoomDTO> selectListByHotCode(HotelRoomDTO hotelRoom);
	public List<HotelRoomDTO> selectListByDate(HotelRoomResDTO hotelRoomRes);
	public List<HotelRoomDTO> selectListByAll(HotelRoomResDTO hotelRoomRes);
	public List<HotelRoomDTO> selectListByHotCodeAndAll(HotelRoomResDTO hotelRoomRes);
	public List<HotelRoomDTO> selectListByInnerDate(HotelRoomResDTO hotelRoomRes);
	public HotelRoomDTO selectHotelRoomByRoomType(HotelRoomDTO hotelRoom);
	public int countAll();
}
