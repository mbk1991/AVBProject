package com.tistory.mabb.avb.member.service.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tistory.mabb.avb.member.domain.FirstKeyword;
import com.tistory.mabb.avb.member.domain.Member;
import com.tistory.mabb.avb.member.domain.SecondKeyword;
import com.tistory.mabb.avb.member.domain.ThirdKeyword;
import com.tistory.mabb.avb.member.service.MemberService;
import com.tistory.mabb.avb.member.store.MemberStore;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	MemberStore mStore;
	@Autowired
	SqlSession session;

	@Override
	public List<FirstKeyword> getFirst() {
		return mStore.selectFirst(session);
	}

	@Override
	public List<SecondKeyword> getSecond() {
		return mStore.selectSecond(session);
	}

	@Override
	public List<ThirdKeyword> getThird() {
		return mStore.selectThird(session);
	}

	@Override
	public int checkNickname(String combineNickname) {
		return mStore.checkNickname(session, combineNickname);
	}

	@Override
	public int checkId(String inputId) {
		return mStore.checkId(session, inputId);
	}

	@Override
	public int registerMember(Member member) {
		return mStore.insertMember(session, member);
	}

	@Override
	public Member loginMember(Member member) {
		return mStore.loginMember(session, member);
	}


}
