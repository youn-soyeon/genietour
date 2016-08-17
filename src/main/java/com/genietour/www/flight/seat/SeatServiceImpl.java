package com.genietour.www.flight.seat;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.genietour.www.mapper.SeatMapper;

@Service
public class SeatServiceImpl implements SeatService {
	private static final Logger logger = LoggerFactory.getLogger(SeatServiceImpl.class);
	@Autowired SeatDTO seat;
	@Autowired SqlSession session;
	
	private SeatMapper getMapper() {
		return session.getMapper(SeatMapper.class);
	}
	
	@Override
	public int insertSeat(SeatDTO seat) {
		logger.info("SeatService : addSeat() 진입");
		
		return this.getMapper().insertSeat(seat);
	}

	@Override
	public List<SeatDTO> selectListAll() {
		logger.info("SeatService : seatAllList() 진입");
		return this.getMapper().selectListAll();
	}

	@Override
	public SeatDTO selectSeatBySeatCode(SeatDTO seat) {
		logger.info("SeatService : priceBySeat() 진입");
		return this.getMapper().selectSeatBySeatCode(seat);
	}

	@Override
	public int countSeat() {
		logger.info("SeatService : countSeat() 진입");
		return this.getMapper().countSeat();
	}

	@Override
	public int updateSeat(SeatDTO seat) {
		logger.info("SeatService : updateSeat() 진입");
		return this.getMapper().updateSeat(seat);
	}

	@Override
	public int deleteSeat(SeatDTO seat) {
		logger.info("SeatService : deleteSeat() 진입");
		return this.getMapper().deleteSeat(seat);
	}

	
	
	
	
	@Override
	public List<SeatDTO> selectListByFliCode(SeatDTO seat) {
		logger.info("SeatService : selectListByFliCode() 진입");
		return this.getMapper().selectListByFliCode(seat);
	}

}
