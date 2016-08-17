package com.genietour.www.admin;

import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.genietour.www.flight.flight.FlightDTO;
import com.genietour.www.flight.flight.FlightService;
import com.genietour.www.flight.flightreservation.FlightReservationService;
import com.genietour.www.flight.flightseat.FlightSeatService;
import com.genietour.www.flight.seat.SeatDTO;
import com.genietour.www.flight.seat.SeatService;
import com.genietour.www.global.Paging;
import com.genietour.www.global.PagingFactory;
import com.genietour.www.hotel.hotelreservation.HotelReservationService;
import com.genietour.www.hotel.hotelroom.HotelRoomDTO;
import com.genietour.www.hotel.hotelroom.HotelRoomService;
import com.genietour.www.hotel.hotelroomres.HotelRoomResService;
import com.genietour.www.member.MemberService;


@Controller
@SessionAttributes("user")
@RequestMapping("/admin")
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	//회원관리
	@Autowired MemberService memService;
	
	//항공관리
	@Autowired FlightDTO flight;
	@Autowired SeatDTO seat;
	@Autowired SeatService seatService;
	@Autowired FlightSeatService fliSeatService;
	
	//호텔관리
	@Autowired HotelRoomDTO hotRoom;
	@Autowired HotelRoomService hotRoomService;
	@Autowired HotelReservationService hotResService;
	
	//x
	@Autowired FlightService fliService;
	@Autowired FlightReservationService fliResService;
	@Autowired HotelRoomResService hotRoomResService;



	@RequestMapping("/test")
	public String test(){
		return "admin/test.tiles";
	}
	
	/**
	 * 관리자 메인화면
	 * */
	@RequestMapping("/search")
	public String adminMain() {
		logger.info("adminController : adminMain() 진입");
		return "admin/search.admin";
	}
	
	
	/**
	 * 회원 관리
	 * */
	@RequestMapping("/memlist/{strPageNo}")
	public @ResponseBody Model memList(
			@PathVariable("strPageNo") String strPageNo,
			Model model) {
		logger.info("adminController : memlist() 진입");
		Paging paging = PagingFactory.createPaging(strPageNo, memService.count());
		logger.info("* paging = {}", paging.toString());
		logger.info("* memList 사이즈 : {}", memService.memberList().size());
		model.addAttribute("memList", memService.memberList());
		model.addAttribute("paging", paging);
		return model;
	}
	
	@RequestMapping("/memupdate")
	public @ResponseBody int memUpdate() {
		//아직 구현X
		//memberMapper의 update를 같이 써야할 것 같은데 어떻게 해야 할지 모르겠음
		logger.info("adminController : memUpdate() 진입");
		return 0;
	}
	
	/**
	 * 항공권 관리
	 * */
	@RequestMapping("/flilist/{strPageNo}")
	public @ResponseBody Model fliList(
			@PathVariable("strPageNo") String strPageNo,
			Model model) {
		logger.info("adminController : fliList() 진입");
		Paging paging = PagingFactory.createPaging(strPageNo, fliSeatService.countFlightSeatAll());
		logger.info("* paging = {}", paging.toString());
		List<FlightDTO> list = fliService.selectListAirline();
		logger.info("* model.airList : {}", list.get(0).getAirline());
		logger.info("* model.airList : {}", list.get(1).getAirline());
		logger.info("* model.airList : {}", list.get(2).getAirline());
		model.addAttribute("fliList", fliSeatService.selectListAll());
		model.addAttribute("paging", paging);
		model.addAttribute("airList", fliService.selectListAll());
		return model;
	}
	
	@RequestMapping(value="/fliseatinsert", method=RequestMethod.POST)
	public @ResponseBody int insertFliSeat( 
			@RequestBody String seatData
			){
		logger.info("adminController : insertFliSeat() 진입");
		logger.info("* 받아온 값 seat = {}", seatData.toString());
		try {
			JSONParser jp = new JSONParser();
			JSONObject jobj = (JSONObject) jp.parse(seatData);
			String fliCode = (String) jobj.get("fliCode");
			JSONArray seatTypesArr = (JSONArray) jobj.get("seatTypes");
			JSONArray vacanciesArr = (JSONArray) jobj.get("vacancies");
			JSONArray pricesArr = (JSONArray) jobj.get("prices");
			List<String> seatTypes = new ArrayList<String>();
			List<String> vacancies = new ArrayList<String>();
			List<String> prices = new ArrayList<String>();
			for (int i = 0; i < seatTypesArr.size(); i++) {
				logger.info("* seatTypesArr = {}", seatTypesArr.get(i));
				seatTypes.add((String) seatTypesArr.get(i));
				vacancies.add((String) vacanciesArr.get(i));
				prices.add((String) pricesArr.get(i));
			}
			for (int i = 0; i < seatTypes.size(); i++) {
				seat.setFliCode(Integer.parseInt(fliCode));
				seat.setSeatType(seatTypes.get(i));
				seat.setVacancy(Integer.parseInt(vacancies.get(i)));
				seat.setPrice(Integer.parseInt(prices.get(i)));
				seatService.insertSeat(seat);
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return 1;
	}
	
	@RequestMapping(value = "/fliseatupdate", method = RequestMethod.POST)
	public @ResponseBody int flightSeatUpdate(
			@RequestBody SeatDTO tempSeat
			){
		logger.info("adminController : flightSeatUpdate() 진입");
		logger.info("* 받아온 SeatDTO 정보, 항공사코드, 좌석코드 : {}, {} ", tempSeat.getFliCode(), tempSeat.getSeatCode());
		int result = seatService.updateSeat(tempSeat);
		return result;
	}
	
	@RequestMapping(value = "/fliseatdelete", method = RequestMethod.POST)
	public @ResponseBody int flightSeatDelete(@RequestBody int[] seatCodes){
		logger.info("adminController : flightSeatDelete() 진입");
		logger.info("* seatCodes 길이 : {} ", seatCodes.length);
		for(int seatCode : seatCodes) {
			seat.setSeatCode(seatCode);
			seatService.deleteSeat(seat);
		}
		return 1;
	}
	
	/**
	 * 호텔 관리
	 * */
	
	@RequestMapping("/hotroomlist/{strPageNo}")
	public @ResponseBody Model getHotResList(
			@PathVariable("strPageNo") String strPageNo,
			Model model
			){
		logger.info("adminController : getHotResList()-GET 진입");
		Paging paging = PagingFactory.createPaging(strPageNo, hotRoomService.countHotelRoom());
		logger.info("* paging = {}", paging.toString());
		
		List<HotelRoomDTO> list = hotRoomService.selectListAll();
		logger.info("* model.airList : {}", list.get(0).getHotCode());
		logger.info("* model.airList : {}", list.get(1).getHotCode());
		logger.info("* model.airList : {}", list.get(2).getHotCode());
		model.addAttribute("paging", paging);
		model.addAttribute("hotRoomList", hotRoomService.selectListAll());
		return model;
	}
	
	@RequestMapping(value = "/deletehotel", method = RequestMethod.POST)
	public String deleteHotel(@RequestParam("checkfor-room") int[] roomCodes){
		logger.info("adminController : deleteHotel()-POST 진입");
		logger.info("* 체크 된 개수 : {}", roomCodes.length);
		for (int roomCode : roomCodes) {
			hotRoom.setRoomCode(roomCode);
			hotRoomService.deleteHotelRoom(hotRoom);
		}
		return "admin/search.admin";
	}
	
	@RequestMapping("/hotreslist/{strPageNo}")
	public String getHotList(
			@PathVariable String strPageNo,
			Model model
			){
		logger.info("adminController : getHotList()-GET 진입");
		logger.info("* strPageNo = {}", strPageNo);
		Paging paging = PagingFactory.createPaging(strPageNo, hotResService.countHotelReservation());
		logger.info(paging.toString());
		model.addAttribute("resList", hotResService.selectListAll());
		model.addAttribute("paging", paging);
		
		return "admin/res_hotel_list.admin";
	}
	
/*	@RequestMapping("/search")
	public String search(Model model){
		
		List<FlightSeatDTO> flightListAll =  new ArrayList<FlightSeatDTO>();
		List<FlightReservationDTO> flightReservationListAll = new ArrayList<FlightReservationDTO>();
		List<HotelRoomResDTO> hotelRoomResListAll = new ArrayList<HotelRoomResDTO>();
		List<HotelReservationDTO> hotelReservationListAll = new ArrayList<HotelReservationDTO>();
		List<MemberDTO> memberListAll = new ArrayList<MemberDTO>();
		
		flightListAll = flightService.selectListAll();
		flightReservationListAll = flightReservationService.selectListAll();
		hotelRoomResListAll = hotelRoomResService.selectListAll();
		hotelReservationListAll = hotelReservationService.selectListAll();
		memberListAll = service.memberList();
		
		logger.info("AdminFlightListAll() 진입 == {}",flightListAll.size());
		logger.info("flightService=={}",flightListAll);
		
		logger.info("AdminFlightReservationListAll() 진입 == {}",flightReservationListAll.size());
		logger.info("flightReservationService=={}",flightReservationListAll);
		
		logger.info("AdminHotelRoomResListAll() 진입 == {}",hotelRoomResListAll.size());
		logger.info("hotelRoomResService=={}",hotelRoomResListAll);
		
		logger.info("AdminHotelReservationListAll() 진입 == {}",hotelReservationListAll.size());
		logger.info("hotelReservationService=={}",hotelReservationListAll);
		
		logger.info("AdminMemberListAll() 진입 == {}", memberListAll.size());
		logger.info("hotelReservationService=={}",memberListAll);
	
		model.addAttribute("flightService",flightListAll);
		model.addAttribute("flightReservationService",flightReservationListAll);
		model.addAttribute("hotelRoomResService",hotelRoomResListAll);
		model.addAttribute("hotelReservationService",hotelReservationListAll);
		model.addAttribute("service",memberListAll);
		return "admin/search.admin";
	};	
	@RequestMapping("/flightInsert")
	public String flightInsert(
			@RequestParam("airline")	String airline,
			@RequestParam("fli-name")	String fliName,
			@RequestParam("dep-city")	String depCity,
			@RequestParam("arr-city")	String arrCity,
			@RequestParam("dep-date")	String depDate,
			@RequestParam("arr-date")	String arrDate,
			@RequestParam("dep-time")	String depTime,
			@RequestParam("arr-time")	String arrTime,
			
			@RequestParam("seat-type")	String[] seatType,
			@RequestParam("price")		int[] price,
			@RequestParam("vacancy")	int[] vacancy,
			Model model){
	
		logger.info("flightInsert 진입성공={}", airline);
		logger.info("flightInsert 진입성공={}", fliName);
		logger.info("flightInsert 진입성공={}", depCity);
		logger.info("flightInsert 진입성공={}", arrCity);
		logger.info("flightInsert 진입성공={}", depDate);
		logger.info("flightInsert 진입성공={}", arrDate);
		logger.info("flightInsert 진입성공={}", depTime);
		logger.info("flightInsert 진입성공={}", arrTime);
		
		logger.info("seatcode length = {}", seatType.length);
		for(int i=0; i<seatType.length; i++) {
			logger.info("SeatInsert 진입성공={}", seatType[i]);
			logger.info("SeatInsert 진입성공={}", price[i]);
			logger.info("SeatInsert 진입성공={}", vacancy[i]);
		}
		
				
		FlightDTO flight = new FlightDTO();
		flight.setAirline(airline);
		flight.setFliName(fliName);
		flight.setDepCity(depCity);
		flight.setArrCity(arrCity);
		flight.setDepDate(depDate+" "+depTime);
		flight.setArrDate(arrDate+" "+arrTime);
		
		SeatDTO[] seats = new SeatDTO[seatType.length];
		for( int i=0; i<seatType.length; i++ ) {
			seats[i] = new SeatDTO();
			seats[i].setSeatType(seatType[i]);
			seats[i].setPrice(price[i]);
			seats[i].setVacancy(vacancy[i]);
			
		}
		
		flightService.insertFlightSeat(flight, seats);
		
		String view = "admin/search.admin";
		return view;
	}
	
	@RequestMapping("/flightDelete")
	public String flightDelete(@RequestParam("flight-delete") int[] fliCodes){
		logger.info("몇 개 체크? "+fliCodes.length);
		for( int fliCode : fliCodes ) {
			flight.setFliCode(fliCode);
			flightService.deleteFlightSeat(flight);
		}
		return "admin/search.admin";
		
	}
	
	@RequestMapping("/flightUpdate")
	public String flightUpdate(
			@RequestParam("fli-code")	int fliCode,
			@RequestParam("airline")	String airline,
			@RequestParam("fli-name")	String fliName,
			@RequestParam("dep-city")	String depCity,
			@RequestParam("arr-city")	String arrCity,
			@RequestParam("dep-date")	String depDate,
			@RequestParam("arr-date")	String arrDate,
			@RequestParam("dep-time")	String depTime,
			@RequestParam("arr-time")	String arrTime,
			
			@RequestParam("seat-code")	int seatCode,
			@RequestParam("seat-type")	String seatType,
			@RequestParam("price")		int price,
			@RequestParam("vacancy")	int vacancy,
			Model model){
		
		
		flight.setFliCode(fliCode);
		flight.setAirline(airline);
		flight.setFliName(fliName);
		flight.setDepCity(depCity);
		flight.setArrCity(arrCity);
		flight.setDepDate(depDate+" "+depTime);
		flight.setArrDate(arrDate+" "+arrTime);
		fliService.updateFlight(flight);

		seat.setFliCode(fliCode);
		seat.setPrice(price);
		seat.setSeatCode(seatCode);
		seat.setSeatType(seatType);
		seat.setVacancy(vacancy);
		seatService.updateSeat(seat);
		return "admin/search.admin";
		
	}
	*/
	
	
}
