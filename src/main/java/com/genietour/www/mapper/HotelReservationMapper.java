package com.genietour.www.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.genietour.www.hotel.hotelreservation.HotelReservationDTO;
@Repository
public interface HotelReservationMapper {
	public int insertHotelReservation(HotelReservationDTO hotelReservation);
	public int insertHotelReservationWithNoCode(HotelReservationDTO hotelReservation);
	public List<HotelReservationDTO> selectListAll();
	public HotelReservationDTO selectHotelReservationByHotResCode(HotelReservationDTO hotelReservation);
	public List<HotelReservationDTO> selectListByMemId(HotelReservationDTO hotelReservation);
	public int countHotelReservation();
	public int updateHotelReservation(HotelReservationDTO hotelReservation);
	public int deleteHotelReservation(HotelReservationDTO hotelReservation);
	public int countHotelReservationByMemId(String memId);
}
