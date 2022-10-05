package com.tistory.mabb.avb.board.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.tistory.mabb.avb.board.domain.VoteBoard;

public interface AvbStore {
	public int insertVote(SqlSession session, VoteBoard vote);
	public int insertParticipant(SqlSession session,String loginNickname, Integer voteNo, Integer voteCheck);
	
	public List<VoteBoard> selectAllVote(SqlSession session);
	public int countAllVote(SqlSession session);
	public int selectParticipantCheck(SqlSession session,String loginUserNickname, Integer voteNo);
	public VoteBoard selectOneVote(SqlSession session,int voteNo);
	public int updateCount(SqlSession session,String column,Integer voteNo);
	public int updateSumCount(SqlSession session,Integer voteNo);
	public int updateVoteEnd(SqlSession session, Integer voteNo);
}
