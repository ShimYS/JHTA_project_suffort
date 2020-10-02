package com.sample.web.form;

import java.util.List;

public class CompBoardForm {
	private long no;
	private List<Long> tags;
	private String title;
	private String content;
	private long companiesNo;
	
	public CompBoardForm() {}

	public long getNo() {
		return no;
	}

	public void setNo(long no) {
		this.no = no;
	}

	public long getCompaniesNo() {
		return companiesNo;
	}

	public void setCompaniesNo(long companiesNo) {
		this.companiesNo = companiesNo;
	}

	public List<Long> getTags() {
		return tags;
	}

	public void setTags(List<Long> tags) {
		this.tags = tags;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	
}
