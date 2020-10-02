package com.sample.dao;

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

public interface ManagerDao {
	
	// 유저게시물 가져오기
	List<UserBoardDto> selectUserBoards();
	UserBoard selectUserBoard(long userBoardNo);
	void updateUserBoardActive(UserBoard userBoard);
	// 기업게시물 가져오기
	List<CompBoardDto> selectCompBoards();
	CompBoard selectCompBoard(long compBoardNo);
	void updateCompBoardActive(CompBoard compBoard);
	// 게시물 태그 가져오기
	List<Tags> selectTags();
	// 모든태그
	List<Tags> selectAllTags();
	// 태그추가
	void insertTag(Tags tag);
	//카테고리 가져오기
	List<Categories> getAllCategories();
	//카테고리번호에 따른 태그들 가져오기
	List<Tags> getTagsByCategoryNo(long categoryNo);
	
	// 모든 유저리스트 가져오기
	List<UserDto> selectUsers();
	Users selectUser(long userNo);
	void updateUserActive(Users user);
	// 정지된 유저만 가져오기
	// 유저 차트 가져오기
	List<UserDto> selectUserChart();
	
	// 모든 기업리스트 가져오기
	List<CompanyDto> selectCompanies();
	Companies selectCompany(long companyNo);
	void updateCompActive(Companies company);
	// 정지된 기업 가져오기
	// 기업 차트 가져오기
	List<CompanyDto> selectCompChart();
	
	// 커뮤니티리스트 가져오기
	List<CommunityDto> selectCommunities();
	Communities selectCommunity(long communityNo);
	void updateCommunityActive(Communities community);
}
