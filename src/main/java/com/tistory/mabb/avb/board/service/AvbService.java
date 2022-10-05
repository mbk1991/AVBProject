package com.tistory.mabb.avb.board.service;

import java.util.List;

import com.tistory.mabb.avb.board.domain.VoteBoard;

public interface AvbService {
	public int registerVote(VoteBoard vote);
	public int registerParticipant(String loginNickname, Integer voteNo, Integer voteCheck);
	
	public List<VoteBoard> printAllVote();
	public int countAllVote();
	public int participantCheck(String loginUserNickname, Integer voteNo);
	public VoteBoard printOneVote(int voteNo);
	public int addCount(String column,Integer voteNo);
	public int sumCount(Integer voteNo);
	public int modifyVoteEnd(Integer voteNo);
}
