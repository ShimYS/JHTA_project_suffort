package com.sample.web.vo;

import java.util.Date;

public class Communities {
	private long no;
	private long limitnum;
	private String img;
	private String title;
	private String intro;
	private long userNo;
	private Date rigisteredDate;
	private String actived;
	private String range;
	private String password;
	
	public Communities() {}
	
	public long getNo() {
		return no;
	}
	public void setNo(long no) {
		this.no = no;
	}
	public long getLimitnum() {
		return limitnum;
	}
	public void setLimitnum(long limitnum) {
		this.limitnum = limitnum;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public long getUserNo() {
		return userNo;
	}
	public void setUserNo(long userNo) {
		this.userNo = userNo;
	}
	public Date getRigisteredDate() {
		return rigisteredDate;
	}
	public void setRigisteredDate(Date rigisteredDate) {
		this.rigisteredDate = rigisteredDate;
	}
	public String getActived() {
		return actived;
	}
	public void setActived(String actived) {
		this.actived = actived;
	}
	public String getRange() {
		return range;
	}
	public void setRange(String range) {
		this.range = range;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "Communities [no=" + no + ", limitnum=" + limitnum + ", img=" + img + ", title=" + title + ", userNo="
				+ userNo + ", rigisteredDate=" + rigisteredDate + ", actived=" + actived + ", range=" + range + "]";
	}
}
