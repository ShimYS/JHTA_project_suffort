package com.sample.web.dto;

public class LikeDto {

	private long userlikeNo;
	private long userBoardNo;
	private long userNo;
	private long complikeNo;
	private long companyNo;
	private long compUserlikesNo;
	private long compBoardNo;
	
	public LikeDto() {}
	
	
	public long getCompUserlikesNo() {
		return compUserlikesNo;
	}


	public void setCompUserlikesNo(long compUserlikesNo) {
		this.compUserlikesNo = compUserlikesNo;
	}


	public long getCompBoardNo() {
		return compBoardNo;
	}


	public void setCompBoardNo(long compBoardNo) {
		this.compBoardNo = compBoardNo;
	}


	public void setCompanyNo(long companyNo) {
		this.companyNo = companyNo;
	}
	public long getCompanyNo() {
		return companyNo;
	}
	public void setComplikeNo(long complikeNo) {
		this.complikeNo = complikeNo;
	}
	public long getComplikeNo() {
		return complikeNo;
	}
	public long getUserlikeNo() {
		return userlikeNo;
	}

	public void setUserlikeNo(long userlikeNo) {
		this.userlikeNo = userlikeNo;
	}

	public long getUserBoardNo() {
		return userBoardNo;
	}

	public void setUserBoardNo(long userBoardNo) {
		this.userBoardNo = userBoardNo;
	}

	public long getUserNo() {
		return userNo;
	}

	public void setUserNo(long userNo) {
		this.userNo = userNo;
	}
}
