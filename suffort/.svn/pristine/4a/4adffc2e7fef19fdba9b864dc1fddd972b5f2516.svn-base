package com.sample.web.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.util.List;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.sample.service.CommunityService;
import com.sample.web.dto.CommunityFileDto;
import com.sample.web.dto.CommunityImgDto;
import com.sample.web.dto.CommunityListDto;
import com.sample.web.dto.CommunityTagsDto;
import com.sample.web.vo.Communities;
import com.sample.web.vo.CommunityContents;
import com.sample.web.vo.CommunityGuests;
import com.sample.web.vo.Users;

@Controller
@RequestMapping("/community")
@SessionAttributes("LOGIN_USERS")
public class CommunityController {
	@Autowired
	CommunityService communityService;
	
	@Autowired
	private HttpSession session;
	
	@Value("${directory.save.contentfile}")
	private String saveDirectory;
	//private String saveDirectory = "C:/APP/eGovFrameDev-3.9.0-64bit/workspace/suffort/src/main/webapp/resources/contentfile";
	
	
	
	@GetMapping("/main.do")
	public String communityMain() {
		return "community/main";
	}
	
	@GetMapping("/checkUserSession.do")
	public @ResponseBody String checkUserSession() {
		Users user = (Users) session.getAttribute("LOGIN_USERS");
		String result = "false";
		if(user != null) {
			result = "true";
		} 
		return result;
	}
	
	
	
	@GetMapping("/inside.do")
	public String communityInside(@RequestParam("communityNo") int communityNo,
			@RequestParam("userNo") int userNo, Model model) {
		
		model.addAttribute("userNo", userNo);
		model.addAttribute("communityNo", communityNo);
		
		return "community/inside";
	}
	
	
	
	// 임시로 사용 - 디자인 테스트용
	@GetMapping("/chat.do")
	public String chat() {
		return "community/chat";
	}
	
	
	
	/**
	 * main에서 방참여를 클릭하면 실행되는 메소드
	 * 가져온 방번호와 요청한 브라우저의 세션에서 빼낸 유저정보를 가지고
	 * inside로 리다이렉트 요청
	 * @param communityNo
	 * @param model
	 * @return
	 */
	@GetMapping("/goCommunity.do")
	public String goCommunity(@RequestParam("communityNo") long communityNo, Model model) {
		System.out.println("--- goCommunity.do 실행 ---");
		// http세션을 가져와서 유저정보 등록
		// HttpSession session = request.getSession();
		// User user = (User) session.getAttribute("user");
		CommunityGuests newComGuests = new CommunityGuests();
		newComGuests.setCommunitiesNo(communityNo);
		Users guestNo = (Users) session.getAttribute("LOGIN_USERS");
		
		// 로그인 검사
		if(null == guestNo) {
			return "user/totalLogin";
		}
		
		System.out.println("goCom에서 guestNo : " + guestNo);
		newComGuests.setUserNo(guestNo.getNo()); // 세션에서 받아와서 넣어줘야함
		//newComGuests.setUserNo(2); // 세션에서 받아와서 넣어줘야함
		newComGuests.setGrade("일반");
		// 해당 커뮤니티에 유저 등록되어있는지 검증 후 등록 안되어 있으면 유저 등록
		communityService.addNewComGuest(newComGuests);		
		
		System.out.println("where : goCommunity.do");
		System.out.println("(test) communityNo : " + communityNo);
		System.out.println("(test) userNo : " + guestNo.getNo());
		// 방에 접속하는 유저의 정보를 세션에서 받아와서 모델에 담고, inside로 리다이렉트
		return "redirect:inside.do?communityNo="+communityNo+"&userNo="+guestNo.getNo();
		//return "redirect:inside.do?communityNo="+communityNo+"&userNo="+2;
	}
	
	
	
