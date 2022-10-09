package com.tistory.mabb.avb.board.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.tistory.mabb.avb.board.domain.VoteBoard;
import com.tistory.mabb.avb.board.domain.VoteReply;
import com.tistory.mabb.avb.common.Paging;
import com.tistory.mabb.avb.common.Search;

public interface AvbStore {
	public int insertVote(SqlSession session, VoteBoard vote);
	public int insertParticipant(SqlSession session,String loginNickname, Integer voteNo, Integer voteCheck);
	
	public List<VoteBoard> selectAllVote(SqlSession session,Paging paging);
	public List<VoteBoard> selectSearchVote(SqlSession session,Paging paging,Search search);
	public int countAllVote(SqlSession session);
	public int countSearchVote(SqlSession session, Search search);
	public int selectParticipantCheck(SqlSession session,String loginUserNickname, Integer voteNo);
	public VoteBoard selectOneVote(SqlSession session,int voteNo);
	public int updateCount(SqlSession session,String column,Integer voteNo);
	public int updateSumCount(SqlSession session,Integer voteNo);
	public int updateVoteEnd(SqlSession session, Integer voteNo);
	public int selectUserChoice(SqlSession session, Integer voteNo, String voteWriterId);

	//댓글
	public List<VoteReply> selectOriginalReply(SqlSession session, Integer voteNo);
	public int insertOriginalReply(SqlSession session, VoteReply vReply);
	public int insertReReply(SqlSession session, VoteReply vReply);
	public int updateReply(SqlSession session, VoteReply vReply);
	public int deleteReply(SqlSession session, Integer replyNo);

}
