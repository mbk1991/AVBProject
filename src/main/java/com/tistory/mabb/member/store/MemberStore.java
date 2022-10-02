package com.tistory.mabb.member.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.tistory.mabb.member.domain.FirstKeyword;
import com.tistory.mabb.member.domain.Member;
import com.tistory.mabb.member.domain.SecondKeyword;
import com.tistory.mabb.member.domain.ThirdKeyword;

public interface MemberStore {
	public List<FirstKeyword> selectFirst(SqlSession session);
	public List<SecondKeyword> selectSecond(SqlSession session);
	public List<ThirdKeyword> selectThird(SqlSession session);
	public int checkNickname(SqlSession session, String combineNickname);
	public int checkId(SqlSession session, String inputId);
	public int insertMember(SqlSession session, Member member);
}