	/**
	 * 방생성 후 해당 방으로 이동
	 * @param request
	 * @param response
	 * @return
	 */
	@PostMapping("/createCommunity.do")
	public String createCommunity(@RequestParam("title") String title,
			@RequestParam("intro") String intro,
			@RequestParam("password") String password,
			@RequestParam("tags") List<Long> tags, Model model, Users users){
		System.out.println("--- createCommunity.do 실행 ---");
		
		System.out.println("tags : " + tags);
		
		// 파라미터에서 방제목 읽어오기 (프론트에서 배열로 담겨왔기때문에 키로 찾아준다)			
		Communities newCommunity = new Communities();
		newCommunity.setIntro(intro);
		newCommunity.setTitle(title);
		// http세션을 가져와서 유저정보 등록
		Users bjNo = (Users) session.getAttribute("LOGIN_USERS");
		System.out.println("bjNo : " + bjNo);
		if(null == bjNo) {
			return "user/totalLogin";
		}
		System.out.println("bjNO : " + bjNo);
		newCommunity.setUserNo(bjNo.getNo()); // 세션에서 받아와서 넣어줘야함
		//newCommunity.setUserNo(1); // 세션에서 받아와서 넣어줘야함
		// communities, community_guests 생성 
		if(password.equals("")) {
			System.out.println("공개방 생성");
			newCommunity.setRange("전체");
		} else {
			System.out.println("비밀번호방 생성");
			newCommunity.setPassword(password);
			newCommunity.setRange("비공개");
		}
		
		// 커뮤니티 디폴트 이미지 
		newCommunity.setImg("welcome.jpg");
		
		Communities communities = communityService.addNewCommunity(newCommunity, tags);
		
		System.out.println("communities.getNo() : " + communities.getNo());
		
		// inside로 리다이렉트
		return "redirect:inside.do?communityNo="+communities.getNo()+"&userNo="+bjNo.getNo();
		//return "redirect:inside.do?communityNo="+communities.getNo()+"&userNo="+1;
	}
	
	
	
	/**
	 * 모든 커뮤니티방 조회해서 반환
	 * @return 모든 커뮤니티방
	 */
	@GetMapping("/retrieveCommunity.do")
	public @ResponseBody List<CommunityListDto> retrieveCommunity() {
		System.out.println("--- retrieveCommunity.do 실행 ---");
		// 모든방 조회하기
		return communityService.getAllCommunitiesDetail();
	
	}
	
	
	
	/**
	 * 모든 기본태그 조회해서 반환
	 * @return 모든 기본태그
	 */
	@GetMapping("/retrieveAllTags.do")
	public @ResponseBody List<CommunityTagsDto> retrieveAllTags() {
		System.out.println("--- retrieveAllTags.do 실행 ---");
		// 모든방 조회하기
		return communityService.getAllTags();
	}
	
	
	
	/**
	 * 커뮤니티 접속시 비밀번호 체크해서 결과를 반환한다.
	 * @return
	 */
	@GetMapping("/checkPassword.do")
	public @ResponseBody Boolean checkCommuPwd(@RequestParam(value="commuNo") long commuNo,
												@RequestParam(value="password") String password, Model model) {
		return communityService.checkCommuPwd(commuNo, password);
	}
	
	/**
	 * 커뮤니티의 컨텐츠를 타입별로 조회
	 * @param communityNo 커뮤니티 번호
	 * @param type 타입 (image, file, text)
	 * @param model
	 * @return 조회결과
	 */
	@GetMapping("/selectContent.do")
	public @ResponseBody List<CommunityFileDto> selectContent(@RequestParam(value="communityNo") long communityNo,
																@RequestParam(value="type") String type, Model model){
		return communityService.getContentByCommuNoAndType(communityNo, type);
	}
	
	
	/**
	 * 커뮤니티 생성시 타이틀 중복체크해서 결과를 반환한다.
	 * @param title 입력한 커뮤니티 타이틀
	 * @param model 
	 * @return
	 */
	@GetMapping("/checkTitle.do")
	public @ResponseBody Boolean checkCommuTitle(@RequestParam(value="title") String title, Model model) {
		return communityService.checkCommuTitle(title);
	}
	
