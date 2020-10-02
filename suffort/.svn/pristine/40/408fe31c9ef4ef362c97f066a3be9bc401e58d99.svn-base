package com.sample.web.controller;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.sample.bo.NaverLoginBO;
import com.sample.service.CareerService;
import com.sample.service.UserService;
import com.sample.web.vo.Users;
/**
* Handles requests for the application home page.
*/
@Controller
//@SessionAttributes("TEMP_USER")
@SessionAttributes({"TEMP_USER", "LOGIN_USERS", "LOGIN_TYPE"})
public class LoginController {
	
	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;

	@Autowired
	private CareerService careerService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	
	
	//로그인 첫 화면 요청 메소드
	@RequestMapping(value = "/user/userloginform", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(Model model, HttpSession session) {
		///// value = "/login" 을 위에꺼로 변경했음
		//// 네아로에 서비스 URL 값과 동일해야 함! .do 붙이지말고!
		System.out.println("첫번째 로그인");
		
		System.out.println("model : " + model); // model : {}
		System.out.println("session : " + session);
		// session : org.apache.catalina.session.StandardSessionFacade@5cfee15f 이런식, 세션은 한번 부수기 전까지 유지됨
		
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
											// 반환값으로 7aAqNQ_CciEFrKxlhdJH + oUoDd9_325 + http://localhost/user/callback + state=난수 + 변하지않는 NaverLoginApi 객체 를 반환 받았다
		
		System.out.println("네이버 : " + naverAuthUrl);
		// 네이버 : https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=7aAqNQ_CciEFrKxlhdJH&redirect_uri=http://localhost/user/callback&state=f6bcf8ef-4a64-410f-9f88-23f91d232f33
		model.addAttribute("url", naverAuthUrl);
		System.out.println("model : " + model);
		System.out.println("로그인 첫 화면 끝");
		System.out.println("");
		// model : {url=https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=7aAqNQ_CciEFrKxlhdJH&redirect_uri=http://localhost/user/callback&state=f6bcf8ef-4a64-410f-9f88-23f91d232f33}
		// url은 키값
		return "user/userLoginForm";
		//return "login";
	}
	
	//네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/user/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws IOException, ParseException {
		///// value = "/callback" 을 위 코드로 변경했음
		//// 네아로 Callback URL과 동일해야 함! .do 붙이지말고!
		//// modal, url로 받아온 로그인 성공코드(Cb9DxErZB0JmsnlTgS), 받은 난수 state, 세션 session 매개변수 사용
		System.out.println("여기는 callback");
		System.out.println("model : " + model); // model : {}
		// model에 토큰 받을거니까 requestparam으로 받아오지 않아도 됨
		
		System.out.println("code : " + code); // code : Cb9DxErZB0JmsnlTgS
		// 로그인 인증 요청 API 호출에 성공하고 리턴받은 인증코드값 (authorization code)
		// login을 성공했다는 뜻, 오너가 클라이언트에게 보내준 로그인 성공코드(authorization code)
		
		System.out.println("state : " + state); // state : 71978093-be5d-45e4-bae9-82a686c62113
		// 사이트 간 요청 위조(cross-site request forgery) 공격을 방지하기 위해 애플리케이션에서 생성한 상태 토큰값으로 URL 인코딩을 적용한 값을 사용?
		// 안전코드 정도?
		
		System.out.println("session : " + session); // session : org.apache.catalina.session.StandardSessionFacade@26792940
		// session : org.apache.catalina.session.StandardSessionFacade@5cfee15f
		// 위에서 썼던 세션과 동일
		
		OAuth2AccessToken oauthToken;
		// Token 객체 생성
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		//// 새 세션, 로그인 성공코드, 안전코드를 사용해서 getAccessToken 메서드 실행
		//// if문을 통과하면 리턴한 accessToken을 oauthToken에 저장한다
		
		System.out.println("나는 토큰이다 : " + oauthToken);
		
		//1. 로그인 사용자 정보를 읽어온다.
		apiResult = naverLoginBO.getUserProfile(oauthToken); //String형식의 json데이터
		// 액세스 토큰으로 사용자 정보를 읽어오고
        System.out.println("유저 프로필 : "+ naverLoginBO.getUserProfile(oauthToken).toString());
        /**
		apiResult json 구조
			{"resultcode":"00",
			"message":"success",
			"response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
		**/

		// 2. String형식인 apiResult를 json형태로 바꿈
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;
		
		// 3. 데이터 파싱
		//Top레벨 단계 _response 파싱
		JSONObject response_obj = (JSONObject)jsonObj.get("response");
		
		//// response의 속성값들 파싱
		String id = (String) response_obj.get("id");
//		String nickname = (String) response_obj.get("nickname");
//		String age = (String) response_obj.get("age");
		String gender = (String) response_obj.get("gender");
		String email = (String) response_obj.get("email");
		String name = (String) response_obj.get("name");
		
		Map<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("name", name);
		map.put("gender", gender);
		map.put("email", email);
		map.put("loginWay", "naver/" + id);
		model.addAttribute("TEMP_USER", map);
		System.out.println("temp_user의 정보: " + map);
		
        System.out.println("result 값 : " + apiResult);
	    System.out.println("콜백 끝");
	    System.out.println("");
		//return "login";
	    return "redirect:/user/loginsubmit.do";
	}
	
