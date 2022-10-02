package com.tistory.mabb.avb.domain;

import java.sql.Timestamp;

public class VoteReply {
	private int replyNo;
	private int voteNo;
    private int refReplyNo;
    private String reReplyYn;
    private String replyWriter;
    private String replyContents;
    private Timestamp replyTime;
    
    public VoteReply() {}
    
	public VoteReply(int replyNo, int voteNo, int refReplyNo, String reReplyYn, String replyWriter,
			String replyContents, Timestamp replyTime) {
		super();
		this.replyNo = replyNo;
		this.voteNo = voteNo;
		this.refReplyNo = refReplyNo;
		this.reReplyYn = reReplyYn;
		this.replyWriter = replyWriter;
		this.replyContents = replyContents;
		this.replyTime = replyTime;
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
	@Override
	public String toString() {
		return "VoteReply [replyNo=" + replyNo + ", voteNo=" + voteNo + ", refReplyNo=" + refReplyNo + ", reReplyYn="
				+ reReplyYn + ", replyWriter=" + replyWriter + ", replyContents=" + replyContents + ", replyTime="
				+ replyTime + "]";
	}
    
    
    
    
    
}
