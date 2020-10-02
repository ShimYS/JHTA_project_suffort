package com.sample.web.dto;

public class TagDto {
	private long tagNo;
	private String tagName;
	private long userTagNo;
	private long userBoardNo;
	private long compTagNo;
	private long compBoardNo;
	private long commTagNo;
	private long commuNo;
	private long categoryNo;
	private long categoryName;
	
	public TagDto () {}

	public long getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(long categoryNo) {
		this.categoryNo = categoryNo;
	}

	public long getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(long categoryName) {
		this.categoryName = categoryName;
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

	public long getUserTagNo() {
		return userTagNo;
	}

	public void setUserTagNo(long userTagNo) {
		this.userTagNo = userTagNo;
	}

	public long getUserBoardNo() {
		return userBoardNo;
	}

	public void setUserBoardNo(long userBoardNo) {
		this.userBoardNo = userBoardNo;
	}

	public long getCompTagNo() {
		return compTagNo;
	}

	public void setCompTagNo(long compTagNo) {
		this.compTagNo = compTagNo;
	}

	public long getCompBoardNo() {
		return compBoardNo;
	}

	public void setCompBoardNo(long compBoardNo) {
		this.compBoardNo = compBoardNo;
	}
	
	public long getCommTagNo() {
		return commTagNo;
	}
	
	public void setCommTagNo(long commTagNo) {
		this.commTagNo = commTagNo;
	}
	
	public long getCommuNo() {
		return commuNo;
	}
	
	public void setCommuNo(long commuNo) {
		this.commuNo = commuNo;
	}
}
