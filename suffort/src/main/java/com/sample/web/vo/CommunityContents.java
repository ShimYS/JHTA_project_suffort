package com.sample.web.vo;

import java.util.Date;

public class CommunityContents {
	private long no;
	private Date registeredDate;
	private Date updatedDate;
	private String actived;
	private long communitiesNo;
	private long userNo;
	
	public CommunityContents() {}
	
	public long getNo() {
		return no;
	}
	public void setNo(long no) {
		this.no = no;
	}
	public Date getRegisteredDate() {
		return registeredDate;
	}
	public void setRegisteredDate(Date registeredDate) {
		this.registeredDate = registeredDate;
	}
	public Date getUpdatedDate() {
		return updatedDate;
	}
	public void setUpdatedDate(Date updatedDate) {
		this.updatedDate = updatedDate;
	}
	public String getActived() {
		return actived;
	}
	public void setActived(String actived) {
		this.actived = actived;
	}
	public long getCommunitiesNo() {
		return communitiesNo;
	}
	public void setCommunitiesNo(long communitiesNo) {
		this.communitiesNo = communitiesNo;
	}
	public long getUserNo() {
		return userNo;
	}
	public void setUserNo(long userNo) {
		this.userNo = userNo;
	}
	
	
}
