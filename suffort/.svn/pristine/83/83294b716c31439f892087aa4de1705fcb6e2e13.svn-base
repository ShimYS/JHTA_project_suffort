package com.sample.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sample.dao.LikeDao;
import com.sample.dao.UserBoardDao;
import com.sample.dao.UserDao;
import com.sample.web.dto.TagDto;
import com.sample.web.dto.UserBoardDto;
import com.sample.web.vo.UserBoard;
import com.sample.web.vo.UserCompLikes;
import com.sample.web.vo.UserUserLikes;

@Service
public class UserBoardServiceImpl implements UserBoardService{

	@Autowired
	private UserBoardDao userBoardDao;
	
	@Autowired
	private LikeDao likeDao;
	
	//회원 전체 게시판 글쓰기
	@Override
	public void addNewUserBoard(UserBoard userBoard, List<Long> tags) {
		userBoardDao.insertUserBoard(userBoard);
		TagDto tagDto = new TagDto();
		for (Long value : tags) {
			tagDto.setTagNo(value);
			tagDto.setUserBoardNo(userBoard.getUserBoardNo());
			userBoardDao.insertUserBoardTags(tagDto);
		}
	}

	@Override
	public void updateUserBoard(UserBoard userBoard, List<Long> tags) {
		userBoardDao.updateUserBoard(userBoard);
		System.out.println(userBoard.getUserBoardNo());
		userBoardDao.deleteUserBoardTags(userBoard);
		TagDto tagDto = new TagDto();
		
		for(Long value : tags) {
			tagDto.setTagNo(value);
			tagDto.setUserBoardNo(userBoard.getUserBoardNo());
			userBoardDao.insertUserBoardTags(tagDto);
		}
	}
	
	@Override
	public List<UserBoardDto> getUserBoardsByNo(long userNo) {
		List<UserBoardDto> userBoards = userBoardDao.getUserBoardsByNo(userNo);
		return userBoards;
	}
	
	@Override
	public Map<String, Object> getAllUserBoard(Map<String, Object> paramMap) {
		Map<String, Object> result = new HashMap<String, Object>();
		
		List<UserBoardDto> userTotalBoards = userBoardDao.getAllUserBoards(paramMap);
		int totalRows = userBoardDao.getAllUserBoardsCount(paramMap);
		
		result.put("items", userTotalBoards);
		result.put("totalRows", totalRows);
		
		return result;
	}
	
	// 메인 검색시 
	@Override
	public List<UserBoardDto> searchUserBoard(Map<String, Object> paramMap) {
		List<UserBoardDto> searchBoards = userBoardDao.searchUserBoards(paramMap);
		return searchBoards;
	}
	
	// 메인 검색 후 더보기
	@Override
	public Map<String, Object> searchUserMoreBoard(Map<String, Object> paramMap) {
		Map<String, Object> result = new HashMap<String, Object>();
		System.out.println("paramMap-->" + paramMap);
		List<UserBoardDto> searchBoards = userBoardDao.searchUserBoards(paramMap);
		int totalRows = userBoardDao.getAllUserBoardsCount(paramMap);
		result.put("items", searchBoards);
		result.put("totalRows", totalRows);
		return result;
	}
	
	
	@Override
	public void deletUserBoard(long userBoardNo) {
		userBoardDao.deletUserBoard(userBoardNo);
	}
	
	
	@Override
	public UserBoardDto getTotalBoardDetail(long boardNo) {
		UserBoardDto userBoardDto = userBoardDao.getTotalBoardDetail(boardNo);
		return userBoardDto;
	}

	@Override
	public List<UserBoardDto> getUserBoardsByTag(long tagNo) {
		return userBoardDao.getUserBoardsByTag(tagNo);
	}
	
	//회원게시판의 회원이 좋아요 추가
	@Override
	public void addUserLikes(UserUserLikes likes) {
		UserUserLikes savedLike = likeDao.getUserLikes(likes);
		if(savedLike == null) {
			likeDao.insertLikes(likes);
			userBoardDao.increaseUserLikes(likes.getUserBoardNo());
		}
	}
	@Override
	public void deleteLikes(UserUserLikes likes) {
		UserUserLikes savedLike = likeDao.getUserLikes(likes);
		if(savedLike != null) {
			likeDao.deleteLikes(likes);
			userBoardDao.decreaseUserLikes(likes.getUserBoardNo());
		}
	}
	
	@Override
	public void addCompLikes(UserCompLikes likes) {
		UserCompLikes savedLike = likeDao.getCompLikes(likes);
		if(savedLike == null) {
			likeDao.insertCompLikes(likes);
			userBoardDao.increaseCompLikes(likes.getUserBoardNo());
		}
	}
	@Override
	public void deleteCompLikes(UserCompLikes likes) {
		UserCompLikes savedLike = likeDao.getCompLikes(likes);
		if(savedLike != null) {
			likeDao.deleteCompLikes(likes);
			userBoardDao.decreaseCompLikes(likes.getUserBoardNo());
		}
	}
	
	@Override
	public void modifyUserBoardDetail(UserBoard userBoard, List<Long> tags) {
		//아직
		userBoardDao.updateUserBoard(userBoard);
		
	}
	
}
