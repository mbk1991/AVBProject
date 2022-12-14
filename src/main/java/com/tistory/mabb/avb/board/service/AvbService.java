package com.tistory.mabb.avb.board.service;

import java.util.List;

import com.tistory.mabb.avb.board.domain.VoteBoard;
import com.tistory.mabb.avb.board.domain.VoteReply;
import com.tistory.mabb.avb.common.Paging;
import com.tistory.mabb.avb.common.Search;

public interface AvbService {
	public int registerVote(VoteBoard vote);
	public int registerParticipant(String loginNickname, Integer voteNo, Integer voteCheck);

	public List<VoteBoard> printAllVote(Paging paging);
	public List<VoteBoard> searchVote(Paging paging,Search search);
	public int countAllVote();
	public int countSearchVote(Search search);
	public int participantCheck(String loginUserNickname, Integer voteNo);
	public VoteBoard printOneVote(int voteNo);
	public int addCount(String column,Integer voteNo);
	public int sumCount(Integer voteNo);
	public int modifyVoteEnd(Integer voteNo);
	public int getUserChoice(Integer voteNo, String voteWriterId);
	
	
	
	//댓글
	public List<VoteReply> printOriginalReply(Integer voteNo);
	public int registerOriginalReply(VoteReply vReply);
	public int registerReReply(VoteReply vReply);
	public int modifyReply(VoteReply vReply);
	public int removeReply(Integer replyNo);
	
	

	
}
