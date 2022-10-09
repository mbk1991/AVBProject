package com.tistory.mabb.avb.board.service.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tistory.mabb.avb.board.domain.VoteBoard;
import com.tistory.mabb.avb.board.domain.VoteReply;
import com.tistory.mabb.avb.board.service.AvbService;
import com.tistory.mabb.avb.board.store.AvbStore;
import com.tistory.mabb.avb.common.Paging;
import com.tistory.mabb.avb.common.Search;

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
	public List<VoteBoard> printAllVote(Paging paging) {
		return aStore.selectAllVote(session,paging);
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
	public int addCount(String column, Integer voteNo) {
		return aStore.updateCount(session, column, voteNo);
	}

	@Override
	public int registerParticipant(String loginNickname, Integer voteNo, Integer voteCheck) {
		return aStore.insertParticipant(session, loginNickname, voteNo, voteCheck);
	}

	@Override
	public int sumCount(Integer voteNo) {
		return aStore.updateSumCount(session, voteNo);
	}

	@Override
	public int modifyVoteEnd(Integer voteNo) {
		return aStore.updateVoteEnd(session, voteNo);
	}

	@Override
	public int getUserChoice(Integer voteNo, String voteWriterId) {
		return aStore.selectUserChoice(session,voteNo,voteWriterId);
	}

	@Override
	public List<VoteReply> printOriginalReply(Integer voteNo) {
		return aStore.selectOriginalReply(session, voteNo);
	}
	

	@Override
	public int registerOriginalReply(VoteReply vReply) {
		return aStore.insertOriginalReply(session,vReply);
	}
	
	@Override
	public int registerReReply(VoteReply vReply) {
		return aStore.insertReReply(session, vReply);
	}

	@Override
	public int modifyReply(VoteReply vReply) {
		return aStore.updateReply(session,vReply);
	}

	@Override
	public int removeReply(Integer replyNo) {
		return aStore.deleteReply(session,replyNo);
	}

	@Override
	public List<VoteBoard> searchVote(Paging paging, Search search) {
		return aStore.selectSearchVote(session, paging, search);
	}

	@Override
	public int countSearchVote(Search search) {
		return aStore.countSearchVote(session, search);
	}






}
