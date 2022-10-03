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
	public int selectParticipantCheck(SqlSession session, String loginUserNickname, int voteNo) {
		HashMap<String,Integer> hashMap = new HashMap<>();
		hashMap.put(loginUserNickname, voteNo);
		return session.selectOne("VoteMapper.selectCheckParticipant",hashMap);
	}

}
