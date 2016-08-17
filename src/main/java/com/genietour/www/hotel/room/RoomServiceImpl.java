package com.genietour.www.hotel.room;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.genietour.www.hotel.hotel.HotelService;
import com.genietour.www.mapper.RoomMapper;

@Service
public class RoomServiceImpl implements RoomService{
	private static final Logger logger = LoggerFactory.getLogger(HotelService.class);
	
	@Autowired	SqlSession session;

	private RoomMapper getMapper(){
		return session.getMapper(RoomMapper.class);
	}

	@Override
	public int insertRoom(RoomDTO room) {
		logger.info("----RoomService : insertRoom()----");
		return this.getMapper().insertRoom(room);
	}
	@Override
	public List<RoomDTO> selectListAll() {
		logger.info("----RoomService : selectListAll()----");
		return this.getMapper().selectListAll();
	}
	@Override
	public RoomDTO selectRoomByRoomCode(RoomDTO room) {
		logger.info("----RoomService : selectRoomByRoomCode()----");
		return this.getMapper().selectRoomByRoomCode(room);
	}
	@Override
	public List<RoomDTO> selectListByRoomType(RoomDTO room) {
		logger.info("----RoomService : selectListByRoomType()----");
		return this.getMapper().selectListByRoomType(room);
	}
	@Override
	public List<RoomDTO> selectListByPrice(RoomDTO room) {
		logger.info("----RoomService : selectListByPrice()----");
		return this.getMapper().selectListByPrice(room);
	}
	
	@Override
	public int countRoom() {
		logger.info("----RoomService : countRoom()----");
		return this.getMapper().countRoom();
	}
	@Override
	public int updateRoom(RoomDTO room) {
		logger.info("----RoomService : updateRoom()----");
		return this.getMapper().updateRoom(room);
	}
	@Override
	public int deleteRoom(RoomDTO room) {
		logger.info("----RoomService : deleteRoom()----");
		return this.getMapper().deleteRoom(room);
	}

	
	
	
	
	@Override
	public List<RoomDTO> selectListByHotCode(RoomDTO room) {
		logger.info("----RoomService : selectListByHotCode()----");
		return this.getMapper().selectListAll();
	}

	@Override
	public RoomDTO selectRoomByHotCodeRoomType(RoomDTO room) {
		logger.info("----RoomService : selectRoomByHotCodeRoomType()----");
		return this.getMapper().selectRoomByHotCodeRoomType(room);
	}
}
