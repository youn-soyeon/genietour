package com.genietour.www.flight.flight;

import java.util.List;

public interface FlightService {
	// 항공 등록
	public int insertFlight(FlightDTO flight);

	// 모든 항공편 리스트 조회
	public List<FlightDTO> selectListAll();
	
	// 항공 리스트 항공코드조회
	public FlightDTO selectFlightByFliCode(FlightDTO flight);
	
	// 항공 리스트 항공사이름으로 조회
	public List<FlightDTO> selectListByAirline(FlightDTO flight);
	
	// 항공사 이름만 가져오기
	public List<FlightDTO> selectListAirline();
	
	// 도시 리스트 조회
	public List<FlightDTO> selectListDepCity();
	public List<FlightDTO> selectListArrCity();
	
	// 출발도시 선택시 도착도시 리스트 조회
	public List<FlightDTO> selectListDepByArrCity(FlightDTO flight);

	// 항공 수 조회
	public int countFlight();
	
	// 항공 수정
	public int updateFlight(FlightDTO flight);
	
	// 항공 삭제
	public int deleteFlight(FlightDTO flight);

	//마지막 항공코드번호
	public int selectMaxFliCode();
	public int selectNextFliCode();
}
