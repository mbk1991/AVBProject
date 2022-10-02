package com.tistory.mabb.avb.domain;

import java.sql.Timestamp;

public class VoteBoard {

	private int voteNo;
	private String voteWriter;
	private String voteTitle;
	private String voteContents;
	private String voteContinue;
	private int viewCount;
	private String firstLabel;
	private String secondLabel;
	private String thirdLabel;
	private String fourthLabel;
	private String fifthLabel;
	private int firstCount;
	private int secondCount;
	private int thirdCount;
	private int fourthCount;
	private int fifthCount;
	private Timestamp voteTime;
	private String voteStatus;
	
	
	public VoteBoard() {}

	public VoteBoard(int voteNo, String voteWriter, String voteTitle, String voteContents, String voteContinue,
			int viewCount, String firstLabel, String secondLabel, String thirdLabel, String fourthLabel,
			String fifthLabel, int firstCount, int secondCount, int thirdCount, int fourthCount, int fifthCount,
			Timestamp voteTime, String voteStatus) {
		super();
		this.voteNo = voteNo;
		this.voteWriter = voteWriter;
		this.voteTitle = voteTitle;
		this.voteContents = voteContents;
		this.voteContinue = voteContinue;
		this.viewCount = viewCount;
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
		this.voteTime = voteTime;
		this.voteStatus = voteStatus;
	}

	@Override
	public String toString() {
		return "VoteBoard [voteNo=" + voteNo + ", voteWriter=" + voteWriter + ", voteTitle=" + voteTitle
				+ ", voteContents=" + voteContents + ", voteContinue=" + voteContinue + ", viewCount=" + viewCount
				+ ", firstLabel=" + firstLabel + ", secondLabel=" + secondLabel + ", thirdLabel=" + thirdLabel
				+ ", fourthLabel=" + fourthLabel + ", fifthLabel=" + fifthLabel + ", firstCount=" + firstCount
				+ ", secondCount=" + secondCount + ", thirdCount=" + thirdCount + ", fourthCount=" + fourthCount
				+ ", fifthCount=" + fifthCount + ", voteTime=" + voteTime + ", voteStatus=" + voteStatus + "]";
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

	public String getVoteContinue() {
		return voteContinue;
	}

	public void setVoteContinue(String voteContinue) {
		this.voteContinue = voteContinue;
	}

	public int getViewCount() {
		return viewCount;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
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

}
