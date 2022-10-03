package com.tistory.mabb.avb.board.service;

import java.util.List;

import com.tistory.mabb.avb.board.domain.VoteBoard;

public interface AvbService {
	public int registerVote(VoteBoard vote);
	public List<VoteBoard> printAllVote();
	public int countAllVote();
	public int participantCheck(String loginUserNickname, int voteNo);
}
