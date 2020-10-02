package com.sample.web.dto;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;

public class CommunityDto {

	private long commuNo;
	private long commuLimitnum;
	private String commuImg;
	private String commuTitle;
	private String commuIntro;
	private long userNo;
	@JsonFormat(pattern="yyyy.MM.dd")		// 관리자 커뮤니티리스트에서 사용
	private Date commuRigisteredDate;
	private String commuActived;
	private String commuRange;
	private String password;
	private String userId;
	private List<TagDto> tags;
	private String guestGrade;				// 관리자 커뮤니티리스트에서 사용
	@JsonFormat(pattern="yyyy.MM.dd hh.mm.ss")
	private Date guestActivedDate;			// 관리자 커뮤니티리스트에서 사용
	
	public CommunityDto() {}

	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Date getGuestActivedDate() {
		return guestActivedDate;
	}

	public void setGuestActivedDate(Date guestActivedDate) {
		this.guestActivedDate = guestActivedDate;
	}

	public String getGuestGrade() {
		return guestGrade;
	}

	public void setGuestGrade(String guestGrade) {
		this.guestGrade = guestGrade;
	}

	public long getCommuNo() {
		return commuNo;
	}

	public void setCommuNo(long commuNo) {
		this.commuNo = commuNo;
	}

	public long getCommuLimitnum() {
		return commuLimitnum;
	}

	public void setCommuLimitnum(long commuLimitnum) {
		this.commuLimitnum = commuLimitnum;
	}

	public String getCommuImg() {
		return commuImg;
	}

	public void setCommuImg(String commuImg) {
		this.commuImg = commuImg;
	}

	public String getCommuTitle() {
		return commuTitle;
	}

	public void setCommuTitle(String commuTitle) {
		this.commuTitle = commuTitle;
	}
	
	public String getCommuIntro() {
		return commuIntro;
	}
	
	public void setCommuIntro(String commuIntro) {
		this.commuIntro = commuIntro;
	}

	public long getUserNo() {
		return userNo;
	}

	public void setUserNo(long userNo) {
		this.userNo = userNo;
	}

	public Date getCommuRigisteredDate() {
		return commuRigisteredDate;
	}

	public void setCommuRigisteredDate(Date commuRigisteredDate) {
		this.commuRigisteredDate = commuRigisteredDate;
	}

	public String getCommuActived() {
		return commuActived;
	}

	public void setCommuActived(String commuActived) {
		this.commuActived = commuActived;
	}

	public String getCommuRange() {
		return commuRange;
	}

	public void setCommuRange(String commuRange) {
		this.commuRange = commuRange;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public List<TagDto> getTags() {
		return tags;
	}

	public void setTags(List<TagDto> tags) {
		this.tags = tags;
	}
	
	
}
