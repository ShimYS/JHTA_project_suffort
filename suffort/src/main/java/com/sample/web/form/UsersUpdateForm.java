package com.sample.web.form;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

public class UsersUpdateForm {

	// 추가
	private long no;
	private String name;
	private String img;
	private String gender;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date birth;
	private String gitAddr;
	private String email;

	// 추가 코드
	private MultipartFile upfile;
	
	public MultipartFile getUpfile() {
		return upfile;
	}

	public void setUpfile(MultipartFile upfile) {
		this.upfile = upfile;
	}
	
	public UsersUpdateForm() {
		
	}

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

	@Override
	public String toString() {
		return "UsersUpdateForm [name=" + name + ", img=" + img + ", gender=" + gender + ", birth=" + birth
				+ ", gitAddr=" + gitAddr + ", email=" + email + "]";
	}
	
}
