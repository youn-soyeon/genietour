package com.genietour.www.member;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.genietour.www.flight.flightreservation.FlightReservationDTO;
import com.genietour.www.flight.flightreservation.FlightReservationService;
import com.genietour.www.global.Paging;
import com.genietour.www.global.PagingFactory;
import com.genietour.www.hotel.hotelreservation.HotelReservationDTO;
import com.genietour.www.hotel.hotelreservation.HotelReservationService;



@Controller
@SessionAttributes("user")
@RequestMapping("/member")
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	@Autowired MemberDTO member;
	@Autowired MemberService service;
	@Autowired HotelReservationDTO hotRes;
	@Autowired HotelReservationService hotResService;
	@Autowired FlightReservationDTO fliRes;
	@Autowired FlightReservationService fliResService;
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public  @ResponseBody MemberDTO login(@RequestBody MemberDTO mem, Model model) {
		logger.info("MemberController-login POST() i-{}   p-{}   ", mem.getMemId(), mem.getPassword());
		mem = service.login(mem);
		model.addAttribute("user", mem);		
		logger.info("로그인 가능 여부 null인가 = {}", mem);		
		return mem;
	}

	@RequestMapping("/logout")
	public String logout(SessionStatus status){
		logger.info("MemberController-logout GET()");
		status.setComplete();
		return "redirect:/";
	}
	
	
	@RequestMapping(value="/join",method=RequestMethod.POST)
	public @ResponseBody MemberDTO join(@RequestBody MemberDTO mem, Model model){
		logger.info("member-join(POST)");
		if( 1 != service.insert(mem) ) {
			return null;
		}
		return mem;
	}
	

	
	@RequestMapping("/mypage/{memId}")
	public @ResponseBody MemberDTO mypage(
			@PathVariable String memId, Model model,HttpSession session
			){
		
		logger.info("MemberController-mypage GET()");
		member = (MemberDTO) session.getAttribute("user");
		memId = member.getMemId();
		if( !memId.equals(member.getMemId()) ) {
			logger.info("잘못된 접근입니다. id={}, urlId={}", member.getMemId(), memId);
		}
		model.addAttribute("userDetail",service.memberId(member));
		return service.memberId(member); 
	}
	
	
	
	@RequestMapping(value="/update/{memId}",method=RequestMethod.POST)
	public @ResponseBody MemberDTO update(@PathVariable String memId,
			HttpSession session,
			Model model
			) {
		logger.info("MemberController-update POST() id={}", memId);
		
		member = (MemberDTO) session.getAttribute("user");
		memId = member.getMemId();
		member.setMemId(memId);
		
		member = service.memberId(member);
		model.addAttribute("userDetail", member);
		return service.update(member);
	}

	@RequestMapping("/delete")
	public @ResponseBody MemberDTO delete(Model model,HttpSession session){
		logger.info(" member-delete() ");
		MemberDTO result = service.remove((MemberDTO) session.getAttribute("user"));
		if (result == null) {
			logger.info("회원탈퇴 성공");
		} else {
			logger.info("회원탈퇴 실패");
		}
		return service.remove(member);
	}
	
	@RequestMapping("/list")
	public @ResponseBody List<MemberDTO> list(){
		logger.info("member-list()GET");
		List<MemberDTO> list =  new ArrayList<MemberDTO>();
		list = service.memberList();
		return list;
	}
	@RequestMapping("/count")
	public int count(Model model){
		return service.count();
	}   
	
	@RequestMapping("/hotResList/{memId}/{strPageNo}")
	public @ResponseBody Model getHotResList(@PathVariable String memId, @PathVariable String strPageNo, Model model){
		logger.info("member-hotResList : getHotResList() 진입");
		int cnt = hotResService.countHotelReservationByMemId(memId);
		
		Paging paging = PagingFactory.createPaging(strPageNo, cnt);
		hotRes.setMemId(memId);
		List<HotelReservationDTO> list = hotResService.selectListByMemId(hotRes);
		
		logger.info("count = {},  list.size = {}",cnt, list.size());
		model.addAttribute("hotRes", list);
		model.addAttribute("paging", paging);
		return model;
	}
	
	@RequestMapping("/fliResList/{memId}/{strPageNo}")
	public @ResponseBody Model getFliResList(@PathVariable String memId, @PathVariable String strPageNo, Model model){
		logger.info("member-fliResList : getFliResList() 진입");
		int cnt = fliResService.countFlightReservationByMemId(memId);
		
		Paging paging = PagingFactory.createPaging(strPageNo, cnt);
		fliRes.setMemId(memId);
		List<FlightReservationDTO> list = fliResService.selectListByMemId(fliRes);
		
		logger.info("count = {},  list.size = {}",cnt, list.size());
		model.addAttribute("fliRes", list);
		model.addAttribute("paging", paging);
		return model;
	}
}