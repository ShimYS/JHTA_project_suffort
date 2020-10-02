package com.sample.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sample.dao.ManagerDao;
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

@Service
public class ManagerServiceImpl implements ManagerService {

	@Autowired
	ManagerDao managerDao;
	
	///////////////////게시물//////////////////////
	// 유저게시물
	@Override
	public List<UserBoardDto> getAllUserBoards() {
		
		return managerDao.selectUserBoards();
	}
	
	// 유저게시물 활성상태 변경
	@Override
	public UserBoard changeUserBoardActive(long userBoardNo, String actived) {
		UserBoard userBoard = managerDao.selectUserBoard(userBoardNo);
		userBoard.setUserBoardActived(actived);
		managerDao.updateUserBoardActive(userBoard);
		return userBoard;
	}
	
	// 기업게시물
	@Override
	public List<CompBoardDto> getAllCompBoards() {
		
		return managerDao.selectCompBoards();
	}
	
	// 기업게시물 활성상태 변경
	@Override
	public CompBoard changeCompBoardActive(long compBoardNo, String active) {
		CompBoard compBoard = managerDao.selectCompBoard(compBoardNo);
		compBoard.setActived(active);
		managerDao.updateCompBoardActive(compBoard);
		
		return compBoard;
	}
	
	// 게시물 태그
	@Override
	public List<Tags> getBoardTags() {
		return managerDao.selectTags();
	}
	
	// 모든 태그
	@Override
	public List<Tags> getAllTags() {
		
		return managerDao.selectAllTags();
	}
	@Override
	public List<Categories> getAllCategories() {
		return managerDao.getAllCategories();
	}
	
	@Override
	public void insertTag(Tags tag) {
		managerDao.insertTag(tag);
	}
	
	//카테고리번호에 따른 태그들 가져오기
	@Override
	public List<Tags> getTagsByCategoryNo(long categoryNo) {
		return managerDao.getTagsByCategoryNo(categoryNo);
	}
	//////////////////유저리스트////////////////////
	// 유저리스트 가져오기
	@Override
	public List<UserDto> getAllUsers() {
		return managerDao.selectUsers();
	}
	// 활동 상태 변경
	@Override
	public Users changeUsersActive(long userNo, String actived) {
		Users user = managerDao.selectUser(userNo);
		user.setActived(actived);
		managerDao.updateUserActive(user);
		return user;
	}
	// 유저 차트
	@Override
	public List<UserDto> getUserChart() {
		System.out.println("getUserChart()실행");
		List<UserDto> chart = managerDao.selectUserChart();
		return chart;
	}
	
	//////////////////기업리스트////////////////////
	// 기업리스트 가져오기
	@Override
	public List<CompanyDto> getAllCompanies() {
		
		return managerDao.selectCompanies();
	}
	
	// 활동 상태 변경
	@Override
	public Companies changeCompActive(long companyNo, String actived) {
		Companies companies = managerDao.selectCompany(companyNo);
		companies.setActived(actived);
		managerDao.updateCompActive(companies);
		
		return companies;
	}
	@Override
	public List<CompanyDto> getCompChart() {
		
		return managerDao.selectCompChart();
	}
	
	//////////////////커뮤니티//////////////////////
	// 커뮤니티 리스트
	@Override
	public List<CommunityDto> getAllCommunities() {
		return managerDao.selectCommunities();
	}
	
	@Override
	public Communities changeCommActive(long commuNo, String active) {
		Communities community = managerDao.selectCommunity(commuNo);
		community.setActived(active);
		managerDao.updateCommunityActive(community);
		
		return community;
	}

}
