package com.genietour.www.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.genietour.www.hotel.hotelroomres.HotelRoomResDTO;

@Repository
public interface HotelRoomResMapper {
	public List<HotelRoomResDTO> selectListAll();
}
