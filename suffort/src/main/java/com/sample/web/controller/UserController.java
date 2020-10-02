package com.sample.web.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.sample.service.CompanyService;
import com.sample.service.UserService;
import com.sample.web.form.CompaniesForm;
import com.sample.web.form.UsersForm;
import com.sample.web.vo.Companies;
import com.sample.web.vo.Users;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/user")
//@SessionAttributes({"LOGIN_COMPANY", "LOGIN_TYPE"})
@SessionAttributes({"LOGIN_USERS", "LOGIN_TYPE"})
public class UserController {
	
	@Autowired
	private CompanyService companyService;
	
	@Autowired
	private UserService userService;
	
	/*
	 * 1. 모든 주소는 'container.jsp'를 호출하도록 지정
	 * 2. container.jsp 내부에는 <%@ include file="${contentLocation }" %> 태그로 변동되는 페이지를 지정된 div 내부에 출력하도록 설정되어 있음
	 * 3. model에 addAttribute() 메소드를 사용해서contentLocation 주소를 @RequestMapping에 해당하는 실제 페이지로 설정해서 반환
	 * 
	 * contentLocation 페이지가 고장나더라도 container.jsp 자체는 실행되지 않을까 싶은데 그건 모르겠네용ㅎ
	 * 
	 * 아래 예시 - /community/main.do 요청이 왔을 때
	 * return String은 'container' (실질적으로는 /경로/container.jsp가 되겠죠)
	 * 내부에 contentLocation = '../community/main.jsp'라는 jsp파일 경로를 작성해 모델에 저장 
	 * (경로 기준은 container가 될 것이므로 ../ 를 사용하든 절대경로를 적든 해야 함)
	 * 
	 * 이런식으로 하면 될거같은데 실험은 안해봄
	 * 
	 * 사이드바는 model의 Attribute가 아니라 session 단위로 올려주면 매번 로딩하는 수고를 줄일 수 있을 듯
	 * 그리고 적절한 경로가 없을 때를 대비한 default 페이지를 @ModelAttribute에 하나 달아놔도 좋을 것 같습니다.
	 * 
	 * @민석
	 */

	
//	@SessionAttributes("sidebarLocation")
//  public .... method 하나 만들고
//  여기서 sidebar 주소 설정 (사이드바는 controller 내부의 주소들끼리는 동일한 사이드바를 공유할 것이므로)
	
	
	
// 개별 요청에 대한 처리 방식 예시
	
	@RequestMapping(value = "/totallogin.do", method = RequestMethod.GET)
	public String totalLogin() {
	
		return "user/totalLogin";
	}

//	@RequestMapping(value = "/userloginform.do", method = RequestMethod.GET)
//	public String userLogin() {
//		
//		return "user/userLoginForm";
//	}

	@RequestMapping(value = "/usersignupform.do", method = RequestMethod.GET)
	public String userSignup() {
		
		return "user/userSignupForm";
	}
	
	// 유저 회원가입 시 
	@RequestMapping(value = "/usercompleted.do", method = RequestMethod.POST)
	public String userComplete(UsersForm userForm) {
		// Users는 세션처리 되어있어서 사용 불가
		// UsersForm 따로 생성 후 input 값 받고 넣기
		
		// 회원가입 처리
		
		Users isExistUser = userService.getUsersDetailById(userForm.getUserId());
		
		// 새로운 아이디일 경우
		if (isExistUser == null) {
			// 회원가입 처리
			userService.addNewUser(userForm);
		} else {
			// 중복된 아이디일 경우, 오류메시지 출력
			return "redirect:/user/usersignupform.do?error=already";
		}
		
		return "user/totalLogin";
	}

	// ajax 아이디 중복 체크
	@RequestMapping(value = "/userCheckId.do", method = RequestMethod.POST)
	@ResponseBody
	public String checkUserId(@RequestParam ("userId") String userId) {
		System.out.println("값 찍어보기" + userId);
		Users isExistUser = userService.getUsersDetailById(userId);
		String answer = "";
		
		if (isExistUser == null) {
			System.out.println("저장된 아이디가 없으니 가능");
			answer = "1";
		} else {
			System.out.println("저장된게 있어서 안됨");
			answer = "0";
		}
		return answer;
	}
	
