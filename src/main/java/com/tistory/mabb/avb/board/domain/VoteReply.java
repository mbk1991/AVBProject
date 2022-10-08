package com.tistory.mabb.avb.board.domain;

import java.sql.Timestamp;

public class VoteReply {
	private int replyNo; //댓글 식별 번호
	private int voteNo; // 투표 게시물 번호
    private int refReplyNo; //참조 댓글 번호
    private String reReplyYn; // 대댓글 여부
    private String replyWriter;  // 댓글 작성자
    private String replyContents;  // 댓글 내용
    private Timestamp replyTime; //댓글 작성 시각
    private String rStatus ;// 댓글 삭제 여부 N디폴트.
    private String memberId;
    
    public VoteReply() {}

	public VoteReply(int replyNo, int voteNo, int refReplyNo, String reReplyYn, String replyWriter,
			String replyContents, Timestamp replyTime, String rStatus, String memberId) {
		super();
		this.replyNo = replyNo;
		this.voteNo = voteNo;
		this.refReplyNo = refReplyNo;
		this.reReplyYn = reReplyYn;
		this.replyWriter = replyWriter;
		this.replyContents = replyContents;
		this.replyTime = replyTime;
		this.rStatus = rStatus;
		this.memberId = memberId;
	}

	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public int getVoteNo() {
		return voteNo;
	}

	public void setVoteNo(int voteNo) {
		this.voteNo = voteNo;
	}

	public int getRefReplyNo() {
		return refReplyNo;
	}

	public void setRefReplyNo(int refReplyNo) {
		this.refReplyNo = refReplyNo;
	}

	public String getReReplyYn() {
		return reReplyYn;
	}

	public void setReReplyYn(String reReplyYn) {
		this.reReplyYn = reReplyYn;
	}

	public String getReplyWriter() {
		return replyWriter;
	}

	public void setReplyWriter(String replyWriter) {
		this.replyWriter = replyWriter;
	}

	public String getReplyContents() {
		return replyContents;
	}

	public void setReplyContents(String replyContents) {
		this.replyContents = replyContents;
	}

	public Timestamp getReplyTime() {
		return replyTime;
	}

	public void setReplyTime(Timestamp replyTime) {
		this.replyTime = replyTime;
	}

	public String getrStatus() {
		return rStatus;
	}

	public void setrStatus(String rStatus) {
		this.rStatus = rStatus;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	@Override
	public String toString() {
		return "VoteReply [replyNo=" + replyNo + ", voteNo=" + voteNo + ", refReplyNo=" + refReplyNo + ", reReplyYn="
				+ reReplyYn + ", replyWriter=" + replyWriter + ", replyContents=" + replyContents + ", replyTime="
				+ replyTime + ", rStatus=" + rStatus + ", memberId=" + memberId + "]";
	}

	
    
}
