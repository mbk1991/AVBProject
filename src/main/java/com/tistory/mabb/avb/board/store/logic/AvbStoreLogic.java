package com.tistory.mabb.avb.board.store.logic;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.tistory.mabb.avb.board.domain.VoteBoard;
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
	public int updateCount(SqlSession session, String countLabel, Integer voteNo) {
		HashMap<String,String> hashMap = new HashMap<String, String>();
		hashMap.put("countLabel",countLabel);
		hashMap.put("voteNo",voteNo.toString());
		
		return session.update("VoteMapper.updateCount", hashMap);
	}

}
