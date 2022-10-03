package com.tistory.mabb.avb.board.service.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tistory.mabb.avb.board.domain.VoteBoard;
import com.tistory.mabb.avb.board.service.AvbService;
import com.tistory.mabb.avb.board.store.AvbStore;

@Service
public class AvbServiceImpl implements AvbService {
	@Autowired
	AvbStore aStore;
	@Autowired
	SqlSession session;

	@Override
	public int registerVote(VoteBoard vote) {
		return aStore.insertVote(session,vote);
	}

	@Override
	public List<VoteBoard> printAllVote() {
		return aStore.selectAllVote(session);
	}

	@Override
	public int countAllVote() {
		return aStore.countAllVote(session);
	}

	@Override
	public int participantCheck(String loginUserNickname, Integer voteNo) {
		return aStore.selectParticipantCheck(session, loginUserNickname, voteNo);
	}

	@Override
	public VoteBoard printOneVote(int voteNo) {
		return aStore.selectOneVote(session, voteNo);
	}

	@Override
	public int addCount(String countLabel, Integer voteNo) {
		return aStore.updateCount(session, countLabel, voteNo);
	}

}
