package com.genietour.www.flight.flightreservation;

import java.util.List;

public interface FlightReservationService {
	
	public int insertFlightReservaion(FlightReservationDTO flightReservation);
	public int insertFlightReservaionWithNoCode(FlightReservationDTO flightReservation);
	
	public List<FlightReservationDTO> selectListAll();
	public List<FlightReservationDTO> selectListByResDate(FlightReservationDTO fliRes);
	public List<FlightReservationDTO> selectListByKorName(FlightReservationDTO fliRes);
	public List<FlightReservationDTO> selectListByMemId(FlightReservationDTO fliRes);
	public int countFlgihtReservaion();
	/*public int countIdByReservation(FlightReservationDTO fliRes);*/
	
	/**
	 * U : update 권한 2가지로 나눔
	 * 여권이름 및 영문이름은 함부로 수정 불가하므로 관리자 권한 가진 사람만 수정 가능
	 * 일반 회원은 예약 후 자신의 핸드폰, 좌석, 코멘트만 수정 가능
	 * */
	// 회원개인 권한 예약정보 수정 - 핸드폰, 좌석번호, 코멘트 수정가능
	public int updateMember(FlightReservationDTO fliRes); 
	// 관리자 권한 예약정보 수정 - 영문이름, 핸드폰, 좌석, 코멘트, 여권번호 수정가능
	public int updateAdmin(FlightReservationDTO fliRes); 
	
	// 예약완료시 좌석수 감소
	public int updateVacancy(FlightReservationDTO fliRes);
	
	public int deleteFlightReservation(FlightReservationDTO fliRes);
	public int countFlightReservationByMemId(String memId);
}
