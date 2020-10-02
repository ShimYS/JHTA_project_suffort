package com.sample.web.dto;

import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.util.StringUtils;

import com.fasterxml.jackson.annotation.JsonFormat;

public class CompBoardDto {
	private long compBoardNo;
	private String compBoardTitle;
	private String compBoardContent;
	private String compBoardActived;
	private long compBoardWarnings;
	private long compBoardUserLikes;
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date compBoardRegisteredDate;
	private long companyNo;
	private String companyId;
	private String companyLogo;
	private String companyName;
	private String companyUrl;
	private String companySize;
	private String companyContent;
	private String companyAddress;
	private double companyIncome;
	private Date companyStartedDate;
	private List<TagDto> tags;
	private int myLikes;
	
	
	public int getMyLikes() {
		return myLikes;
	}
	public void setMyLikes(int myLikes) {
		this.myLikes = myLikes;
	}
	public long getCompBoardNo() {
		return compBoardNo;
	}
	public void setCompBoardNo(long compBoardNo) {
		this.compBoardNo = compBoardNo;
	}
	public String getCompBoardTitle() {
		return compBoardTitle;
	}
	public void setCompBoardTitle(String compBoardTitle) {
		this.compBoardTitle = compBoardTitle;
	}
	public String getCompBoardContent() {
		return compBoardContent;
	}
	public void setCompBoardContent(String compBoardContent) {
		this.compBoardContent = compBoardContent;
	}
	public String getCompBoardActived() {
		return compBoardActived;
	}
	public void setCompBoardActived(String compBoardActived) {
		this.compBoardActived = compBoardActived;
	}
	public long getCompBoardWarnings() {
		return compBoardWarnings;
	}
	public void setCompBoardWarnings(long compBoardWarnings) {
		this.compBoardWarnings = compBoardWarnings;
	}
	public long getCompBoardUserLikes() {
		return compBoardUserLikes;
	}
	public void setCompBoardUserLikes(long compBoardUserLikes) {
		this.compBoardUserLikes = compBoardUserLikes;
	}
	public Date getCompBoardRegisteredDate() {
		return compBoardRegisteredDate;
	}
	public void setCompBoardRegisteredDate(Date compBoardRegisteredDate) {
		this.compBoardRegisteredDate = compBoardRegisteredDate;
	}
	public long getCompanyNo() {
		return companyNo;
	}
	public void setCompanyNo(long companyNo) {
		this.companyNo = companyNo;
	}
	public String getCompanyId() {
		return companyId;
	}
	public void setCompanyId(String companyId) {
		this.companyId = companyId;
	}
	public String getCompanyLogo() {
		return companyLogo;
	}
	public void setCompanyLogo(String companyLogo) {
		this.companyLogo = companyLogo;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getCompanyUrl() {
		return companyUrl;
	}
	public void setCompanyUrl(String companyUrl) {
		this.companyUrl = companyUrl;
	}
	public String getCompanySize() {
		return companySize;
	}
	public void setCompanySize(String companySize) {
		this.companySize = companySize;
	}
	public String getCompanyContent() {
		return companyContent;
	}
	public void setCompanyContent(String companyContent) {
		this.companyContent = companyContent;
	}
	public String getCompanyAddress() {
		return companyAddress;
	}
	public void setCompanyAddress(String companyAddress) {
		this.companyAddress = companyAddress;
	}
	public double getCompanyIncome() {
		return companyIncome;
	}
	public void setCompanyIncome(double companyIncome) {
		this.companyIncome = companyIncome;
	}
	public Date getCompanyStartedDate() {
		return companyStartedDate;
	}
	public void setCompanyStartedDate(Date companyStartedDate) {
		this.companyStartedDate = companyStartedDate;
	}
	public List<TagDto> getTags() {
		return tags;
	}
	public void setTags(List<TagDto> tags) {
		this.tags = tags;
	}
	
	public String getTagsText() {
		if (tags != null && !tags.isEmpty()) {
			return StringUtils.collectionToDelimitedString(tags.stream().map(tag -> "#" + tag.getTagName()).collect(Collectors.toList()), " ");
		}
		return "";
	}
	
	public boolean isExistTag(long tagNo) {
		for (TagDto tag : tags) {
			if (tag.getTagNo() == tagNo) {
				return true;
			}
		}
		return false;
	}
	public String getHeartImage() {
		if (myLikes == 0) {
			return "빈하트_.png";
		}
		return "하트.png";
	}
	
	@Override
	public String toString() {
		return "CompBoardDto [compBoardNo=" + compBoardNo + ", compBoardTitle=" + compBoardTitle + ", compBoardContent="
				+ compBoardContent + ", compBoardActived=" + compBoardActived + ", compBoardWarnings="
				+ compBoardWarnings + ", compBoardUserLikes=" + compBoardUserLikes + ", compBoardRegisteredDate="
				+ compBoardRegisteredDate + ", companyNo=" + companyNo + ", companyId=" + companyId + ", companyLogo="
				+ companyLogo + ", companyName=" + companyName + ", companyUrl=" + companyUrl + ", companySize="
				+ companySize + ", companyContent=" + companyContent + ", companyAddress=" + companyAddress
				+ ", companyIncome=" + companyIncome + ", companyStartedDate=" + companyStartedDate + ", tags=" + tags
				+ "]";
	}

	
}