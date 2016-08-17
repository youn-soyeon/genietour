package com.genietour.www.hotel.hotelroom;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.genietour.www.global.Paging;
import com.genietour.www.global.PagingFactory;
import com.genietour.www.hotel.hotelreservation.HotelReservationDTO;
import com.genietour.www.hotel.hotelreservation.HotelReservationService;

@Controller
@RequestMapping("/hotroom")
public class HotelRoomController {
	private static final Logger logger = LoggerFactory.getLogger(HotelRoomController.class);
	@Autowired HotelReservationDTO hotres;
	@Autowired HotelReservationService hotResService;
	
	@Autowired HotelRoomDTO hotRoom;
	@Autowired HotelRoomService roomService;
	
	@RequestMapping("/hotreslist/{strPageNo}")
	public String getHotList(
			@PathVariable String strPageNo,
			Model model
			){
		logger.info("========== hotroom-getHotList() + paging / GET 진입 ==========");
		logger.info("strPageNo = {}", strPageNo);
		Paging paging = PagingFactory.createPaging(strPageNo, hotResService.countHotelReservation());
		logger.info(paging.toString());
		model.addAttribute("resList", hotResService.selectListAll());
		model.addAttribute("paging", paging);
		
		return "admin/res_hotel_list.admin";
	}
	
	@RequestMapping(value = "/deletehotel", method = RequestMethod.POST)
	public String deleteHotel(@RequestParam("checkfor-room") int[] roomCodes){
		logger.info("*2.deleteHotel() 진입 ==========");
		logger.info("체크 된 개수 : {}", roomCodes.length);
		for (int roomCode : roomCodes) {
			hotRoom.setRoomCode(roomCode);
			roomService.deleteHotelRoom(hotRoom);
		}
		return "admin/search.admin";
	}
	
	@RequestMapping("/hotlist/{strPageNo}")
	public String getHotResList(
			@PathVariable String strPageNo,
			Model model
			){
		logger.info("========== hotroom-getHotResList() + paging / GET 진입 ==========");
		logger.info("strPageNo = {}", strPageNo);
		Paging paging = PagingFactory.createPaging(strPageNo, roomService.countHotelRoom());
		logger.info(paging.toString());
		
		logger.info("next 계산 = {}", paging.getTotalPages() - paging.getEndPage());
		model.addAttribute("roomList", roomService.selectListAll());
		model.addAttribute("paging", paging);
		
		return "admin/hotel_list.admin";
	}
	
	@RequestMapping(value = "/updatehotres", method = RequestMethod.POST)
	public String updateHotRes(
			@RequestParam("hotResCode") int hotResCode,
			@RequestParam("memEmail") String memEmail,
			@RequestParam("gender") String gender,
			@RequestParam("payment") int payment,
			@RequestParam("nationality") String nationality,
			@RequestParam("phone") String phone,
			@RequestParam("arrTime") String arrTime,
			@RequestParam("roomCode") int roomCode
			){
		logger.info("*2.updateHotRes() 진입");
		logger.info("hotResCode : {}", hotResCode);
		hotres.setHotResCode(hotResCode);
		hotres.setEmail(memEmail);
		hotres.setGender(gender);
		hotres.setPayment(payment);
		hotres.setNationality(nationality);
		hotres.setPhone(phone);
		hotres.setArrTime(arrTime);
		hotres.setRoomCode(roomCode);
		int result = hotResService.updateHotelReservation(hotres);
		String view = "";
		if (result == 1) {
			view = "admin/search.admin";
		} else {
			view = "global/main.admin";
		}
		return view;
	}
	
	@RequestMapping(value = "/deletehotres", method = RequestMethod.POST)
	public String deleteHotRes(
			@RequestParam("checkfor-hotres") int[] hotResCodes
			){
		logger.info("*3.deleteHotRes() 진입");
		logger.info("체크 된 개수 : {}", hotResCodes.length);
		for(int hotResCode : hotResCodes){
			hotres.setHotResCode(hotResCode);
			hotResService.deleteHotelReservation(hotres);
		}
		
		return "admin/search.admin";
	}
	
}