	@RequestMapping(value="/communityImageUpdate.do", method=RequestMethod.POST)
	public @ResponseBody CommunityImgDto communityImageUpdate(MultipartHttpServletRequest request) throws Exception {
		System.out.println("--- communityImageUpdate 실행 ---");
		MultipartFile upimage = request.getFile("image");
		
		CommunityImgDto returnValue = new CommunityImgDto();
		
		long communityNo = Long.parseLong(request.getParameter("communo"));
		String imageName = System.currentTimeMillis() + upimage.getOriginalFilename();
		
		returnValue.setCommuImg(imageName);
		returnValue.setCommuNo(communityNo);
		
		System.out.println("파일 저장 시작");
				
		File file = new File(saveDirectory, imageName);		
		FileCopyUtils.copy(upimage.getInputStream(), new FileOutputStream(file));				
		
		// 파일등록하는 서비스 호출
		communityService.communityImageUpdate(returnValue);
		
		System.out.println("파일 저장 끝");
		
		return returnValue;
	}
	
	
	@RequestMapping(value="/multipartUpload.do", method=RequestMethod.POST)
	public @ResponseBody CommunityContents multipartUpload(MultipartHttpServletRequest request) throws Exception {
		System.out.println("--- 멀티파트업로드 컨트롤러 실행 ---");
		MultipartFile upfile = request.getFile("file");
		
		CommunityContents returnValue = new CommunityContents();
		
		long communityNo = Long.parseLong(request.getParameter("communo"));
		long userNo = Long.parseLong(request.getParameter("userno"));
		
		System.out.println("upfile filename : " + upfile.getOriginalFilename());
		System.out.println("upfile byte: " + upfile.getBytes());
		System.out.println("upfile size: " + upfile.getSize());
		System.out.println("upfile name: " + upfile.getName());
		System.out.println("upfile contentType: " + upfile.getContentType());
		System.out.println("upfile class: " + upfile.getClass());
		System.out.println("upfile inputStream: " + upfile.getInputStream());
		/*
		 * communo : 1
		 * userno : 6
		 * filename : lion.jpg
		 * byte: [B@128c0f76
		 * size: 8976
		 * name: file
		 * contentType: image/jpeg
		 * class: class org.springframework.web.multipart.commons.CommonsMultipartFile
		 * inputStream: java.io.ByteArrayInputStream@571fc09f
		 */
		
		// 저장소에 파일 저장 로직
		if(!upfile.isEmpty()) {
			System.out.println("파일 저장 시작");
			
			String filename = upfile.getOriginalFilename();
			
			String fileType = upfile.getContentType().substring(0, 4);
			
			// 파일 식별
			if("imag".equals(fileType)) {
				// 이미지인 경우
				filename = System.currentTimeMillis() + "imag" + filename;
			} else {
				// 파일인 경우
				// 어떤파일인지도 구별할 것인가?
				filename = System.currentTimeMillis() + "file" + filename;
			}
			
			File file = new File(saveDirectory, filename);
			
			FileCopyUtils.copy(upfile.getInputStream(), new FileOutputStream(file));
			
			// 파일등록하는 서비스 호출
			long comContentNo = communityService.addContent(communityNo, userNo, filename);
			
			System.out.println("파일 저장 끝");
			
			
			// 반환값 설정
			
			returnValue.setNo(comContentNo);
			returnValue.setUserNo(userNo);
			returnValue.setCommunitiesNo(communityNo);
		}
		return returnValue;
	}
	
	
	
//  리다이렉트 참고용
//	@GetMapping("/community/test.do")
//	public String communityTest() {
//		System.out.println("hi2");
//		return "community/main";
//	}
//	//		return "redirect:test.do";
}
