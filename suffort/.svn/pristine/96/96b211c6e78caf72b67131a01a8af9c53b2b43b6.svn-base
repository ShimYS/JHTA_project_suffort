package com.sample.dao;

import java.util.List;
import java.util.Map;

import com.sample.web.dto.CompBoardDto;
import com.sample.web.dto.TagDto;
import com.sample.web.dto.UserBoardDto;
import com.sample.web.vo.Categories;
import com.sample.web.vo.CompBoard;
import com.sample.web.vo.UserBoard;

public interface CompBoardDao {

	//기업 게시판 글쓰기
	void insertCompBoard(CompBoard compBoard);

	//기업 게시판 전체 조회
	List<CompBoardDto> getAllCompBoards(Map<String, Object> paramMap);

	//기업 게시판 전체 게시물 수
	int getAllCompBoardsCount(Map<String, Object> paramMap);
	void deleteCompBoard(long compBoardNo);
	
	// 메인 검색시 4개
	List<CompBoardDto> searchCompBoards(Map<String, Object> paramMap);
	// 더보기시 8개 
	List<CompBoardDto> searchMoreCompBoards(Map<String, Object> paramMap);
	
	//기업 게시물 번호로 태그 검색
	List<TagDto> getTagsByBoardNo(long boardNo);

	//카테고리번호로 태그 검색
	List<TagDto> getTagsByCategoriesNo(long categoryNo);

	//기업번호로 기업게시물 검색
	List<CompBoardDto> getCompBoardsByNo(long companyNo); // 기업마이페이지 리스트

	//기업 게시물 디테일
	CompBoardDto getCompBoardDetail(long compBoardNo);

	//기업 게시물 태그 추가 - 글쓰기
	void insertCompBoardTags(TagDto tagDto);

	//모든 카테고리 검색
	List<Categories> getAllCategories();

	//태그번호로 기업게시물 검색
	List<CompBoardDto> getCompBoardsByTag(long tagNo);
	
	void increaseCompUserLikes(long boardNo);
	void decreaseCompUserLikes(long boardNo);

	//기업 게시물 수정
	void updateCompBoard(CompBoard compBoard);

	//기업 게시물 수정 - 태그 수정
	void deleteCompBoardTags(CompBoard compBoard);
}