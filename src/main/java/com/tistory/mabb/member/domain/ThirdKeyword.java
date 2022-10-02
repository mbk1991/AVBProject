package com.tistory.mabb.member.domain;

public class ThirdKeyword {
	private int keywordNo;
	private String ThirdKeyword;
	
	
	public ThirdKeyword() {}
	
	public ThirdKeyword(int keywordNo, String thirdKeyword) {
		super();
		this.keywordNo = keywordNo;
		ThirdKeyword = thirdKeyword;
	}
	public int getKeywordNo() {
		return keywordNo;
	}
	public void setKeywordNo(int keywordNo) {
		this.keywordNo = keywordNo;
	}
	public String getThirdKeyword() {
		return ThirdKeyword;
	}
	public void setThirdKeyword(String thirdKeyword) {
		ThirdKeyword = thirdKeyword;
	}
	@Override
	public String toString() {
		return "ThirdKeyword [keywordNo=" + keywordNo + ", ThirdKeyword=" + ThirdKeyword + "]";
	}
	
	
}
