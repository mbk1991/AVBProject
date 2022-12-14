package com.tistory.mabb.avb.member.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.tistory.mabb.avb.member.domain.FirstKeyword;
import com.tistory.mabb.avb.member.domain.Member;
import com.tistory.mabb.avb.member.domain.SecondKeyword;
import com.tistory.mabb.avb.member.domain.ThirdKeyword;
import com.tistory.mabb.avb.member.store.MemberStore;

@Repository
public class MemberStoreLogic implements MemberStore{

	@Override
	public List<FirstKeyword> selectFirst(SqlSession session) {
		return session.selectList("FirstKeywordMapper.selectFirstKeyword");
	}

	@Override
	public List<SecondKeyword> selectSecond(SqlSession session) {
		return session.selectList("SecondKeywordMapper.selectSecondKeyword");
	}

	@Override
	public List<ThirdKeyword> selectThird(SqlSession session) {
		return session.selectList("ThirdKeywordMapper.selectThirdKeyword");
	}

	@Override
	public int checkNickname(SqlSession session,String combineNickname) {
		return session.selectOne("Membermapper.selectCheckNickname", combineNickname);
	}

	@Override
	public int checkId(SqlSession session, String inputId) {
		return session.selectOne("Membermapper.selectCheckId", inputId);
	}

	@Override
	public int insertMember(SqlSession session, Member member) {
		return session.insert("Membermapper.insertMember", member);
	}

	@Override
	public Member loginMember(SqlSession session, Member member) {
		return session.selectOne("Membermapper.selectLoginMember",member);
	}

}
