package com.genietour.www.member;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.genietour.www.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService{
	
	private static final Logger logger = LoggerFactory.getLogger(MemberServiceImpl.class);

	@Autowired SqlSession session;

	private MemberMapper getMapper() {
		return session.getMapper(MemberMapper.class);
	}
	
	@Override
	public int insert(MemberDTO member) {
		logger.info("MemberService-join 진입 후 ID="+member.getMemId());
		return this.getMapper().insert(member);
	}

	@Override
	public List<MemberDTO> memberList() {
		logger.info("MemberService-memberList 진입 후 ");
		return this.getMapper().selectAll();
	}

	@Override
	public List<MemberDTO> memberNames(MemberDTO member) {
		logger.info("MemberService-memberNames");
		return this.getMapper().selectByName(member);
	}

	@Override
	public MemberDTO memberId(MemberDTO member) {
		logger.info("MemberService-memberID 진입 후 ID"+member.getMemId());
		return this.getMapper().selectById(member);
	}

	@Override
	public MemberDTO login(MemberDTO member) {
		logger.info("MemberService-login 진입 후 id={}", member.getMemId());
		return this.getMapper().login(member);
	}

	@Override
	public int count() {
		logger.info("MemberService-count");
		return this.getMapper().count();
	}

	@Override
	public MemberDTO update(MemberDTO member) {
		logger.info("MemberService-update");
		return this.getMapper().update(member);
	}

	@Override
	public MemberDTO remove(MemberDTO member) {
		logger.info("MemberService-remove 진입  ");
		return this.getMapper().delete(member);
	}

}
