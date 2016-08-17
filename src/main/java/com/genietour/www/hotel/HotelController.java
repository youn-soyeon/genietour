package com.genietour.www.hotel;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.genietour.www.hotel.hotel.HotelDTO;
import com.genietour.www.hotel.hotel.HotelService;
import com.genietour.www.hotel.hotelreservation.HotelReservationDTO;
import com.genietour.www.hotel.hotelreservation.HotelReservationService;
import com.genietour.www.hotel.hotelroom.HotelRoomDTO;
import com.genietour.www.hotel.hotelroom.HotelRoomService;
import com.genietour.www.hotel.hotelroomres.HotelRoomResDTO;
import com.genietour.www.hotel.room.RoomDTO;
import com.genietour.www.hotel.room.RoomService;

@RestController
@RequestMapping("/hotel")
public class HotelController {
	private static final Logger logger = LoggerFactory.getLogger(HotelController.class);
	@Autowired HotelService hotelService;
	@Autowired HotelRoomService hotelRoomService;
	@Autowired RoomService roomService;
	@Autowired HotelReservationService reservationService;
	@Autowired HotelRoomResDTO hotelRoomRes;
	@Autowired HotelRoomDTO hotelRoom;
	@Autowired HotelReservationDTO reservation;
	@Autowired HotelDTO hotel;
	@Autowired RoomDTO room;
	
	@RequestMapping("/list")
	public List<HotelDTO> list(){
		logger.info("HotelController === list()");
		return hotelService.selectListAll();
	};
	
	
	@RequestMapping("/detail/{hotCode}")
	public List<HotelRoomDTO> findByListByAll(
			@PathVariable("hotCode")int hotCode,
			@RequestParam("city")String city,
			@RequestParam("checkin")String checkin,
			@RequestParam("checkout")String checkout,
			@RequestParam("roomType")String roomType){
		
		logger.info("HotelController === findByListByAll()");
		logger.info("넘어온 호텔코드 : {}",hotCode);
		logger.info("넘어온 도시 : {}",city);
		logger.info("넘어온 체크인 : {}",checkin);
		logger.info("넘어온 체크아웃 : {}",checkout);
		logger.info("넘어온 룸타입 : {}",roomType);
		hotelRoomRes.setHotCode(hotCode);
		hotelRoomRes.setStartDay(checkin);
		hotelRoomRes.setEndDay(checkout);
		hotelRoomRes.setRoomType(roomType);
		
		return hotelRoomService.selectListByHotCodeAndAll(hotelRoomRes);
		
	}
	
	@RequestMapping(value="/room", method=RequestMethod.POST)
	public RoomDTO findByHotCodeRoomType(
			@RequestParam("hotCode")int hotCode,
			@RequestParam("roomType")String roomType){
		logger.info("HotelController === findByHotCodeRoomType()");
		logger.info("넘어온 호텔 코드 : {}",hotCode);
		logger.info("넘어온 룸 타입 : {}",roomType);
		room.setHotCode(hotCode);
		room.setRoomType(roomType);
		return roomService.selectRoomByHotCodeRoomType(room);
	}
	
	
	@RequestMapping(value="/listRoomType", method=RequestMethod.POST)
	public List<HotelRoomDTO> findByRoomType(@RequestParam("roomType")String roomType){
		logger.info("HotelController === findByRoomType()");
		logger.info("넘어온 룸 타입 : {}",roomType);
		hotelRoom.setRoomType(roomType);
		return hotelRoomService.selectListByRoomType(hotelRoom);
	}
	
	@RequestMapping(value="/listCity", method=RequestMethod.POST)
	public List<HotelDTO> findByCity(@RequestParam("city")String city){
		logger.info("HotelController === findByCity()");
		logger.info("넘어온 도시 : {}",city);
		hotel.setCity(city);
		return hotelService.selectListByCity(hotel);
	}
	
		
	@RequestMapping(value="/listDate", method=RequestMethod.POST)
	public List<HotelDTO> findByDate(
			@RequestParam("checkin")String checkin,
			@RequestParam("checkout")String checkout){
		logger.info("HotelController === findByDate()");
		logger.info("넘어온 체크인 : {}",checkin);
		logger.info("넘어온 체크아웃 : {}",checkout);
		hotelRoomRes.setStartDay(checkin);
		hotelRoomRes.setEndDay(checkout);
		return hotelService.selectListByDate(hotelRoomRes);
	}
	
