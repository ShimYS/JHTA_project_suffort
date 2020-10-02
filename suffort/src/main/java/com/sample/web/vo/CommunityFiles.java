package com.sample.web.vo;

public class CommunityFiles {
	private long no;
	private String name;
	private long communityContentsNo;
	
	public CommunityFiles() {}

	public long getNo() {
		return no;
	}

	public void setNo(long no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public long getCommunityContentsNo() {
		return communityContentsNo;
	}

	public void setCommunityContentsNo(long communityContentsNo) {
		this.communityContentsNo = communityContentsNo;
	}

	@Override
	public String toString() {
		return "CommunityFiles [no=" + no + ", name=" + name + ", communityContentsNo=" + communityContentsNo + "]";
	}
	
	
	
}
