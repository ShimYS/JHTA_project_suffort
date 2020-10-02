package com.sample.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sample.dao.CompBoardDao;
import com.sample.dao.LikeDao;
import com.sample.dao.TagDao;
import com.sample.web.dto.CompBoardDto;
import com.sample.web.dto.TagDto;
import com.sample.web.vo.CompBoard;
import com.sample.web.vo.CompanyUserLikes;
@Service
public class CompBoardServiceImpl implements CompBoardService{

	@Autowired
	private CompBoardDao compBoardDao;
	
	@Autowired
	private LikeDao likeDao;
	
	@Override
	public void addNewCompBoard(CompBoard compBoard, List<Long> tags) {
		compBoardDao.insertCompBoard(compBoard);
		TagDto tagDto = new TagDto();
		for (Long value : tags) {
			tagDto.setTagNo(value);
			tagDto.setCompBoardNo(compBoard.getNo());
			compBoardDao.insertCompBoardTags(tagDto);
		}
	}

	@Override
	public void updateUserBoard(CompBoard compBoard, List<Long> tags) {
		compBoardDao.updateCompBoard(compBoard);
		compBoardDao.deleteCompBoardTags(compBoard);
		TagDto tagDto = new TagDto();
		for(Long value : tags) {
			tagDto.setTagNo(value);
			tagDto.setCompBoardNo(compBoard.getNo());
			compBoardDao.insertCompBoardTags(tagDto);
		}
	}
	
	//기업 전체 게시판 (더보기까지)
	@Override
	public Map<String, Object> getAllCompBoard(Map<String, Object> paramMap) {
		Map<String, Object> result = new HashMap<String, Object>();
		List<CompBoardDto> compTotalBoards = compBoardDao.getAllCompBoards(paramMap);
		int totalRows = compBoardDao.getAllCompBoardsCount(paramMap);
		
		result.put("items", compTotalBoards);
		result.put("totalRows",totalRows);
		return result;
	}
	
	// 메인에서 검색
	
	@Override
	public List<CompBoardDto> searchCompBoard(Map<String, Object> paramMap) {
		List<CompBoardDto> searchboard = compBoardDao.searchCompBoards(paramMap);
		return searchboard;
	}
	
	@Override
	public Map<String, Object> searchMoreCompBoard(Map<String, Object> paramMap) {
		Map<String, Object> result  =  new HashMap<String, Object>();
		System.out.println("paramMap-->" + paramMap);
		List<CompBoardDto> compTotalBoards = compBoardDao.searchMoreCompBoards(paramMap);
		int totalRows = compBoardDao.getAllCompBoardsCount(paramMap);
		
		result.put("items", compTotalBoards);
		result.put("totalRows", totalRows);
		return result;
	}
	
	@Override
	public CompBoardDto getCompBoardDetail(long boardNo) {
		return compBoardDao.getCompBoardDetail(boardNo);
	}
	@Override
	public List<CompBoardDto> getCompBoardsByNo(long companyNo) {
		
		return compBoardDao.getCompBoardsByNo(companyNo);
	}
	@Override
	public void modifyCompBoardDetail(CompBoard compBoard) {
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public List<CompBoardDto> getCompBoardsByTag(long tagNo) {
		return compBoardDao.getCompBoardsByTag(tagNo);
	}
	
	@Override
	public void addCompLikes(CompanyUserLikes likes) {
		CompanyUserLikes savedLike = likeDao.getCompUserLikes(likes);
		if(savedLike == null) {
			likeDao.insertCompUserLikes(likes);
			compBoardDao.increaseCompUserLikes(likes.getCompBoardNo());
		}
	}
	@Override
	public void deleteCompLikes(CompanyUserLikes likes) {
		CompanyUserLikes savedLike = likeDao.getCompUserLikes(likes);
		if(savedLike != null) {
			likeDao.deleteCompUserLikes(likes);
			compBoardDao.decreaseCompUserLikes(likes.getCompBoardNo());
		}
		
	}

	@Override
	public void deleteCompBoard(long compBoardNo) {
		compBoardDao.deleteCompBoard(compBoardNo);
	}
}
