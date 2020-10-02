package com.sample.dao;

import com.sample.web.vo.CompanyUserLikes;
import com.sample.web.vo.UserCompLikes;
import com.sample.web.vo.UserUserLikes;

public interface LikeDao {

	//사용자 게시판에서 사용자 좋아요
	
	//좋아요를 누른 사람의 번호와 게시물번호를 찾는다.
	UserUserLikes getUserLikes(UserUserLikes likes);
	//좋아요 증가
	void insertLikes(UserUserLikes likes);
	//좋아요 감소
	void deleteLikes(UserUserLikes likes);
	
	//사용자 게시판에 기업 좋아요
	
	UserCompLikes getCompLikes(UserCompLikes likes);
	void insertCompLikes(UserCompLikes likes);
	void deleteCompLikes(UserCompLikes likes);
	
	//기업게시판 사용자 좋아요
	CompanyUserLikes getCompUserLikes(CompanyUserLikes likes);
	void insertCompUserLikes(CompanyUserLikes likes);
	void deleteCompUserLikes(CompanyUserLikes likes);
}
