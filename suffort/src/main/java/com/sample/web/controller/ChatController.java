package com.sample.web.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.apache.catalina.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.sample.dao.CommunityDao;
import com.sample.service.CommunityService;
import com.sample.web.dto.CommunityDto;
import com.sample.web.vo.Communities;

@Controller
public class ChatController {
//	
//	
//	// 임시 방 번호 생성기
//	//static long roomNumber;
//	
//	// 방 리스트
//	List<Communities> roomList = new ArrayList<>();
//	
//	@Autowired
//	CommunityService communityService;
//	
//	// 채팅 페이지
//	@GetMapping("/chat.do")
//	public String chat() {
//		return "/community/chat";
//	}
//	
//	//방 페이지
//	@GetMapping("/room.do")
//	public String room() {
//		return "/community/room";
//	}
//	
//	/*
//	 * 방에 들어가야 할 정보 => 방번호, 방제목
//	 */
//	@PostMapping("/createRoom.do")
//	public String createRoom(HttpServletRequest request, HttpServletResponse response){
//		// 파라미터에서 방제목 읽어오기 (프론트에서 배열로 담겨왔기때문에 키로 찾아준다)
//		String roomTitle = request.getParameter("roomTitle");
//		
//		Communities newCommunity = new Communities();
//		newCommunity.setTitle(roomTitle);
//		// http세션을 가져와서 유저정보 등록
//		//HttpSession session = request.getSession();
//		//User user = (User) session.getAttribute("user");
//		newCommunity.setUserNo(1);
//		// 방생성, 방에 유저 조인 
//		Communities communities = communityService.addNewCommunity(newCommunity);
//
//		// 방 리스트 반환
//		return "joinRoom.do?roomTitle="+communities.getTitle()+"&"+"roomNumber="+communities.getNo();
//	}
//	
//	
//	// 
//	
//	
//	@GetMapping("/joinRoom.do")
//	public String joinRoom(@RequestParam HashMap<Object, Object> params, Model model) {
//		// 참여하려는 방번호를 가져온다
//		int roomNumber = Integer.parseInt((String)params.get("roomNumber"));
//		
//		// 방 리스트에서 방번호와 일치하는 방이 있는지 검사하고
//		// 하나라도 동일한 방이 있으면 채팅 방으로 이동 (방번호, 방제목과 함께)
//		for(Communities room : roomList) {
//			if(room.getNo() == roomNumber ){
//				model.addAttribute("roomNumber", params.get("roomNumber"));
//				model.addAttribute("roomTitle", params.get("roomTitle"));
//				return "/community/chat";
//			}
//		}
//		// 방 리스트에 방번호와 일치하는 방이 하나도 없는 경우 room.do페이지로 이동
//		return "/community/room";
//	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//	List<Communities> roomList = new ArrayList<Communities>();
//	//HashMap<Room, List<WebSocketSession>> roomMap = new HashMap<>(); 
//	HashMap<Users, WebSocketSession> userMap = new HashMap<>();
//	static long roomNumber;
//	static long userNumber;
//	
//	// 채팅 페이지
//	@GetMapping("/chat.do")
//	public String chat() {
//		return "/community/chat";
//	}
//	
//	// 방 페이지
//	@GetMapping("/room.do")
//	public String room() {
//		return "/community/room";
//	}
//	
//	// 방 생성하기
//	@PostMapping("/createRoom.do")
//	public @ResponseBody List<Communities> createRoom(@RequestParam HashMap<Object, Object> params) {
//		String roomTitle =  (String)params.get("roomTitle");
//		if(roomTitle != null && !roomTitle.trim().equals("")) {
//			Communities room = new Communities();
//			room.setNo(++roomNumber);
//			room.setTitle(roomTitle);
//			roomList.add(room);
//			//roomMap.put(room, )
//		}
//		return roomList;
//	}
//	
//	// 유저 생성하기
//	@PostMapping("/createUser.do")
//	public @ResponseBody HashMap<Users, WebSocketSession> createUser(@RequestParam HashMap<Object, Object> params) {
//		String userName = (String)params.get("userName");
//		// 세션정보담기
//		if(userName != null && !userName.trim().equals("")) {
//			Users user = new Users();
//			user.setNo(++userNumber);
//			
//			// ajax로 유저생성 할때 ws값 담아서 오면 되나????????????????????????
//			WebSocketSession session = (WebSocketSession) params.get("ws");
//			userMap.put(user, session);
//		}	
//		return userMap;
//	}
//	
//	// 방 정보 가져오기
//	@GetMapping("/getRoom.do")
//	public @ResponseBody List<Communities> getRoom(@RequestParam HashMap<Object, Object> params) {
//		return roomList;
//	}
//	
//	// 유저 정보 가져오기
//	@GetMapping("/getUser.do")
//	public @ResponseBody HashMap<Users, WebSocketSession> getUser(@RequestParam HashMap<Object, Object> params) {
//		return userMap;
//	}
//	
//	
//	// 채팅방
//	@GetMapping("/chating.do")
//	public ModelAndView chating(@RequestParam HashMap<Object, Object> params) {
//		ModelAndView mv = new ModelAndView();
//		int roomNumber = Integer.parseInt((String)params.get("roomNumber"));
//		
//		List<Communities> newList = roomList.stream().filter(room->room.getNo() == roomNumber).collect(Collectors.toList());
//		System.out.println("newList : " + newList);
//		if(newList != null && newList.size() > 0) {
//			mv.addObject("roomTitle", params.get("roomTitle"));
//			mv.addObject("roomNumber", params.get("roomNumber"));
//			mv.setViewName("/community/chat");
//		} else {
//			mv.setViewName("/community/room");
//		}
//		return mv;
//	}
	
}






















