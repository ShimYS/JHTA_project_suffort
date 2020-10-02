package com.sample.web.dto;

public class CommunityCntDto {
	
	private long communityNo;
	private long contentCnt;
	private String communityTitle;
	
	public CommunityCntDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	long getCommunityNo() {
		return communityNo;
	}
	void setCommunityNo(long communityNo) {
		this.communityNo = communityNo;
	}
	long getContentCnt() {
		return contentCnt;
	}
	void setContentCnt(long contentCnt) {
		this.contentCnt = contentCnt;
	}
	
	String getCommunityTitle() {
		return communityTitle;
	}

	void setCommunityTitle(String communityTitle) {
		this.communityTitle = communityTitle;
	}

	@Override
	public String toString() {
		return "CommunityCntDto [communityNo=" + communityNo + ", contentCnt=" + contentCnt + "]";
	}
}
