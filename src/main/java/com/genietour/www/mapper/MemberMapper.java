package com.genietour.www.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.genietour.www.member.MemberDTO;

@Repository
public interface MemberMapper {
	public abstract int insert(MemberDTO member);
	public List<MemberDTO> selectAll();
	public List<MemberDTO> selectByName(MemberDTO member);
	public MemberDTO selectById(MemberDTO member);
	public MemberDTO login(MemberDTO member);
	public int count();
	public MemberDTO update(MemberDTO member);
	public MemberDTO delete(MemberDTO member);
}
