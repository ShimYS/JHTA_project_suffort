package com.sample.service;

import java.util.List;

import com.sample.web.dto.CommunityDto;
import com.sample.web.dto.CompBoardDto;
import com.sample.web.dto.CompanyDto;
import com.sample.web.dto.UserBoardDto;
import com.sample.web.dto.UserDto;
import com.sample.web.vo.Categories;
import com.sample.web.vo.Communities;
import com.sample.web.vo.CompBoard;
import com.sample.web.vo.Companies;
import com.sample.web.vo.Tags;
import com.sample.web.vo.UserBoard;
import com.sample.web.vo.Users;

public interface ManagerService {

	// 게시물리스트 page
	List<UserBoardDto> getAllUserBoards();
	List<CompBoardDto> getAllCompBoards();
	// 게시물 활성상태 변경
	UserBoard changeUserBoardActive(long userBoardNo, String active );
	CompBoard changeCompBoardActive(long compBoardNo, String active );
	// 게시물 태그 가져오기
	List<Tags> getBoardTags();
	// 모든 태그 가져오기
	List<Tags> getAllTags();
	// 태그 추가하기
	void insertTag(Tags tag);
	//카테고리 목록 가져오기
	List<Categories> getAllCategories();
	//카테고리번호에 따른 태그들 가져오기
	List<Tags> getTagsByCategoryNo(long categoryNo);
	
	// 유저리스트 page
	List<UserDto> getAllUsers();
	Users changeUsersActive(long userNo, String active);
	List<UserDto> getUserChart();
	
	// 기업리스트 page
	List<CompanyDto> getAllCompanies();
	Companies changeCompActive(long companyNo, String active);
	List<CompanyDto> getCompChart();
	
	// 커뮤니티리스트 page
	List<CommunityDto> getAllCommunities();
	Communities changeCommActive(long commuNo, String active);
	
}
