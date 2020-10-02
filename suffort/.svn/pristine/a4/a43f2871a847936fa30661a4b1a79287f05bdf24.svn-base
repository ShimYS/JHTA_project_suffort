package com.sample.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sample.dao.CompBoardDao;
import com.sample.dao.UserBoardDao;
import com.sample.service.CommunityService;
import com.sample.service.CompBoardService;
import com.sample.service.UserBoardService;
import com.sample.web.dto.CommunitiesDetail;
import com.sample.web.dto.CompBoardDto;
import com.sample.web.dto.UserBoardDto;
import com.sample.web.vo.Companies;
import com.sample.web.vo.Users;

@Controller
public class HomeController {

	@Autowired
	private CompBoardDao compBoardDao;
	
	@Autowired
	private UserBoardDao userBoardDao;
	
	@Autowired
	private UserBoardService userBoardService;
	
	@Autowired
	private CompBoardService compBoardService;
	
	@Autowired
	private CommunityService communityService;
	
	@RequestMapping("/home.do")
	public String home() {
		
		return "home";
	}
	
	
	@RequestMapping(value = "/search.do", method = RequestMethod.GET)
	public String search(@RequestParam(value="keyword", required=false) String keyword,
			@RequestParam(value="tagNo", required=false,defaultValue="-1") long tagNo, Model model, Users users, Companies companies) {
		
		System.out.println("검색 키워드: " + keyword);
		
		//list 용 map
		Map<String, Object> param = new HashMap<>();
		param.put("keyword", keyword);
		param.put("limit", 4);	
		param.put("offset", 0);
		if(companies != null) {
			param.put("companyNo", companies.getNo());
			param.put("access", false);
			param.put("logined", true);
			param.put("type", "company");
		}
		if (users != null) {
			param.put("access", true);
			param.put("userNo", users.getNo());
			param.put("logined", true);
			param.put("type", "user");
		} else {
			param.put("access", false);
			param.put("logined", false);
		}
		if (tagNo != -1) {
			param.put("tagNo", tagNo);			
		}
		
		// count 용 map
		Map<String, Object> paramMap = new HashMap<>();
		
		if (keyword != null) {
			paramMap.put("keyword", keyword);
		}
		
		// main count 용
		int userBoards = userBoardDao.getAllUserBoardsCount(paramMap);
		int compBoards  = compBoardDao.getAllCompBoardsCount(paramMap);//0
		
		System.out.println(param);
		// mainlist by 4
		List<UserBoardDto> searchUserBoards = userBoardService.searchUserBoard(param);//0
		List<CompBoardDto> searchCompBoards = compBoardService.searchCompBoard(param); //0
		System.out.println(searchCompBoards);
		
		//System.out.println(userBoards.size());
		//System.out.println(compBoards.size());
		model.addAttribute("userCount", userBoards);
		model.addAttribute("compCount", compBoards);//
		
		
		
		model.addAttribute("searchUserBoards", searchUserBoards);
		model.addAttribute("searchCompBoards", searchCompBoards);//0
		
		model.addAttribute("keyword", keyword);
		
		return "list";
	}
	
	@GetMapping("/searchmore.do")
	@ResponseBody
	public Map<String, Object> more(@RequestParam(value="pageNo", required=false, defaultValue="1") int pageNo,
			@RequestParam(value="tagNo",required=false,defaultValue="-1") long tagNo,
			@RequestParam(value="keyword", required=false) String keyword,
			@RequestParam(value="typelist", required=false) String typelist, Model model, Users users, Companies companies) {
		System.out.println(keyword);
		System.out.println(typelist);
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		int rows = 8;
		int offset = (pageNo - 1)*rows + 1;
		paramMap.put("offset", offset);
		paramMap.put("limit", 8);
		if (tagNo != -1) {
			paramMap.put("tagNo", tagNo);			
		}
		if(companies != null) {
			paramMap.put("companyNo", companies.getNo());
			paramMap.put("access", false);
		}
		if (users != null) {
			paramMap.put("access", true);
			paramMap.put("userNo", users.getNo());
		} else {
			paramMap.put("access", false);
		}

		if (keyword != null) {
			paramMap.put("keyword", keyword);
		}
		
		Map<String, Object> result = new HashMap<String, Object>();
		if ("user".equals(typelist)) {			
			result = userBoardService.searchUserMoreBoard(paramMap);	// {items:[board, board, ...], totalRows:38}
		} else if ("company".equals(typelist)) {
			result = compBoardService.searchMoreCompBoard(paramMap);
		}
		int totalRows = (int) result.get("totalRows");
		int totalPages = (int) Math.ceil((double)totalRows/rows);
		result.put("totalPages", totalPages);	// {items:[board, board, ...], totalRows:38, totalPages:7}
		
		if(companies != null) {
			result.put("logined", true);
			result.put("type", "company");
		}
		if (users != null) {
			result.put("logined", true);
			result.put("type", "user");
		} else {
			result.put("logined", false);
		}
		
		System.out.println(result);
		
		return result;
	}
	
	
	@GetMapping("/moreuser.do")
	public String searchUser(@RequestParam(value="keyword") String keyword, Model model) {
		model.addAttribute("typelist", "user");
		model.addAttribute("keyword", keyword);
		return "search/searchMore";
	}
	@GetMapping("/morecompany.do")
	public String searchCompany(@RequestParam(value="keyword") String keyword,Model model) {
		model.addAttribute("typelist", "company");
		model.addAttribute("keyword", keyword);
		return "search/searchMore";
	}
	@GetMapping("/morecommunity.do")
	public String searchCommunity(@RequestParam(value="keyword") String keyword, Model model) {
		model.addAttribute("typelist", "community");
		model.addAttribute("keyword", keyword);
		return "search/searchMore";
	}
}
