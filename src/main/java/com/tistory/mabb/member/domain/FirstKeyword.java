package com.tistory.mabb.member.domain;

public class FirstKeyword {
	private int keywordNo;
	private String FirstKeyword;

	
	public FirstKeyword() {}
	
	public FirstKeyword(int keywordNo, String firstKeyword) {
		super();
		this.keywordNo = keywordNo;
		FirstKeyword = firstKeyword;
	}

	@Override
	public String toString() {
		return "FirstKeyword [keywordNo=" + keywordNo + ", FirstKeyword=" + FirstKeyword + "]";
	}

	public int getKeywordNo() {
		return keywordNo;
	}

	public void setKeywordNo(int keywordNo) {
		this.keywordNo = keywordNo;
	}

	public String getFirstKeyword() {
		return FirstKeyword;
	}

	public void setFirstKeyword(String firstKeyword) {
		FirstKeyword = firstKeyword;
	}

}
