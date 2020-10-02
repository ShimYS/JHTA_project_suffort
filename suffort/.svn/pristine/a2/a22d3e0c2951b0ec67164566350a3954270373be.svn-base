package com.sample.web.dto;

import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import com.fasterxml.jackson.annotation.JsonFormat;

public class UserBoardDto {
	private long userBoardNo;
	private String userBoardTitle;
	private String userBoardContent;
	private String userBoardGit;
	private String userBoardImg;
	private String userBoardAccess;
	private String userBoardActived;
	private String userBoardWarnings;
	private long userBoardUserLikes;
	private long userBoardCompLikes;
	private long userBoardLikes;
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date userBoardRegisteredDate;
	private long userNo;
	private String userId;
	private String userName;
	private List<TagDto> tags;
	private int myLikes;
	
	public long getUserBoardLikes() {
		return userBoardLikes;
	}
	
	public String getUserBoardAccess() {
		return userBoardAccess;
	}

	public void setUserBoardAccess(String userBoardAccess) {
		this.userBoardAccess = userBoardAccess;
	}

	public void setUserBoardLikes(long userBoardLikes) {
		this.userBoardLikes = userBoardLikes;
	}
	
	public String getUserName() {
		return userName;
	}

	public String getUserBoardWarnings() {
		return userBoardWarnings;
	}

	public void setUserBoardWarnings(String userBoardWarnings) {
		this.userBoardWarnings = userBoardWarnings;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public UserBoardDto() {
		
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public long getUserBoardNo() {
		return userBoardNo;
	}

	public void setUserBoardNo(long userBoardNo) {
		this.userBoardNo = userBoardNo;
	}

	public String getUserBoardTitle() {
		return userBoardTitle;
	}

	public void setUserBoardTitle(String userBoardTitle) {
		this.userBoardTitle = userBoardTitle;
	}

	public String getUserBoardContent() {
		return userBoardContent;
	}

	public void setUserBoardContent(String userBoardContent) {
		this.userBoardContent = userBoardContent;
	}

	public String getUserBoardGit() {
		return userBoardGit;
	}

	public void setUserBoardGit(String userBoardGit) {
		this.userBoardGit = userBoardGit;
	}

	public String getUserBoardImg() {
		return userBoardImg;
	}

	public void setUserBoardImg(String userBoardImg) {
		this.userBoardImg = userBoardImg;
	}

	public String getUserBoardActived() {
		return userBoardActived;
	}

	public void setUserBoardActived(String userBoardActived) {
		this.userBoardActived = userBoardActived;
	}

	public long getUserBoardUserLikes() {
		return userBoardUserLikes;
	}

	public void setUserBoardUserLikes(long userBoardUserLikes) {
		this.userBoardUserLikes = userBoardUserLikes;
	}

	public long getUserBoardCompLikes() {
		return userBoardCompLikes;
	}

	public void setUserBoardCompLikes(long userBoardCompLikes) {
		this.userBoardCompLikes = userBoardCompLikes;
	}

	public Date getUserBoardRegisteredDate() {
		return userBoardRegisteredDate;
	} 

	public void setUserBoardRegisteredDate(Date userBoardRegisteredDate) {
		this.userBoardRegisteredDate = userBoardRegisteredDate;
	}

	public long getUserNo() {
		return userNo;
	}

	public void setUserNo(long userNo) {
		this.userNo = userNo;
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
	
	public List<TagDto> getTags() {
		return tags;
	}

	public void setTags(List<TagDto> tags) {
		this.tags = tags;
	}
	public int getMyLikes() {
		return myLikes;
	}
	public void setMyLikes(int myLikes) {
		this.myLikes = myLikes;
	}
	public String getHeartImage() {
		if (myLikes == 0) {
			return "빈하트_.png";
		}
		return "하트.png";
	}
	
}
