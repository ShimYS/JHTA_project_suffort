package com.sample.web.vo;

public class CommunityWritings {
	private long no;
	private String talk;
	private long communityContentsNo;
	
	public CommunityWritings() {}

	public long getNo() {
		return no;
	}

	public void setNo(long no) {
		this.no = no;
	}

	public String getTalk() {
		return talk;
	}

	public void setTalk(String talk) {
		this.talk = talk;
	}

	public long getCommunityContentsNo() {
		return communityContentsNo;
	}

	public void setCommunityContentsNo(long communityContentsNo) {
		this.communityContentsNo = communityContentsNo;
	}

	@Override
	public String toString() {
		return "CommunityWritings [no=" + no + ", talk=" + talk + ", communityContentsNo=" + communityContentsNo + "]";
	}
	
	
}
