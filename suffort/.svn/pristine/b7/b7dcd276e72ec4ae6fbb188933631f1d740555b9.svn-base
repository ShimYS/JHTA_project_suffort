package com.sample.dao;

import java.util.List;
import java.util.Map;

import com.sample.web.dto.TagDto;
import com.sample.web.dto.UserBoardDto;
import com.sample.web.vo.Categories;
import com.sample.web.vo.UserBoard;

public interface UserBoardDao {

	// Main 검색 (4개)
	List<UserBoardDto> searchUserBoards(Map<String, Object> paramMap);
	
	// main 검색후 더보기
	List<UserBoardDto> searchUserMoreBoards(Map<String, Object> paramMap);

	//회원 게시물 추가
	void insertUserBoard(UserBoard userBoard);
	//모든 회원 게시물 검색
	List<UserBoardDto> getAllUserBoards(Map<String, Object> paramMap);
	//모든 회원 게시물 수 
	int getAllUserBoardsCount(Map<String, Object> paramMap);
	//해당 게시물 삭제
	void deletUserBoard(long userBoardNo);
	
	//게시물에 해당하는 태그 검색
	List<TagDto> getTagsByBoardNo(long boardNo);
	//회원 마이페이지
	List<UserBoardDto> getUserBoardsByNo(long userNo); //회원 마이페이지
	//카테고리번호에 해당하는 태그 검색
	List<TagDto> getTagsByCategoriesNo(long categoryNo);
	//List<UserBoardDto> getTotalBoardSummary(long userBoardNo);
	//해당 회원 게시물의 디테일
	UserBoardDto getTotalBoardDetail(long userBoardNo);
	//회원 게시물 수정
	void updateUserBoard(UserBoard userBoard);
	//회원 게시물 수정 - 태그 수정
	void deleteUserBoardTags(UserBoard userBoard);
	//모든 카테고리 검색
	List<Categories> getAllCategories();
	//회원 게시물 추가할때 태그 번호 추가
	void insertUserBoardTags(TagDto tagDto);
	//사이드바의 태그버튼을 누르면 해당태그 검색
	List<UserBoardDto> getUserBoardsByTag(long tagNo); //태그버튼으로 검색
	
	//회원게시판에 회원이 좋아요 누른 후 +1 증가
	void increaseUserLikes(long boardNo);
	//회원게시판에 회원이 좋아요를 한번 더 누르면 -1 감소
	void decreaseUserLikes(long boardNo);

	void increaseCompLikes(long boardNo);
	void decreaseCompLikes(long boardNo);
}
