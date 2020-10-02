package com.sample.web.dto;

public class CommunityTagsDto {
	private long tagNo;
	private String tagName;
	private long categoryNo;
	private String categoryName;
	
	public CommunityTagsDto() {
		// TODO Auto-generated constructor stub
	}

	public long getTagNo() {
		return tagNo;
	}

	public void setTagNo(long tagNo) {
		this.tagNo = tagNo;
	}

	public String getTagName() {
		return tagName;
	}

	public void setTagName(String tagName) {
		this.tagName = tagName;
	}

	public long getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(long categoryNo) {
		this.categoryNo = categoryNo;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	
	
}
