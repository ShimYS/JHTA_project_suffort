package com.sample.web.controller;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sample.service.ManagerService;
import com.sample.web.dto.CommunityDto;
import com.sample.web.dto.CompBoardDto;
import com.sample.web.dto.CompanyDto;
import com.sample.web.dto.UserBoardDto;
import com.sample.web.dto.UserDto;
import com.sample.web.form.TagsForm;
import com.sample.web.vo.Categories;
import com.sample.web.vo.Communities;
import com.sample.web.vo.CompBoard;
import com.sample.web.vo.Companies;
import com.sample.web.vo.Tags;
import com.sample.web.vo.UserBoard;
import com.sample.web.vo.Users;

@Controller
public class AdminController {
	@Autowired
	private ManagerService managerService;
	
	// 관리자 메인
//	@GetMapping("/manager/adminmain.do")
//	public String main() {
//		
//		return "manager/adminMain";
//	}
	
	// 전체 게시물리스트
	@GetMapping("/manager/adminboardlist.do")
	public String boardList(Model model) {
		List<Categories> categories = managerService.getAllCategories();
		model.addAttribute("categories", categories);
		return "manager/adminBoardList";
	}
	
	// 유저 전체게시물 ajax로 가져오기
	@GetMapping("/manager/userboardlist.do")
	public @ResponseBody List<UserBoardDto> userBoardList() {
		
		return managerService.getAllUserBoards();
	}
	
	// 유저게시물 활성 버튼 ajax
	@GetMapping("/manager/changeUserBoardActive.do")
	public @ResponseBody UserBoard changeUserBoardActive(@RequestParam(value="no") long userBoardNo, @RequestParam(value="actived") String actived) {
		
		return managerService.changeUserBoardActive(userBoardNo, actived);
	}
	
	// 기업 전체게시물 ajax로 가져오기
	@GetMapping("/manager/compboardlist.do")
	public @ResponseBody List<CompBoardDto> compBoardList() {
		
		return managerService.getAllCompBoards();
	}
	
	// 기업게시물 활성 버튼 ajax
	@GetMapping("/manager/changeCompBoardActive.do")
	public @ResponseBody CompBoard changeCompBoardActive(@RequestParam(value="no") long compBoardNo, @RequestParam(value="actived") String actived) {
		
		return managerService.changeCompBoardActive(compBoardNo, actived);
	}
	
	// 모든 태그 ajax
	@GetMapping("/manager/alltags.do")
	public @ResponseBody List<Tags> allTags() {
		
		return managerService.getAllTags();
	}
	
	//태그 추가
	@PostMapping("/manager/addTag.do")
	public String addTag(TagsForm tagsForm) {
		Tags tags = new Tags();
		
		BeanUtils.copyProperties(tagsForm, tags);
		
		managerService.insertTag(tags);
		return "redirect:adminboardlist.do";
	}
	
	//카테고리번호에 따른 태그 ajax
	@GetMapping("/manager/confirmtags.do")
	public @ResponseBody List<Tags> confirmTagsByCategoryNo(@RequestParam("categoryNo") long categoryNo){
		return managerService.getTagsByCategoryNo(categoryNo);
	}
	
	// 유저 전체리스트
	@GetMapping("/manager/adminuserlist.do")
	public String adminUserList() {
		
		return "manager/adminUserList";		
	}
	
	// 유저 전체리스트 ajax로 가져오기
	@GetMapping("/manager/userlist.do")
	public @ResponseBody List<UserDto> userList() {
		
		return managerService.getAllUsers();
	}
	
	// ajax - 유저 리스트에서 ajax로 생성된 버튼에 대한 ajax
	@GetMapping("/manager/changeUserActive.do")
	public @ResponseBody Users changeUsersActive(@RequestParam(value="no") long userNo, @RequestParam(value="actived") String actived) {
		
		return managerService.changeUsersActive(userNo, actived);
	}
	
	// 유저차트
	@GetMapping("/manager/userchart.do")
	public @ResponseBody List<UserDto> userChart() {
		List<UserDto> uchart = managerService.getUserChart();
		return uchart;
	}
	
	// 기업 전체리스트
	@GetMapping("/manager/admincomplist.do")
	public String adminCompList() {
		
		return "manager/adminCompList";
	}
	
	// 기업 전체리스트 ajax로 가져오기
	@GetMapping("/manager/complist.do")
	public @ResponseBody List<CompanyDto> companyList() {
		
		return managerService.getAllCompanies();
	}
	
	//ajax - 기업 리스트에서 ajax로 생성된 버튼에 대한 ajax
	@GetMapping("/manager/changeCompActive.do")
	public @ResponseBody Companies changeCompActive(@RequestParam(value="no") long companyNo, @RequestParam("actived") String actived) {
		
		return managerService.changeCompActive(companyNo, actived);
	}
	
	// 기업차트
	@GetMapping("/manager/compchart.do")
	public @ResponseBody List<CompanyDto> compChart(){
		
		return managerService.getCompChart();
	}
	
	// 커뮤니티 전체리스트
	@GetMapping("/manager/admincommlist.do")
	public String commList() {
		
		return "manager/adminCommList";
	}
	
	// 커뮤니티 전체리스트 ajax로 가져오기
	@GetMapping("/manager/commlist.do")
	public @ResponseBody List<CommunityDto> communityList() {
		
		return managerService.getAllCommunities();
	}
	
	// 커뮤니티 리스트 활성 버튼 ajax
	@GetMapping("/manager/changeCommActive.do")
	public @ResponseBody Communities changeCommActive(@RequestParam(value="no") long communityNo, @RequestParam(value="actived") String actived) {
		
		return managerService.changeCommActive(communityNo, actived);
	}
}
