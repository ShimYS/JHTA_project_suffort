package com.sample.web.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
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

import com.sample.service.CareerService;
import com.sample.service.CompanyService;
import com.sample.service.LicenseService;
import com.sample.service.UserService;
import com.sample.web.form.CareerForm;
import com.sample.web.form.CompaniesUpdateForm;
import com.sample.web.form.LicenseForm;
import com.sample.web.form.UsersUpdateForm;
import com.sample.web.vo.Careers;
import com.sample.web.vo.Companies;
import com.sample.web.vo.Licenses;
import com.sample.web.vo.Users;
/**
* Handles requests for the application home page.
*/
@Controller
@SessionAttributes({"LOGIN_USERS", "LOGIN_TYPE"})
public class UserInfoController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private CareerService careerService;
	
	@Autowired
	private LicenseService licenseService;

	@Autowired
	private CompanyService companyService;
	
	// 추가 코드
	@Value("${directory.save.uploadimg}")
	private String saveUploadImg;
	// C:/APP/eGovFrameDev-3.9.0-64bit/workspace/suffort/src/main/webapp/resources/img/uploadimg
	
	// 사용자 정보 업데이트
	@RequestMapping(value = "/board/userinfoupdate.do", method = RequestMethod.POST )
	public String userInfoUpdate(Users users, UsersUpdateForm usersUpdateForm) throws Exception {
		
		System.out.println("받아온 폼 번호" + usersUpdateForm.getNo());
		
		String prevLogo = users.getImg();
		BeanUtils.copyProperties(usersUpdateForm, users);
		
		// 위와 동일
//		users.setEmail(userUpdateForm.getEmail());
//		users.setName(userUpdateForm.getName());
//		users.setGender(userUpdateForm.getGender());
//		users.setGitAddr(userUpdateForm.getGitAddr());
//		users.setBirth(userUpdateForm.getBirth());

		// 추가 코드 (첨부파일)
		// 파일 업로드로 throws 추가
		MultipartFile upfile = usersUpdateForm.getUpfile();
		
		if (!upfile.isEmpty()) {
			String filename = upfile.getOriginalFilename();
			File file = new File(saveUploadImg, filename);
			FileCopyUtils.copy(upfile.getInputStream(), new FileOutputStream(file));
			
			// ★ 업데이트할 img를 폼에 집어넣는다
			usersUpdateForm.setImg(filename);
			// ★세션의 값을 img에 집어넣는다
			users.setImg(filename);
			
//			System.out.println(companiesUpdateForm.getLogo());
		} else {
			users.setImg(prevLogo);
		}
		
//		userService.modifyUserDetail(users);
		userService.modifyUserDetail(usersUpdateForm);
		
		return "redirect:/board/userMyPage.do";
	}
	


	

	@GetMapping("/common/career.do")
	public String careers(@RequestParam(value="userNo", required=false, defaultValue="0") long userNo, Users users, Model model) {
		
		if (users == null) {
			return "redirect:/user/userloginform.do?error=fail";
		}
		
		if (userNo != 0) {
			
			Users user = userService.getUsersDetailByNo(userNo);
			model.addAttribute("user", user);
		}
		
		return "/common/career";
	}
	
	// ajax 데이터
	@GetMapping("/common/careerajax.do")
	@ResponseBody
	public List<Careers> career(@RequestParam(value="userNo", required=false, defaultValue="0") long userNo, Users users) {

		List<Careers> careerList = new ArrayList<Careers>();
		
		if(userNo != 0) { // 0이 아닐시 (본인이 정보가 아닐시) 
			careerList = careerService.getCareerByUserNo(userNo);
			// param의 값으로 List를 구함 (타인의 리스트)
		} else {
			careerList = careerService.getCareerByUserNo(users.getNo());
			// 세션의 값으로 List를 구함 (나의 리스트)
		}
		
		return careerList;
	}
	
	// 경력 데이터 업데이트
	@RequestMapping(value = "/common/usercareerupdate.do", method = RequestMethod.POST )
	public String careerInfoUpdate(CareerForm careerForm, Users users) {
		
		Careers careers = new Careers();
		BeanUtils.copyProperties(careerForm, careers);
		careers.setUserNo(users.getNo());
		
		careerService.addNewCareer(careers);
		
		return "redirect:/common/career.do";
	}
	
	// 경력 삭제
	@RequestMapping(value = "/common/careerajaxdel.do", method = RequestMethod.GET)
	public ResponseEntity<Void> careerInfoDelete(@RequestParam("careerNo") long careerNo, Users users) {
		careerService.deleteCareer(careerNo);
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	
	
	
	
	@GetMapping("/common/license.do")
	public String license(@RequestParam(value="userNo", required=false, defaultValue="0") long userNo, Users users, Model model) {
		
		if (users == null) {
			return "redirect:/user/userloginform.do?error=fail";
		}
		
		if (userNo != 0) {
			
			Users user = userService.getUsersDetailByNo(userNo);
			model.addAttribute("user", user);
		}
		
		return"/common/license";
	}

	// ajax 데이터
	@GetMapping("/common/licenseajax.do")
	@ResponseBody
	public List<Licenses> license(@RequestParam(value="userNo", required=false, defaultValue="0") long userNo, Users users) {
		List<Licenses> licenseList = new ArrayList<Licenses>();

		if(userNo != 0) { // 0이 아닐시 (본인이 정보가 아닐시) 
			licenseList = licenseService.getLicenseByUserNo(userNo);
			// param의 값으로 List를 구함 (타인의 리스트)
		} else {
			licenseList = licenseService.getLicenseByUserNo(users.getNo());
			// 세션의 값으로 List를 구함 (나의 리스트)
		}
		
		return licenseList;
	}

	// 자격증 데이터 업데이트
	@RequestMapping(value = "/common/userlicenseupdate.do", method = RequestMethod.POST )
	public String licenseInfoUpdate(LicenseForm licenseForm, Users users) {
		Licenses licenses = new Licenses();
		BeanUtils.copyProperties(licenseForm, licenses);
		licenses.setUserNo(users.getNo());
		
		licenseService.addNewLicense(licenses);
		
		return "redirect:/common/license.do";
	}
	
	// 자격증 삭제
	@RequestMapping(value = "/common/licenseajaxdel.do", method = RequestMethod.GET)
	public ResponseEntity<Void> licenseInfoDelete(@RequestParam("licenseNo") long licenseNo, Users users) {
		licenseService.deleteLicense(licenseNo);
		
		return new ResponseEntity<>(HttpStatus.OK);
	}

	
	
	


	
	// 회사 정보 업데이트
	@RequestMapping(value = "/board/companyinfoupdate.do", method = RequestMethod.POST )
	public String companyInfoUpdate(Companies companies, CompaniesUpdateForm companiesUpdateForm) throws Exception {
		
		System.out.println("받아온 폼 번호" + companiesUpdateForm.getNo());
		// hidden으로 no를 넣게끔 셋팅해놨음, mapper에서 where = no로 update문을 실행할것임
		
//		BeanUtils.copyProperties(companies, savedCompanies);
		String prevLogo = companies.getLogo();
		BeanUtils.copyProperties(companiesUpdateForm, companies);
		
//		companies.setNo(companiesUpdateForm.getNo());...content 등 이것들과 같겠지
		System.out.println("넣은 컴프 번호" + companies.getNo());
		
		// 추가 코드 (첨부파일)
		// 파일 업로드로 throws 추가
		MultipartFile upfile = companiesUpdateForm.getUpfile();
		
		if (!upfile.isEmpty()) {
			String filename = upfile.getOriginalFilename();
			File file = new File(saveUploadImg, filename);
			FileCopyUtils.copy(upfile.getInputStream(), new FileOutputStream(file));
			
			// ★ 업데이트할 logo를 폼에 집어넣는다
			companiesUpdateForm.setLogo(filename);
			// ★세션의 값을 logo에 집어넣는다
			companies.setLogo(filename);
		} else {
			companies.setLogo(prevLogo);
		}

//		companyService.modifyCompaniesDetail(companies);
		companyService.modifyCompaniesDetail(companiesUpdateForm);
		System.out.println("회사 정보 업데이트 성공!");
		
		return "redirect:/board/compMyPage.do?companyNo="+ companies.getNo();
	}

	
	
}