package com.tistory.mabb.member.domain;

public class SecondKeyword {
	private int keywordNo;
	private String SecondKeyword;
	
	public SecondKeyword() {}
	
	public SecondKeyword(int keywordNo, String secondKeyword) {
		super();
		this.keywordNo = keywordNo;
		SecondKeyword = secondKeyword;
	}
	@Override
	public String toString() {
		return "SecondKeyword [keywordNo=" + keywordNo + ", SecondKeyword=" + SecondKeyword + "]";
	}
	public int getKeywordNo() {
		return keywordNo;
	}
	public void setKeywordNo(int keywordNo) {
		this.keywordNo = keywordNo;
	}
	public String getSecondKeyword() {
		return SecondKeyword;
	}
	public void setSecondKeyword(String secondKeyword) {
		SecondKeyword = secondKeyword;
	}

	
	
	
}
