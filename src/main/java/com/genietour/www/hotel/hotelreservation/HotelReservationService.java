package com.genietour.www.hotel.hotelreservation;

import java.util.List;

public interface HotelReservationService {
	public int insertHotelReservation(HotelReservationDTO hotel);
	public int insertHotelReservationWithNoCode(HotelReservationDTO hotel);
	
	public List<HotelReservationDTO> selectListAll();
	public HotelReservationDTO selectHotelReservationByHotResCode(HotelReservationDTO hotelReservation);
	public List<HotelReservationDTO> selectListByMemId(HotelReservationDTO hotelReservation);
		
	public int updateHotelReservation(HotelReservationDTO hotelReservation);
	public int deleteHotelReservation(HotelReservationDTO hotelReservation);
	
	public int countHotelReservation();
	public int countHotelReservationByMemId(String memId);
}
