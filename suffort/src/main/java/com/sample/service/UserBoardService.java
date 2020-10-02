package com.sample.service;

import java.util.List;
import java.util.Map;

import com.sample.web.dto.UserBoardDto;
import com.sample.web.vo.UserBoard;
import com.sample.web.vo.UserCompLikes;
import com.sample.web.vo.UserUserLikes;

public interface UserBoardService {

	void addNewUserBoard(UserBoard userBoard, List<Long> tags);
	void updateUserBoard(UserBoard userBoard, List<Long> tags);

	Map<String, Object> getAllUserBoard(Map<String, Object> paramMap);
	void deletUserBoard(long userBoardNo);
	
	List<UserBoardDto> searchUserBoard(Map<String, Object> paramMap);
	
	Map<String, Object> searchUserMoreBoard(Map<String, Object> paramMap);
	
	List<UserBoardDto> getUserBoardsByNo(long userNo);
	//List<UserBoardDto> getTotalBoardSummary(long userBoardNo);
	UserBoardDto getTotalBoardDetail(long boardNo);
	void modifyUserBoardDetail(UserBoard userBoard, List<Long> tags);
	List<UserBoardDto> getUserBoardsByTag(long tagNo);
	
	//회원게시판의 회원이 좋아요 추가
	void addUserLikes(UserUserLikes likes);
	
	//회원게시판의 회원이 좋아요를 한번 더 누르면 좋아요 취소
	void deleteLikes(UserUserLikes likes);
	
	void addCompLikes(UserCompLikes likes);
	void deleteCompLikes(UserCompLikes likes);
}
