package com.sample.service;

import java.util.List;
import java.util.Map;

import com.sample.web.dto.CompBoardDto;
import com.sample.web.vo.CompBoard;
import com.sample.web.vo.CompanyUserLikes;
import com.sample.web.vo.UserBoard;
import com.sample.web.vo.UserCompLikes;

public interface CompBoardService {
	void addNewCompBoard(CompBoard compBoard, List<Long> tags);
	Map<String, Object> getAllCompBoard(Map<String, Object> paramMap);
	
	
	// 메인 검색시 4개
	List<CompBoardDto> searchCompBoard(Map<String, Object> paramMap);
	// 더보기시 8개 
	Map<String, Object> searchMoreCompBoard(Map<String, Object> paramMap);
	
	List<CompBoardDto> getCompBoardsByNo(long companyNo);
	CompBoardDto getCompBoardDetail(long boardNo);
	void modifyCompBoardDetail(CompBoard compBoard);
	List<CompBoardDto> getCompBoardsByTag(long tagNo);
	
	void addCompLikes(CompanyUserLikes likes);
	void deleteCompLikes(CompanyUserLikes likes);

	void updateUserBoard(CompBoard compBoard, List<Long> tags);
	
	void deleteCompBoard(long compBoardNo);
}
