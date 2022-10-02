package com.tistory.mabb.member.domain;

public class Member {
	private String memberId;
	private String nickName;
	private String memberPwd;

	public Member() {
	}

	public Member(String memberId, String nickName, String memberPwd) {
		super();
		this.memberId = memberId;
		this.nickName = nickName;
		this.memberPwd = memberPwd;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getMemberPwd() {
		return memberPwd;
	}

	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}

	@Override
	public String toString() {
		return "Member [memberId=" + memberId + ", nickName=" + nickName + ", memberPwd=" + memberPwd + "]";
	}

}
