package com.sample.web.vo;

public class CommunityImgs {
	private long no;
	private String name;
	private long communityContentsNo;
	
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
	public void setCommunityContentsNo(long comContentNo) {
		this.communityContentsNo = comContentNo;
	}
	@Override
	public String toString() {
		return "CommunityImgs [no=" + no + ", name=" + name + ", communityContentsNo=" + communityContentsNo + "]";
	}
	
	
}
