package com.tistory.mabb.avb.board.domain;

import java.sql.Timestamp;

public class VoteBoard {

	private int voteNo; //게시물 번호, 식별자
	private String voteWriter; // 작성자 닉네임
	private String voteTitle; // 제목
	private String voteContents; // 내용
	private String voteEnd; // 투표 진행상태
	private int viewCount; // 조회수
	private int replyCount; //댓글수 트리거로
	private String firstLabel;//항목1 라벨
	private String secondLabel;//항목2 라벨
	private String thirdLabel; //항목3 라벨
	private String fourthLabel; //항목4 라벨
	private String fifthLabel; // 항목5 라벨
	private int firstCount; // 항목1 카운트
	private int secondCount; // 항목2 카운트
	private int thirdCount; // 항목3 카운트
	private int fourthCount; //항목4 카운트
	private int fifthCount; // 항목5 카운트
	private int sumCount; //합계
	private Timestamp voteTime; //작성 시각
	private String voteStatus; // 게시물 상태
	private int participantLimit; //참여자 수 제한
	
	
	public VoteBoard() {}


	public VoteBoard(int voteNo, String voteWriter, String voteTitle, String voteContents, String voteEnd,
			int viewCount, int replyCount, String firstLabel, String secondLabel, String thirdLabel, String fourthLabel,
			String fifthLabel, int firstCount, int secondCount, int thirdCount, int fourthCount, int fifthCount,
			int sumCount, int participantLimit, Timestamp voteTime, String voteStatus) {
		super();
		this.voteNo = voteNo;
		this.voteWriter = voteWriter;
		this.voteTitle = voteTitle;
		this.voteContents = voteContents;
		this.voteEnd = voteEnd;
		this.viewCount = viewCount;
		this.replyCount = replyCount;
		this.firstLabel = firstLabel;
		this.secondLabel = secondLabel;
		this.thirdLabel = thirdLabel;
		this.fourthLabel = fourthLabel;
		this.fifthLabel = fifthLabel;
		this.firstCount = firstCount;
		this.secondCount = secondCount;
		this.thirdCount = thirdCount;
		this.fourthCount = fourthCount;
		this.fifthCount = fifthCount;
		this.sumCount = sumCount;
		this.participantLimit = participantLimit;
		this.voteTime = voteTime;
		this.voteStatus = voteStatus;
	}


	public int getVoteNo() {
		return voteNo;
	}


	public void setVoteNo(int voteNo) {
		this.voteNo = voteNo;
	}


	public String getVoteWriter() {
		return voteWriter;
	}


	public void setVoteWriter(String voteWriter) {
		this.voteWriter = voteWriter;
	}


	public String getVoteTitle() {
		return voteTitle;
	}


	public void setVoteTitle(String voteTitle) {
		this.voteTitle = voteTitle;
	}


	public String getVoteContents() {
		return voteContents;
	}


	public void setVoteContents(String voteContents) {
		this.voteContents = voteContents;
	}


	public String getVoteEnd() {
		return voteEnd;
	}


	public void setVoteEnd(String voteEnd) {
		this.voteEnd = voteEnd;
	}


	public int getViewCount() {
		return viewCount;
	}


	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}


	public int getReplyCount() {
		return replyCount;
	}


	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}


	public String getFirstLabel() {
		return firstLabel;
	}


	public void setFirstLabel(String firstLabel) {
		this.firstLabel = firstLabel;
	}


	public String getSecondLabel() {
		return secondLabel;
	}


	public void setSecondLabel(String secondLabel) {
		this.secondLabel = secondLabel;
	}


	public String getThirdLabel() {
		return thirdLabel;
	}


	public void setThirdLabel(String thirdLabel) {
		this.thirdLabel = thirdLabel;
	}


	public String getFourthLabel() {
		return fourthLabel;
	}


	public void setFourthLabel(String fourthLabel) {
		this.fourthLabel = fourthLabel;
	}


	public String getFifthLabel() {
		return fifthLabel;
	}


	public void setFifthLabel(String fifthLabel) {
		this.fifthLabel = fifthLabel;
	}


	public int getFirstCount() {
		return firstCount;
	}


	public void setFirstCount(int firstCount) {
		this.firstCount = firstCount;
	}


	public int getSecondCount() {
		return secondCount;
	}


	public void setSecondCount(int secondCount) {
		this.secondCount = secondCount;
	}


	public int getThirdCount() {
		return thirdCount;
	}


	public void setThirdCount(int thirdCount) {
		this.thirdCount = thirdCount;
	}


	public int getFourthCount() {
		return fourthCount;
	}


	public void setFourthCount(int fourthCount) {
		this.fourthCount = fourthCount;
	}


	public int getFifthCount() {
		return fifthCount;
	}


	public void setFifthCount(int fifthCount) {
		this.fifthCount = fifthCount;
	}


	public int getSumCount() {
		return sumCount;
	}


	public void setSumCount(int sumCount) {
		this.sumCount = sumCount;
	}


	public int getParticipantLimit() {
		return participantLimit;
	}


	public void setParticipantLimit(int participantLimit) {
		this.participantLimit = participantLimit;
	}


	public Timestamp getVoteTime() {
		return voteTime;
	}


	public void setVoteTime(Timestamp voteTime) {
		this.voteTime = voteTime;
	}


	public String getVoteStatus() {
		return voteStatus;
	}


	public void setVoteStatus(String voteStatus) {
		this.voteStatus = voteStatus;
	}


	@Override
	public String toString() {
		return "VoteBoard [voteNo=" + voteNo + ", voteWriter=" + voteWriter + ", voteTitle=" + voteTitle
				+ ", voteContents=" + voteContents + ", voteEnd=" + voteEnd + ", viewCount=" + viewCount
				+ ", replyCount=" + replyCount + ", firstLabel=" + firstLabel + ", secondLabel=" + secondLabel
				+ ", thirdLabel=" + thirdLabel + ", fourthLabel=" + fourthLabel + ", fifthLabel=" + fifthLabel
				+ ", firstCount=" + firstCount + ", secondCount=" + secondCount + ", thirdCount=" + thirdCount
				+ ", fourthCount=" + fourthCount + ", fifthCount=" + fifthCount + ", sumCount=" + sumCount
				+ ", participantLimit=" + participantLimit + ", voteTime=" + voteTime + ", voteStatus=" + voteStatus
				+ "]";
	}

	
}