	//form
	@RequestMapping(value = "/user/loginsubmit.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String loginSubmit(@ModelAttribute("TEMP_USER") Map<String, String> map, HttpSession session) throws IOException {
		/////// User 임포트
		System.out.println("여기는 submit");
		
		System.out.println("*****id : " + map.get("id"));
		System.out.println("*****loginWay : " + map.get("loginWay"));
		
		Users user = userService.getUsersDetailById(map.get("id"));
		System.out.println("사용자 정보: " + user);
		
		// DB에 user 정보가 없을 경우
		if(user == null) {
			user = new Users();
			user.setId(map.get("id"));
			user.setName(map.get("name"));
			user.setGender(map.get("gender"));
			user.setEmail(map.get("email"));
			user.setLoginWay(map.get("loginWay"));
			
			userService.addNewUserApi(user);
			
			// 방금등록한 유저조회
			Users newUser = userService.getUsersDetailById(map.get("id"));
			
			// 조회한 유저의 번호를 user.serNo()넣어주기
			user.setNo(newUser.getNo());
			
			System.out.println("id와 loginWay를 db에 등록 완료!");
			System.out.println("");
		} 
		
		session.setAttribute("LOGIN_USERS", user);
//		session.setAttribute("LOGIN_TYPE", "user");
		session.setAttribute("LOGIN_TYPE", "naver");
		
		// 홈으로 변경
		return "redirect:/home.do";
	}


	//로그아웃
	@RequestMapping(value = "/logout.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String logout(HttpSession session, SessionStatus sessionStatus)throws IOException {
		//// ★★★ 로그아웃 경로 나중에 다시 짜기, 지금 경로 comp에 로그아웃이랑 겹친다
		System.out.println("여기는 logout");
		session.invalidate();
		sessionStatus.setComplete();
		
		System.out.println("로그아웃 완료");
	//	return "user/NaverLogOut";
		return "redirect:/home.do";
		// ★★★ 얘도 나중에 home.do 로 보내기?
	}
	
	// 회원 탈퇴?????
	@RequestMapping(value = "/delete", method = { RequestMethod.GET, RequestMethod.POST })
	public String deleteId(HttpSession session)throws IOException {
		System.out.println("토큰 삭제");
		
		return "redirect:index.jsp";
	}

	
	
	//탈퇴
	@GetMapping("/user/userDelete.do")
	public String userDelete(@RequestParam("userNo") long userNo,HttpSession session,SessionStatus sessionStatus) {
		if("naver".equals("LOGIN_TYPE")) {
			
			userService.deleteUser(userNo);
			session.invalidate();
			sessionStatus.setComplete();
			return "redirect:https://nid.naver.com/user2/help/externalAuth.nhn?lang=ko_KR";
		}
		userService.deleteUser(userNo);
		session.invalidate();
		sessionStatus.setComplete();
		return "redirect:/home.do";
	}
	
	
	
	
	
	
}
