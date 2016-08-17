package com.genietour.www.admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.genietour.www.flight.flight.FlightDTO;
import com.genietour.www.flight.flight.FlightService;
import com.genietour.www.flight.flightreservation.FlightReservationDTO;
import com.genietour.www.flight.flightreservation.FlightReservationService;
import com.genietour.www.flight.flightreservation.FlightReservationServiceImpl;
import com.genietour.www.flight.flightseat.FlightSeatService;
import com.genietour.www.flight.seat.SeatDTO;
import com.genietour.www.flight.seat.SeatService;
import com.genietour.www.hotel.hotel.HotelDTO;
import com.genietour.www.hotel.hotel.HotelService;
import com.genietour.www.hotel.hotelreservation.HotelReservationDTO;
import com.genietour.www.hotel.hotelreservation.HotelReservationService;
import com.genietour.www.hotel.room.RoomDTO;
import com.genietour.www.hotel.room.RoomService;

@Service
public class AdminServiceImpl implements AdminService{
	
	private static final Logger logger = LoggerFactory.getLogger(FlightReservationServiceImpl.class);
	
	@Autowired SqlSession session;
	
	@Autowired HotelService		hotelService;
	@Autowired HotelReservationService hotelReservationService;
	@Autowired RoomService roomService;
	
	@Autowired FlightService	flightService;
	@Autowired FlightReservationService flightReservationService;
	@Autowired SeatService seatService;
	@Autowired FlightSeatService flightSeatService;
	
	@Override
	public int insertHotel(HotelDTO hotel) {
		logger.info("AdminService : insertHotel()진입 후 = {}",hotel);
		return hotelService.insertHotel(hotel);		 
	}

	@Override
	public int insertHotelReservation(HotelReservationDTO hotelReservation) {
		logger.info("AdminService : insertHotelReservation()진입 후 = {}",hotelReservation);	
		return hotelReservationService.insertHotelReservation(hotelReservation);
	
	}

	@Override
	public int insertRoom(RoomDTO room) {
		logger.info("AdminService : insertRoom()진입 후 = {}");
		return roomService.insertRoom(room);
	}

	@Override
	public int insertFlight(FlightDTO flight) {
		logger.info("AdminService : insertFlingt()진입 후 = {}");
		return flightService.insertFlight(flight);
	}

	@Override
	public int insertFlightReservation(FlightReservationDTO flightReservation) {
		logger.info("AdminService : insertFlightReservation()진입 후 = {}");
		return flightReservationService.insertFlightReservaion(flightReservation);
	}

	@Override
	public int insertSeat(SeatDTO seat) {
		logger.info("AdminService : insertSeat()진입 후 = {}");
		return seatService.insertSeat(seat);
	}

	@Override
	public List<HotelDTO> selectHotelListAll() {
		logger.info("AdminService : hotelList()진입 후 = {}");
		return hotelService.selectListAll();
	}

	@Override
	public List<HotelReservationDTO> selectHotelReservationListAll() {
		logger.info("AdminService : hotelReservationList()진입 후 = {}");
		return hotelReservationService.selectListAll();
	}

	@Override
	public List<RoomDTO> selectRoomListAll() {
		logger.info("AdminService : roomList()진입 후 = {}");
		return roomService.selectListAll();
		
	}

	@Override
	public List<FlightDTO> selectFlightListAll() {
		logger.info("AdminService : flightList()진입 후 = {}");
		return flightService.selectListAll();
	}

	@Override
	public List<FlightReservationDTO> selectFlightReservationListAll() {
		logger.info("AdminService : flightReservationList()진입 후 = {}");
		return flightReservationService.selectListAll();
	}

	@Override
	public List<SeatDTO> selectSeatListAll() {
		logger.info("AdminService : seatList()진입 후 = {}");
		return seatService.selectListAll();
	}

	@Override
	public int deleteHotel(HotelDTO hotel) {
		logger.info("AdminService : deleteHotel()진입 후 = {}",hotel);
		return hotelService.deleteHotel(hotel);	
		
	}

