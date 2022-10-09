package com.tistory.mabb.avb.common;

public class Search {
	private String searchCondition;
	private String searchValue;
	private String searchFilter;

	Search(){}

	public Search(String searchCondition, String searchValue, String searchFilter) {
		super();
		this.searchCondition = searchCondition;
		this.searchValue = searchValue;
		this.searchFilter = searchFilter;
	}

	public String getSearchCondition() {
		return searchCondition;
	}

	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}

	public String getSearchValue() {
		return searchValue;
	}

	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}

	public String getSearchFilter() {
		return searchFilter;
	}

	public void setSearchFilter(String searchFilter) {
		this.searchFilter = searchFilter;
	}

	@Override
	public String toString() {
		return "Search [searchCondition=" + searchCondition + ", searchValue=" + searchValue + ", searchFilter="
				+ searchFilter + "]";
	}
	
	
}
