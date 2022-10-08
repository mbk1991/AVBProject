package com.tistory.mabb.avb.board.store.logic;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.tistory.mabb.avb.board.domain.VoteBoard;
import com.tistory.mabb.avb.board.domain.VoteReply;
import com.tistory.mabb.avb.board.store.AvbStore;

@Repository
public class AvbStoreLogic implements AvbStore{

	@Override
	public int insertVote(SqlSession session,VoteBoard vote) {
		return session.insert("VoteMapper.insertVote", vote);
	}

	@Override
	public List<VoteBoard> selectAllVote(SqlSession session) {
		return session.selectList("VoteMapper.selectAllVote");
	}

	@Override
	public int countAllVote(SqlSession session) {
		return session.selectOne("VoteMapper.countAllVote");
	}

	@Override
	public int selectParticipantCheck(SqlSession session, String loginUserNickname, Integer voteNo) {
		HashMap<String,String> hashMap = new HashMap<>();
		hashMap.put("loginUserNickname", loginUserNickname);
		hashMap.put("voteNo",voteNo.toString());
		return session.selectOne("VoteMapper.selectCheckParticipant",hashMap);
	}

	@Override
	public VoteBoard selectOneVote(SqlSession session, int voteNo) {
		return session.selectOne("VoteMapper.selectOneVote",voteNo);
	}

	@Override
	public int updateCount(SqlSession session, String column, Integer voteNo) {
		
		HashMap<String,Object> hashMap = new HashMap<>();
		hashMap.put("column",column);
		hashMap.put("voteNo",voteNo);
		int result = session.update("VoteMapper.updateCount", hashMap);
		
		return result;
	}

	@Override
	public int insertParticipant(SqlSession session, String loginNickname, Integer voteNo, Integer voteCheck) {
		HashMap<String,String> hashMap = new HashMap<>();
		hashMap.put("loginNickname",loginNickname);
		hashMap.put("voteNo",voteNo.toString());
		hashMap.put("voteCheck",voteCheck.toString());
		
		return session.insert("VoteMapper.insertParticipant", hashMap);
	}

	@Override
	public int updateSumCount(SqlSession session, Integer voteNo) {
		return session.update("VoteMapper.updateSumCount", voteNo);
	}

	@Override
	public int updateVoteEnd(SqlSession session, Integer voteNo) {
		return session.update("VoteMapper.updateVoteEnd",voteNo);
	}

	@Override
	public int selectUserChoice(SqlSession session, Integer voteNo, String voteWriterId) {
		HashMap<String,Object> hashMap = new HashMap<>();
		hashMap.put("voteNo",voteNo );
		hashMap.put("voteWriterId",voteWriterId);
		return session.selectOne("VoteMapper.selectUserChoice",hashMap);
	}

	@Override
	public List<VoteReply> selectOriginalReply(SqlSession session, Integer voteNo) {
		return session.selectList("VoteReplyMapper.selectAllReply",voteNo);
	}
	
//	@Override
//	public List<VoteReply> selectReReply(SqlSession session, Integer voteNo, Integer refReplyNo) {
//		HashMap<String,Integer> hashMap = new HashMap<>();
//		hashMap.put("voteNo",voteNo);
//		hashMap.put("refReplyNo",refReplyNo);
//		
//		return session.selectList("VoteReplyMapper.selectReReply",voteNo);
//	}

	@Override
	public int insertOriginalReply(SqlSession session, VoteReply vReply) {
		return session.insert("VoteReplyMapper.insertOriginalReply", vReply) ;
	}
	
	@Override
	public int insertReReply(SqlSession session, VoteReply vReply) {
		return session.insert("VoteReplyMapper.insertReReply",vReply);
	}

	@Override
	public int updateReply(SqlSession session, VoteReply vReply) {
		return session.update("VoteReplyMapper.updateReply", vReply);
	}

	@Override
	public int deleteReply(SqlSession session, Integer replyNo) {
		return session.delete("VoteReplyMapper.deleteReply",replyNo);
	}






}
