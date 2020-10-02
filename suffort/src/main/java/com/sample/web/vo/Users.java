package com.sample.web.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Users {
	private long no;
	private String id;
	private String loginWay;
	private String name;
	private String img;
	private String gender;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date birth;
	private String gitAddr;
	private String email;
	private String deleted;
	private String actived;
	private String graduation;
	private Date registeredDate;

	public Users() {
		
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

	public String getLoginWay() {
		return loginWay;
	}

	public void setLoginWay(String loginWay) {
		this.loginWay = loginWay;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}
	
	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public String getGitAddr() {
		return gitAddr;
	}

	public void setGitAddr(String gitAddr) {
		this.gitAddr = gitAddr;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDeleted() {
		return deleted;
	}

	public void setDeleted(String deleted) {
		this.deleted = deleted;
	}

	public String getActived() {
		return actived;
	}

	public void setActived(String actived) {
		this.actived = actived;
	}

	public String getGraduation() {
		return graduation;
	}

	public void setGraduation(String graduation) {
		this.graduation = graduation;
	}

	public Date getRegisteredDate() {
		return registeredDate;
	}

	public void setRegisteredDate(Date registeredDate) {
		this.registeredDate = registeredDate;
	}

	@Override
	public String toString() {
		return "Users [no=" + no + ", id=" + id + ", loginWay=" + loginWay + ", name=" + name + ", img=" + img
				+ ", gender=" + gender + ", birth=" + birth + ", gitAddr=" + gitAddr + ", email=" + email + ", deleted="
				+ deleted + ", actived=" + actived + ", graduation=" + graduation + ", registeredDate=" + registeredDate
				+ "]";
	}
	
}
