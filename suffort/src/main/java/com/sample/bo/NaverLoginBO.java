package com.sample.bo;
import java.io.IOException;
import java.util.UUID;
import javax.servlet.http.HttpSession;
import org.springframework.util.StringUtils;
import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;
import com.sample.api.NaverLoginApi;

	public class NaverLoginBO {
		
	/* 인증 요청문을 구성하는 파라미터 */
	//client_id: 애플리케이션 등록 후 발급받은 클라이언트 아이디
	//response_type: 인증 과정에 대한 구분값. code로 값이 고정돼 있습니다.
	//redirect_uri: 네이버 로그인 인증의 결과를 전달받을 콜백 URL(URL 인코딩). 애플리케이션을 등록할 때 Callback URL에 설정한 정보입니다.
	//state: 애플리케이션이 생성한 상태 토큰
	private final static String CLIENT_ID = "7aAqNQ_CciEFrKxlhdJH";
	private final static String CLIENT_SECRET = "oUoDd9_325";
	private final static String REDIRECT_URI = "http://localhost/user/callback";
	//// 이게 콜백
	private final static String SESSION_STATE = "oauth_state";
	
	/* 프로필 조회 API URL */
	private final static String PROFILE_API_URL = "https://openapi.naver.com/v1/nid/me";
	
	/* 네이버 아이디로 인증 URL 생성 Method */
	public String getAuthorizationUrl(HttpSession session) {
		
		/* 세션 유효성 검증을 위하여 난수를 생성 */
		String state = generateRandomString();
		
		setSession(session,state);
		// org.apache.catalina.session.StandardSessionFacade@5cfee15f 에 state 난수 XXXXX를 넣는다
		
		/* Scribe에서 제공하는 인증 URL 생성 기능을 이용하여 네아로 인증 URL 생성 */
		OAuth20Service oauthService = new ServiceBuilder()
			.apiKey(CLIENT_ID)
			.apiSecret(CLIENT_SECRET)
			.callback(REDIRECT_URI)
			.state(state) //앞서 생성한 난수값을 인증 URL생성시 사용함
			.build(NaverLoginApi.instance());
		//////////////NaverLoginApi 임포트했음
		// oauthService 기존 데이터 https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id= 에
		return oauthService.getAuthorizationUrl();
		// 반환값으로 7aAqNQ_CciEFrKxlhdJH + oUoDd9_325 + 				http://localhost:80/user/totallogin 난수 + 											변하지않는 NaverLoginApi 객체 를 반환
		// 네이버 : 7aAqNQ_CciEFrKxlhdJH (시크릿 안보임) (&redirect_uri=) 	http://localhost:80/user/totallogin	(&state=)4fd73df1-b5b9-43bd-b599-f291c706dce7

	}
	
	/* 네이버아이디로 Callback 처리 및 AccessToken 획득 Method */
	public OAuth2AccessToken getAccessToken(HttpSession session, String code, String state) throws IOException {
		// 세션, 로그인 성공코드(authorization code), 안전코드를 사용
		
		/* Callback으로 전달받은 세선검증용 난수값과 세션에 저장되어있는 값이 일치하는지 확인 */
		String sessionState = getSession(session);
		// 세션에 저장됬던, 유효성 검증을 위한 난수 XXXXX를 받아와서 스트링 sessionState에 저장
		// seseionState 에는 난수 XXXXX가 들어있다
		
		if (StringUtils.pathEquals(sessionState, state)) {
			// 세션 난수 XXXXX의 경로와, 매개변수의 경로  71978093-be5d-45e4-bae9-82a686c62113가 같다면
			OAuth20Service oauthService = new ServiceBuilder()
				.apiKey(CLIENT_ID)
				.apiSecret(CLIENT_SECRET)
				.callback(REDIRECT_URI)
				.state(state)
				.build(NaverLoginApi.instance());
			// oauthService 기존 데이터 https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id= 에
			// 반환값으로 7aAqNQ_CciEFrKxlhdJH + oUoDd9_325 + 				http://localhost:80/user/totallogin 난수 + 										변하지않는 NaverLoginApi 객체 를 반환
			// 네이버 : 7aAqNQ_CciEFrKxlhdJH (시크릿 안보임) (&redirect_uri=) 	http://localhost:80/user/totallogin	(&state=)4fd73df1-b5b9-43bd-b599-f291c706dce7
			
			/* Scribe에서 제공하는 AccessToken 획득 기능으로 네아로 Access Token을 획득 */
			OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
			// OAuth2.0 service class의 getAccessToken 메서드를 사용하기 위해 매개변수로 성공코드를 집어넣고 accessToken을 받아옴
			return accessToken;
			// accessToken을 반환
		}
		
		return null;
	}
	
	

	/* Access Token을 이용하여 네이버 사용자 프로필 API를 호출 */
	public String getUserProfile(OAuth2AccessToken oauthToken) throws IOException {
		
		OAuth20Service oauthService = new ServiceBuilder()
			.apiKey(CLIENT_ID)
			.apiSecret(CLIENT_SECRET)
			.callback(REDIRECT_URI).build(NaverLoginApi.instance());
		

		OAuthRequest request = new OAuthRequest(Verb.GET, PROFILE_API_URL, oauthService);
		oauthService.signRequest(oauthToken, request);
		Response response = request.send();
			
		return response.getBody();
	}

	/* 네이버아이디로 Callback 처리 및 AccessToken 획득 Method */
	public OAuth2AccessToken deleteToken(HttpSession session, String code, String state) throws IOException {
		// 세션, 로그인 성공코드(authorization code), 안전코드를 사용
		
		/* Callback으로 전달받은 세선검증용 난수값과 세션에 저장되어있는 값이 일치하는지 확인 */
		String sessionState = getSession(session);
		// 세션에 저장됬던, 유효성 검증을 위한 난수 XXXXX를 받아와서 스트링 sessionState에 저장
		// seseionState 에는 난수 XXXXX가 들어있다
		
		if (StringUtils.pathEquals(sessionState, state)) {
			// 세션 난수 XXXXX의 경로와, 매개변수의 경로  71978093-be5d-45e4-bae9-82a686c62113가 같다면
			OAuth20Service oauthService = new ServiceBuilder()
				.apiKey(CLIENT_ID)
				.apiSecret(CLIENT_SECRET)
				.callback(REDIRECT_URI)
				.state(state)
				.build(NaverLoginApi.instance());
			// oauthService 기존 데이터 https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id= 에
			// 반환값으로 7aAqNQ_CciEFrKxlhdJH + oUoDd9_325 + 				http://localhost:80/user/totallogin 난수 + 										변하지않는 NaverLoginApi 객체 를 반환
			// 네이버 : 7aAqNQ_CciEFrKxlhdJH (시크릿 안보임) (&redirect_uri=) 	http://localhost:80/user/totallogin	(&state=)4fd73df1-b5b9-43bd-b599-f291c706dce7
			
			/* Scribe에서 제공하는 AccessToken 획득 기능으로 네아로 Access Token을 획득 */
			OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
			// OAuth2.0 service class의 getAccessToken 메서드를 사용하기 위해 매개변수로 성공코드를 집어넣고 accessToken을 받아옴
			return accessToken;
			// accessToken을 반환
		}
		
		return null;
	}
	
	
	
	/* 세션 유효성 검증을 위한 난수 생성기 */
	private String generateRandomString() {
		return UUID.randomUUID().toString();
	}
	
	/* http session에 데이터 저장 */
	private void setSession(HttpSession session,String state) {
		session.setAttribute(SESSION_STATE, state);
	}
	
	/* http session에서 데이터 가져오기 */
	private String getSession(HttpSession session) {
		return (String) session.getAttribute(SESSION_STATE);
	}
	
}
