package com.tistory.mabb.avb.board.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.tistory.mabb.avb.board.domain.VoteBoard;

public interface AvbStore {
	public int insertVote(SqlSession session, VoteBoard vote);
	public List<VoteBoard> selectAllVote(SqlSession session);
	public int countAllVote(SqlSession session);
	public int selectParticipantCheck(SqlSession session,String loginUserNickname, int voteNo);
}