	@RequestMapping(value="/listAll", method=RequestMethod.POST)
	public List<HotelRoomDTO> findByAll(
			@RequestParam("city")String city,
			@RequestParam("checkin")String checkin,
			@RequestParam("checkout")String checkout,
			@RequestParam("roomType")String roomType){
		
		logger.info("HotelController === findByAll()");
		logger.info("넘어온 도시 : {}",city);
		logger.info("넘어온 체크인 : {}",checkin);
		logger.info("넘어온 체크아웃 : {}",checkout);
		logger.info("넘어온 룸타입 : {}",roomType);
		hotelRoomRes.setCity(city);
		hotelRoomRes.setStartDay(checkin);
		hotelRoomRes.setEndDay(checkout);
		hotelRoomRes.setRoomType(roomType);
		return hotelRoomService.selectListByAll(hotelRoomRes);
	}
	
	@RequestMapping(value="/RoomListByInnerDate",method=RequestMethod.POST)
	public List<HotelRoomDTO> findByInnerDate(
			@RequestParam("hotCode")int hotCode,
			@RequestParam("innerCheckin")String checkin,
			@RequestParam("innerCheckout")String checkout){
		
		logger.info("HotelController === findRoomByInnerDate()");
		logger.info("넘어온 호텔 코드 : {}",hotCode);
		logger.info("넘어온 체크인 : {}",checkin);
		logger.info("넘어온 체크아웃 : {}",checkout);
		
		hotelRoomRes.setHotCode(hotCode);
		hotelRoomRes.setStartDay(checkin);
		hotelRoomRes.setEndDay(checkout);
		
		return hotelRoomService.selectListByInnerDate(hotelRoomRes);
	}
	
	@RequestMapping(value="/findRoomByRoomType",method=RequestMethod.POST)
	public HotelRoomDTO findRoomByRoomType(
			@RequestParam("hotCode")int hotCode,
			@RequestParam("roomType")String roomType){
		
		logger.info("HotelController === findRoomByRoomType()");
		logger.info("넘어온 호텔 코드 : {}",hotCode);
		logger.info("넘어온 룸타입 : {}",roomType);
		
		hotelRoom.setHotCode(hotCode);
		hotelRoom.setRoomType(roomType);
		return hotelRoomService.selectHotelRoomByRoomType(hotelRoom);
	}
	
	@RequestMapping(value="/reservation",method=RequestMethod.POST)
	public int hotelReservation(
			@RequestParam("hotResName")String hotResName,
			@RequestParam("email")String email,
			@RequestParam("phone")String phone,
			@RequestParam("nationality")String nationality,
			@RequestParam("gender")String gender,
			@RequestParam("arrTime")String arrTime,
			@RequestParam("stayDate")String stayDate,
			@RequestParam("payment")int payment,
			@RequestParam("comments")String comments,
			@RequestParam("memId")String memId,
			@RequestParam("roomCode")int roomCode,
			@RequestParam("nights")int nights){
		
		logger.info("HotelController === hotelReservation()");
		logger.info("넘어온 hotResName : {}",hotResName);
		logger.info("넘어온 phone : {}",phone);
		logger.info("넘어온 email : {}",email);
		logger.info("넘어온 nationality : {}",nationality);
		logger.info("넘어온 gender : {}",gender);
		logger.info("넘어온 arrTime : {}",arrTime);
		logger.info("넘어온 stayDate : {}",stayDate);
		logger.info("넘어온 payment : {}",payment);
		logger.info("넘어온 comments : {}",comments);
		logger.info("넘어온 memId : {}",memId);
		logger.info("넘어온 roomCode : {}",roomCode);
		logger.info("넘어온 nights : {}",nights);
		
		int cnt = 0;
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		try {
			Date date = df.parse(stayDate);
			for (int i = 0; i < nights; i++) {
				Calendar cal = Calendar.getInstance();
				cal.setTime(date);
				cal.add(Calendar.DATE, i);

				reservation.setHotResName(hotResName);
				reservation.setEmail(email);
				reservation.setPhone(phone);
				reservation.setNationality(nationality);
				reservation.setGender(gender);
				reservation.setArrTime(arrTime);
				reservation.setStayDate(df.format(cal.getTime()));
				reservation.setPayment(payment);
				reservation.setComments(comments);
				reservation.setMemId(memId);
				reservation.setRoomCode(roomCode);
				reservation.setResDate( new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()) );
				logger.info("stayDate : {}" , df.format(cal.getTime()));
				cnt += reservationService.insertHotelReservationWithNoCode(reservation);
			}
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		logger.info("횟수 : {}" , cnt);
		return cnt;
	}
	
}




