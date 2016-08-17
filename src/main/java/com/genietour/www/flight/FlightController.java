package com.genietour.www.flight;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.genietour.www.flight.flight.FlightDTO;
import com.genietour.www.flight.flight.FlightService;
import com.genietour.www.flight.flightreservation.FlightReservationDTO;
import com.genietour.www.flight.flightreservation.FlightReservationService;
import com.genietour.www.flight.flightseat.FlightSeatDTO;
import com.genietour.www.flight.flightseat.FlightSeatService;

@Controller
@RequestMapping("/flight")
public class FlightController {
	private static final Logger logger = LoggerFactory.getLogger(FlightController.class);
	@Autowired FlightDTO flight;
	@Autowired FlightSeatDTO fliSeat;
	@Autowired FlightReservationDTO fliRes;
	@Autowired FlightService service;
	@Autowired FlightSeatService fsService;
	@Autowired FlightReservationService frService;
	
	@RequestMapping("/search")
	public @ResponseBody List<FlightDTO> search(){
		logger.info("=== flight-search()(GET) ===");
		logger.info("=== selectListDepCity 접근 ===");
		
		return service.selectListDepCity();
	}
	
	@RequestMapping(value="/arrCity/{dep}", method=RequestMethod.GET)
	public @ResponseBody List<FlightDTO> arrCity(@PathVariable String dep) {
		logger.info("=== flight-arrCity ==={}", dep);
		
		flight.setDepCity(dep);
		logger.info("=== selectListDepByArrCity 접근 ===");
		return service.selectListDepByArrCity(flight);
	}
	
	@RequestMapping("/searchDetail")
	public @ResponseBody List<FlightSeatDTO> searchDetail(){
		logger.info("=== flight-searchDetail(GET) 진입 ===");

		return fsService.selectListSearchFlight(fliSeat);
	}
	
	@RequestMapping(value="/searchDetail/{depCity}/{arrCity}/{depDate}", method=RequestMethod.GET)
	public @ResponseBody List<FlightSeatDTO> searchDetail(@PathVariable String depCity,
															@PathVariable String arrCity,
															@PathVariable String depDate){
		logger.info("=== flight-searchDetail(GET) 진입 ===");
		
		fliSeat.setDepCity(depCity);
		fliSeat.setArrCity(arrCity);
		fliSeat.setDepDate(depDate);
		logger.info("나와라 도착도시: "+fliSeat.getArrCity());
		logger.info("=== selectListSearchFlight 접근 ===");
		
		return fsService.selectListSearchFlight(fliSeat);
	}
	
	@RequestMapping(value="/selectSeat", method=RequestMethod.GET)
	public @ResponseBody FlightSeatDTO selectSeat(){
		logger.info("=== flight-selectSeat(GET) 진입 ===");
		return fsService.selectSearchVacancy(fliSeat);
	}
	
	@RequestMapping(value="/selectSeat/{seatCode}", method=RequestMethod.GET)
	public @ResponseBody FlightSeatDTO selectSeat(@PathVariable int seatCode){
		logger.info("=== flight-selectSeat(GET) 진입 ===");
		logger.info("나와라 seatCode: "+seatCode);
		
		fliSeat.setSeatCode(seatCode);
		logger.info("잘 들어갔냐 코드: "+fsService.selectSearchVacancy(fliSeat).getDuration());
		logger.info("=== selectSearchVacancy 접근 ===");
		
		return fsService.selectSearchVacancy(fliSeat);
	}
	
	@RequestMapping(value="/reservation", method=RequestMethod.POST)
	public @ResponseBody int reservation(
											@RequestParam("passport") String passport, @RequestParam("korName") String korName,
											@RequestParam("engName") String engName, @RequestParam("birth") String birth,
											@RequestParam("gender") String gender, @RequestParam("phone") String phone,
											@RequestParam("comments") String comments, @RequestParam("seatCode") int seatCode,
											@RequestParam("memId") String memId
											){
		logger.info("=== flight-reservation(POST) 진입 ===");
		logger.info("나와라 seatCode: "+birth);
		
		fliRes.setPassport(passport);
		fliRes.setKorName(korName);
		fliRes.setEngName(engName);
		fliRes.setBirth(birth);
		fliRes.setGender(gender);
		fliRes.setPhone(phone);
		fliRes.setComments(comments);
		fliRes.setSeatCode(seatCode);
		fliRes.setMemId(memId);
		fliRes.setResDate( new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()) );
		
		logger.info("=== updateVacancy 접근 ===");
		frService.updateVacancy(fliRes);
		logger.info("=== insertFlightReservaion 접근 ===");
		
		return frService.insertFlightReservaion(fliRes);
	}
	
}
