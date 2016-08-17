package com.genietour.www.member;

import java.util.List;

public interface MemberService {
	public abstract int insert(MemberDTO member);
	public List<MemberDTO> memberList();
	public List<MemberDTO> memberNames(MemberDTO member);
	public MemberDTO memberId(MemberDTO member);
	public MemberDTO login(MemberDTO member);
	public int count();
	public MemberDTO update(MemberDTO member);
	public MemberDTO remove(MemberDTO member);
}