	// 로그인 시
	@RequestMapping(value = "/userlogincheck.do", method = RequestMethod.POST)
//	public String compLoginCheck(String companyId, String companyPwd) { 안됨
//	public String compLoginCheck(Companies companies, Model model) {	얘는 됨
	public String userLoginCheck(@RequestParam("id") String userId,
								 @RequestParam("loginWay") String userPwd, Model model, HttpSession session) {
		
		// System.out.println(companies.getId() + "여기니");
		
//		Companies savedCompanies = companyService.login(companyId, companyPwd);
//		Companies savedCompanies = companyService.login(companies.getId(), companies.getPassword());
		Users savedUsers = userService.login(userId, userPwd);
		
		// 값 넘어오는지 테스트
		// System.out.println(savedCompanies.getId());
		
		if (savedUsers == null) {
			return "redirect:/user/userloginform.do?error=fail";
		}
		if("Y".equals(savedUsers.getDeleted()) ) {
			return "redirect:/user/userloginform.do?error=again";
		}
		
//		model.addAttribute("LOGIN_COMPANY", savedUsers);
//		model.addAttribute("LOGIN_TYPE", "user");
		
		if(savedUsers.getId().equals("admin")) {
			session.setAttribute("LOGIN_USERS", savedUsers);
			session.setAttribute("LOGIN_TYPE", "admin");
		} else {
			session.setAttribute("LOGIN_USERS", savedUsers);
			session.setAttribute("LOGIN_TYPE", "user");
		}
		
		
		
		// 나중에 home으로 바꾸자
		return "redirect:/home.do";
	}

	
	
	
	
	
	
	
	
	// 기업 로그인 페이지
	@RequestMapping(value = "/comploginform.do", method = RequestMethod.GET)
	public String compLogin() {
	
		return "user/compLoginForm";
	}
	
	// 기업 회원가입 페이지
	@RequestMapping(value = "/compsignupform.do", method = RequestMethod.GET)
	public String compSignup() {
		
		return "user/compSignupForm";
	}
	
	// 회원가입 시
// 	@RequestMapping(/user/compcompleted.do" 랑 같다)
	@RequestMapping(value = "/compcompleted.do", method = RequestMethod.POST)
	public String compComplete(CompaniesForm compForm) {
		
		// 아이디 중복 검사
		Companies isExistComp = companyService.getCompaniesDetail(compForm.getCompId());

		if (isExistComp == null) {
			// 회원가입 처리
			companyService.addNewCompanies(compForm);
		} else {
			// 이미 중복된 아이디일 경우, 오류메시지 출력
			return "redirect:/user/compsignupform.do?error=already";
		}
		
		return "user/totalLogin";
	}
	
	// ajax 아이디 중복 체크
	@RequestMapping(value = "/compCheckId.do", method = RequestMethod.POST)
	@ResponseBody
	public String checkCompId(@RequestParam ("compId") String companyId) {
		System.out.println("값 찍어보기" + companyId);
		Companies isExistComp = companyService.getCompaniesDetail(companyId);
		String answer = "";
		
		if (isExistComp == null) {
			System.out.println("저장된 아이디가 없으니 가능");
			answer = "1";
		} else {
			System.out.println("저장된게 있어서 안됨");
			answer = "0";
		}
		return answer;
	}

	// 로그인 시
	@RequestMapping(value = "/complogincheck.do", method = RequestMethod.POST)
//	public String compLoginCheck(String companyId, String companyPwd) { 안됨
//	public String compLoginCheck(Companies companies, Model model) {	얘는 됨
	public String compLoginCheck(@RequestParam("id") String companyId,
								 @RequestParam("password") String companyPwd, Model model, HttpSession session) {
		
//		Companies savedCompanies = companyService.login(companyId, companyPwd);
//		Companies savedCompanies = companyService.login(companies.getId(), companies.getPassword());
		Companies savedCompanies = companyService.login(companyId, companyPwd);
		
		// 값 넘어오는지 테스트
		// System.out.println(savedCompanies.getId());
		
		if (savedCompanies == null) {
			return "redirect:/user/comploginform.do?error=fail";
		}
		
//		model.addAttribute("LOGIN_COMPANY", savedCompanies);
//		model.addAttribute("LOGIN_USERS", savedCompanies);
//		model.addAttribute("LOGIN_TYPE", "company");

		if(savedCompanies.getId().equals("admin")) {
			session.setAttribute("LOGIN_USERS", savedCompanies);
			session.setAttribute("LOGIN_TYPE", "admin");
		} else {
			session.setAttribute("LOGIN_USERS", savedCompanies);
			session.setAttribute("LOGIN_TYPE", "company");
		}
		
		
		// 나중에 home으로 바꾸자
		return "redirect:/home.do";
	}

//	@GetMapping("/logout.do")
//	public String signOut(SessionStatus sessionStatus) {
//		sessionStatus.setComplete();
//		
//		return "redirect:/board/userTotalBoard.do";
//	}
	
}