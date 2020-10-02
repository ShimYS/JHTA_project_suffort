package com.sample.web.dto;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class CompanyDto {
	// company vo
	private long no;
	private String id;
	private String name;
	private String actived;
	@JsonFormat(pattern="yyyy.MM.dd")
	private Date registeredDate;
	private String logo;
	private String url;
	private String address;
	private Double income;
	@JsonFormat(pattern="yyyy.MM.dd")
	private Date startedDate;
	private long regiCnt;	// 가입한 기업 수
	@JsonFormat(pattern="yy.MM.dd")
	private Date day;		// 가입일
	
	// companyBoard vo
	private long sumWarning;
	private long sumUserLike;
	private long boardCnt;
	
	
	public long getRegiCnt() {
		return regiCnt;
	}
	public void setRegiCnt(long regiCnt) {
		this.regiCnt = regiCnt;
	}
	public Date getDay() {
		return day;
	}
	public void setDay(Date day) {
		this.day = day;
	}
	public long getNo() {
		return no;
	}
	public void setNo(long no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getActived() {
		return actived;
	}
	public void setActived(String actived) {
		this.actived = actived;
	}
	public Date getRegisteredDate() {
		return registeredDate;
	}
	public void setRegisteredDate(Date registeredDate) {
		this.registeredDate = registeredDate;
	}
	public String getLogo() {
		return logo;
	}
	public void setLogo(String logo) {
		this.logo = logo;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Double getIncome() {
		return income;
	}
	public void setIncome(Double income) {
		this.income = income;
	}
	public Date getStartedDate() {
		return startedDate;
	}
	public void setStartedDate(Date startedDate) {
		this.startedDate = startedDate;
	}
	public long getBoardCnt() {
		return boardCnt;
	}
	public void setBoardCnt(long boardCnt) {
		this.boardCnt = boardCnt;
	}
	public long getSumWarning() {
		return sumWarning;
	}
	public void setSumWarning(long sumWarning) {
		this.sumWarning = sumWarning;
	}
	public long getSumUserLike() {
		return sumUserLike;
	}
	public void setSumUserLike(long sumUserLike) {
		this.sumUserLike = sumUserLike;
	}
	
}
