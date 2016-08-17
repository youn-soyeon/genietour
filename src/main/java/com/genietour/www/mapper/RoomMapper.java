package com.genietour.www.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.genietour.www.hotel.room.RoomDTO;
@Repository
public interface RoomMapper {
	public int insertRoom(RoomDTO room);
	
	public List<RoomDTO> selectListAll();
	public List<RoomDTO> selectListByRoomType(RoomDTO room);
	public List<RoomDTO> selectListByPrice(RoomDTO room);
	public RoomDTO selectRoomByRoomCode(RoomDTO room);
	public RoomDTO selectRoomByHotCodeRoomType(RoomDTO room);
	public int countRoom();
	public int updateRoom(RoomDTO room);
	public int deleteRoom(RoomDTO room);
	
	public List<RoomDTO> selectListByHotCode(RoomDTO room);
}