	@Override
	public int deleteHotelReservation(HotelReservationDTO hotelReservation) {
		logger.info("AdminService : insertHotel()진입 후 = {}",hotelReservation);
		return hotelReservationService.deleteHotelReservation(hotelReservation);
	}

	@Override
	public int deleteRoom(RoomDTO room) {
		logger.info("AdminService : deleteHotel()진입 후 = {}",room);
		return roomService.deleteRoom(room);
	}

	@Override
	public int deleteFlight(FlightDTO flight) {
		logger.info("AdminService : deleteHotel()진입 후 = {}",flight);
		return flightService.deleteFlight(flight);
	}

	@Override
	public int deleteFlightReservation(FlightReservationDTO flightReservation) {
		logger.info("AdminService : deleteHotel()진입 후 = {}",flightReservation);
		return flightReservationService.deleteFlightReservation(flightReservation);
	}

	@Override
	public int deletetSeat(SeatDTO seat) {
		logger.info("AdminService : deleteHotel()진입 후 = {}",seat);
		return seatService.deleteSeat(seat);
	}

	@Override
	public int hotelCount() {
		logger.info("AdminService : hotelCount()진입 후 = {}");
		return hotelService.countHotel();
		
	}

	@Override
	public int hotelReservationCount() {
		logger.info("AdminService : hotelReservationCount()진입 후 = {}");
		return hotelReservationService.countHotelReservation();
	}

	@Override
	public int roomCount() {
		logger.info("AdminService : roomCount()진입 후 = {}");
		return roomService.countRoom();
	}

	@Override
	public int flightCount() {
		logger.info("AdminService : flightCount()진입 후 = {}");
		return flightService.countFlight();
	}

	@Override
	public int flightReservationCount() {
		logger.info("AdminService : flightReservationCount()진입 후 = {}");
		return flightReservationService.countFlgihtReservaion();
	}

	@Override
	public int seatCount() {
		logger.info("AdminService : seatCount()진입 후 = {}");
		return seatService.countSeat();
	}

	@Override
	public int updateHotel(HotelDTO hotel) {
		logger.info("AdminService : updateHotel()진입 후 = {}",hotel);
		return hotelService.updateHotel(hotel);
		
	}

	@Override
	public int updateHotelReservation(HotelReservationDTO hotelReservation) {
		logger.info("AdminService : updateHotelReservation()진입 후 = {}",hotelReservation);
		return hotelReservationService.updateHotelReservation(hotelReservation);
		
	}

	@Override
	public int updateRoom(RoomDTO room) {
		logger.info("AdminService : updateHotel()진입 후 = {}",room);
		return roomService.updateRoom(room);
	}

	@Override
	public int updateFlight(FlightDTO flight) {
		logger.info("AdminService : updateHotel()진입 후 = {}",flight);
		return flightService.updateFlight(flight);
	}

	@Override
	public int updateFlightMemberReservation(FlightReservationDTO flightReservation) {
		logger.info("AdminService : updateMemberHotel()진입 후 = {}",flightReservation);
		return flightReservationService.updateMember(flightReservation);
	}
	
	@Override
	public int updateFlightAdminReservation(FlightReservationDTO flightReservation) {
		logger.info("AdminService : updateAdminHotel()진입 후 = {}",flightReservation);
		return flightReservationService.updateAdmin(flightReservation);
	}

	@Override
	public int updatetSeat(SeatDTO seat) {
		logger.info("AdminService : updateHotel()진입 후 = {}",seat);
		return seatService.updateSeat(seat);
	}

	@Override
	public int insertFlightSeat(FlightDTO flight, SeatDTO[] seats) {
		logger.info("AdminService : updateHotel()진입 후 = {}",flight,seats);
		return flightSeatService.insertFlightSeat(flight, seats);
	}

	@Override
	public int deleteFlightSeat(FlightDTO flight) {
		logger.info("AdminService : updateHotel()진입 후 = {}",flight);
		return flightSeatService.deleteFlightSeat(flight);
	}

	@Override
	public int selectNextFliCode() {
		logger.info("AdminService : selectNextFliCode()진입");
		return flightService.selectMaxFliCode();
	}

	

}
