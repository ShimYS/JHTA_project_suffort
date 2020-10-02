package com.sample.web.dto;

import java.util.Date;

public class CommunityGuestDetail {
	private long userNo;
	private String userId;
	private String userName;
	private String userImg;
	private String userGender;
	//private String userEmail;
	//private String userGitAddr;
	//private String userGraduation;
	private String userRegisteredDate;
	private long CommunitiesNo;
	private String CommunitiesGrade;
	private Date CommunitiesRegisteredDate;
	private Date CommunitiesActivedDate;
	
	public CommunityGuestDetail() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public long getUserNo() {
		return userNo;
	}
	public void setUserNo(long userNo) {
		this.userNo = userNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserImg() {
		return userImg;
	}
	public void setUserImg(String userImg) {
		this.userImg = userImg;
	}
	public String getUserGender() {
		return userGender;
	}
	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}
//	public String getUserEmail() {
//		return userEmail;
//	}
//	public void setUserEmail(String userEmail) {
//		this.userEmail = userEmail;
//	}
//	public String getUserGitAddr() {
//		return userGitAddr;
//	}
//	public void setUserGitAddr(String userGitAddr) {
//		this.userGitAddr = userGitAddr;
//	}
//	public String getUserGraduation() {
//		return userGraduation;
//	}
//	public void setUserGraduation(String userGraduation) {
//		this.userGraduation = userGraduation;
//	}
	public String getUserRegisteredDate() {
		return userRegisteredDate;
	}
	public void setUserRegisteredDate(String userRegisteredDate) {
		this.userRegisteredDate = userRegisteredDate;
	}
	public long getCommunitiesNo() {
		return CommunitiesNo;
	}
	public void setCommunitiesNo(long communitiesNo) {
		CommunitiesNo = communitiesNo;
	}
	public String getCommunitiesGrade() {
		return CommunitiesGrade;
	}
	public void setCommunitiesGrade(String communitiesGrade) {
		CommunitiesGrade = communitiesGrade;
	}
	public Date getCommunitiesRegisteredDate() {
		return CommunitiesRegisteredDate;
	}
	public void setCommunitiesRegisteredDate(Date communitiesRegisteredDate) {
		CommunitiesRegisteredDate = communitiesRegisteredDate;
	}
	public Date getCommunitiesActivedDate() {
		return CommunitiesActivedDate;
	}
	public void setCommunitiesActivedDate(Date communitiesActivedDate) {
		CommunitiesActivedDate = communitiesActivedDate;
	}
	
	
}
