package com.tistory.mabb.member.service;

import java.util.List;

import com.tistory.mabb.member.domain.FirstKeyword;
import com.tistory.mabb.member.domain.Member;
import com.tistory.mabb.member.domain.SecondKeyword;
import com.tistory.mabb.member.domain.ThirdKeyword;

public interface MemberService {
	public List<FirstKeyword> getFirst();
	public List<SecondKeyword> getSecond();
	public List<ThirdKeyword> getThird();
	public int checkNickname(String combineNickname);
	public int checkId(String inputId);
	public int registerMember(Member member);
}
