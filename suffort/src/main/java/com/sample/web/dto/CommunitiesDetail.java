package com.sample.web.dto;

import java.util.Date;
import java.util.List;

public class CommunitiesDetail {
	private long commuNo;
	private long commuLimitnum;
	private String commuImg;
	private String commuTitle;
	private String commuIntro;
	private long commuUserNo;
	private Date commuRigisteredDate;
	private String commuActived;
	private String commuRange;
	private String commuPassword;
	private long guestCnt;
	
	public CommunitiesDetail() {
		super();
		// TODO Auto-generated constructor stub
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

	public long getCommuUserNo() {
		return commuUserNo;
	}

	public void setCommuUserNo(long commuUserNo) {
		this.commuUserNo = commuUserNo;
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

	public String getCommuPassword() {
		return commuPassword;
	}

	public void setCommuPassword(String commuPassword) {
		this.commuPassword = commuPassword;
	}

	public long getGuestCnt() {
		return guestCnt;
	}

	public void setGuestCnt(long guestCnt) {
		this.guestCnt = guestCnt;
	}
	
	
	
}
