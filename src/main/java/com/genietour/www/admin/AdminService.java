package com.genietour.www.admin;

import java.util.List;

import com.genietour.www.flight.flight.FlightDTO;
import com.genietour.www.flight.flightreservation.FlightReservationDTO;
import com.genietour.www.flight.seat.SeatDTO;
import com.genietour.www.hotel.hotel.HotelDTO;
import com.genietour.www.hotel.hotelreservation.HotelReservationDTO;
import com.genietour.www.hotel.room.RoomDTO;

public interface AdminService {
	
	//insert
	public int insertHotel(HotelDTO hotel);
	public int insertHotelReservation(HotelReservationDTO hotelReservation);
	public int insertRoom(RoomDTO room);
	
	
	public int insertFlight(FlightDTO flight);
	public int insertFlightReservation(FlightReservationDTO flightReservation);
	public int insertSeat(SeatDTO seat);
	public int insertFlightSeat(FlightDTO flight, SeatDTO[] seats);
	
	
	/*public int insertMember(MemberDTO member);*/
	
	//delete
	public int deleteHotel(HotelDTO hotel);
	public int deleteHotelReservation(HotelReservationDTO hotelReservation);
	public int deleteRoom(RoomDTO room);
	
	public int deleteFlight(FlightDTO flight);
	public int deleteFlightReservation(FlightReservationDTO flightReservation);
	public int deletetSeat(SeatDTO seat);
	public int deleteFlightSeat(FlightDTO flight);
	
	//All List
	public List<HotelDTO> selectHotelListAll();
	public List<HotelReservationDTO> selectHotelReservationListAll();
	public List<RoomDTO> selectRoomListAll();
	
	public List<FlightDTO> selectFlightListAll();
	public List<FlightReservationDTO> selectFlightReservationListAll();
	public List<SeatDTO> selectSeatListAll();
	
	/*public List<MemberDTO> selectMemberListAll();*/
	
	//count
	public int hotelCount();
	public int hotelReservationCount();
	public int roomCount();
	
	public int flightCount();
	public int flightReservationCount();
	public int seatCount();
	
	
	//update
	public int updateHotel(HotelDTO hotel);
	public int updateHotelReservation(HotelReservationDTO hotelReservation);
	public int updateRoom(RoomDTO room);
	
	public int updateFlight(FlightDTO flight);
	public int updateFlightMemberReservation(FlightReservationDTO flightReservation);
	public int updateFlightAdminReservation(FlightReservationDTO flightReservation);
	public int updatetSeat(SeatDTO seat);
	
	/*public AdminDTO getByCode(HotelReservationDTO hotel);
	public AdminDTO getById(HotelReservationDTO hotel);*/
	
	
	public int selectNextFliCode();
}
