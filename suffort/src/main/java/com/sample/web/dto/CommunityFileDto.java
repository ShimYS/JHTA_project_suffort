package com.sample.web.dto;

import java.util.Date;

public class CommunityFileDto {
	
	private String userName;
	private String contentName;
	private Date contentRegisteredDate;
	
	public CommunityFileDto() {}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getContentName() {
		return contentName;
	}

	public void setContentName(String contentName) {
		this.contentName = contentName;
	}

	public Date getContentRegisteredDate() {
		return contentRegisteredDate;
	}

	public void setContentRegisteredDate(Date contentRegisteredDate) {
		this.contentRegisteredDate = contentRegisteredDate;
	}

	@Override
	public String toString() {
		return "CommunityFileDto [userName=" + userName + ", contentName=" + contentName + ", contentRegisteredDate="
				+ contentRegisteredDate + "]";
	}
	
}
