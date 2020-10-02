package com.sample.web.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.sample.service.CategoryService;
import com.sample.service.UserBoardService;
import com.sample.service.UserService;
import com.sample.web.dto.UserBoardDto;
import com.sample.web.form.UserBoardForm;
import com.sample.web.vo.Categories;
import com.sample.web.vo.Companies;
import com.sample.web.vo.UserBoard;
import com.sample.web.vo.UserCompLikes;
import com.sample.web.vo.UserUserLikes;
import com.sample.web.vo.Users;

@Controller
public class UserBoardController {
	
	@Autowired
	private UserBoardService userBoardService;

	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private UserService userService;
	
	//사용자 마이페이지 리스트
	@GetMapping("/board/userMyPage.do")
	public String mypage(@RequestParam(value="userNo", required=false, defaultValue="0") long userNo, Users users, Model model) {
		System.out.println("마이페이지 사용자"+users);
		if(users == null) {
			return "user/totalLogin";
		}
		List<UserBoardDto> userMyPage = new ArrayList<UserBoardDto>();
		
		userMyPage = userBoardService.getUserBoardsByNo(users.getNo());
		
		model.addAttribute("userMyPage", userMyPage);
		
		return "board/userMyPage";
	}
	
	
	
	//더보기
	@GetMapping("/board/more.do")
	@ResponseBody
	public Map<String, Object> more(@RequestParam(value="pageNo", required=false, defaultValue="1") int pageNo, 
			@RequestParam(value="tagNo",required=false,defaultValue="-1") long tagNo, Model model, Users users, Companies companies){
		Map<String, Object> paramMap = new HashMap<String, Object>();	
		int rows = 7;
		int offset = (pageNo -1) * rows;
		paramMap.put("offset", offset);
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
		
		
		Map<String, Object> result = userBoardService.getAllUserBoard(paramMap);
		int totalRows = (int) result.get("totalRows");
		int totalPages = (int) Math.ceil((double)totalRows/rows);
		result.put("totalPages", totalPages);
		
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
	
	//회원 전체 리스트
	@GetMapping("/board/userTotalBoard.do")
	public String totalBoard() {
		return "board/totalBoard";
	}
	
	
	//회원 전체 리스트의 summary json
	@GetMapping("/board/userSummaryBoard.do")
	@ResponseBody
	public UserBoardDto summary(@RequestParam("userBoardNo") long userBoardNo){
		return userBoardService.getTotalBoardDetail(userBoardNo);
	}
	
	//회원 전체 리스트 디테일
	@GetMapping("/board/userTotalBoardDetail.do")
	public String totalBoardDetail(@RequestParam("userBoardNo") long boardNo,
			@RequestParam(value="userNo", required=false, defaultValue="0")long userNo, Model model) {
		UserBoardDto boardDto = userBoardService.getTotalBoardDetail(boardNo);
		model.addAttribute("boardDto", boardDto);
		if(userNo != 0) {
			Users user = userService.getUsersDetailByNo(userNo);
			model.addAttribute("user", user);
		}
		
		return "board/totalBoardDetail";
	}
	
	//디테일에서 삭제
	@GetMapping("/board/userBoardDelete.do")
	public String userBoardDelete(@RequestParam("userBoardNo") long userBoardNo) {
		userBoardService.deletUserBoard(userBoardNo);
		return "redirect:userTotalBoard.do";
	}
	
	//사용자 마이페이지 글쓰기 (회원전체게시판에서 글쓰기 버튼을 누를 때 여기로 이등)
	@GetMapping("/board/userBoardWrite.do")
	public String userBoardWrite(Model model) {
		List<Categories> categories = categoryService.getAllCategories();
		model.addAttribute("categories", categories);
		return "board/userBoardWrite";
	}
	//글쓰디
	@PostMapping("/board/userBoardWrite.do")
	public String addUserBoard(UserBoardForm userBoardForm, Users users) {
		UserBoard userBoard = new UserBoard();
		
		System.out.println(users);
		System.out.println(users.getNo());
		System.out.println(users.getId());
		System.out.println(users.getName());
		
		BeanUtils.copyProperties(userBoardForm, userBoard);
		userBoard.setUserNo(users.getNo());
		userBoardService.addNewUserBoard(userBoard, userBoardForm.getTags());
		return "redirect:userTotalBoard.do"; //임시로
	}
	//디테일에서 수정
	@GetMapping("/board/userBoardModify.do")
	public String modify(@RequestParam("userBoardNo") long boardNo, Model model, UserBoardForm userBoardForm, Users users) {
		if(users == null) {
			return "user/totalLogin";
		}
		UserBoardDto boardDto = userBoardService.getTotalBoardDetail(boardNo);
		model.addAttribute("boardDto", boardDto);
		List<Categories> categories = categoryService.getAllCategories();
		model.addAttribute("categories", categories);
		return "/board/userBoardWriteModify";
	}
		
	@PostMapping("/board/userBoardModify.do")
	public String modifyBoard(@RequestParam("userBoardNo") long boardNo,UserBoardForm userBoardForm, Users users) {
		UserBoard userBoard = new UserBoard();
		
		BeanUtils.copyProperties(userBoardForm, userBoard);
		userBoard.setUserNo(users.getNo());
		userBoard.setUserBoardNo(boardNo);
		System.out.println(userBoard.getUserBoardNo());
		userBoardService.updateUserBoard(userBoard, userBoardForm.getTags());
		return "redirect:userMyPage.do";
	}
	
	@GetMapping("/board/userBoardUserLikes.do")
	public @ResponseBody Map<String, Object> userLikes(@RequestParam("userBoardNo") long userBoardNo,Users users) {
		
		Map<String, Object> result = new HashMap<>();
		try {
			UserUserLikes likes = new UserUserLikes();
			likes.setUserBoardNo(userBoardNo);
			likes.setUserNo(users.getNo());
			userBoardService.addUserLikes(likes);
			
			result.put("userBoardNo", userBoardNo);
			result.put("heart", "full");
			result.put("success", true);
			
		} catch (Exception e) {
			e.printStackTrace();
			result.put("success", false);
		}
		return result;
	}
	
	@GetMapping("/board/userBoardUserUnLikes.do")
	public @ResponseBody Map<String, Object> userUnLikes(@RequestParam("userBoardNo") long userBoardNo,Users users) {
		Map<String, Object> result = new HashMap<>();
		try {
			UserUserLikes likes = new UserUserLikes();
			likes.setUserBoardNo(userBoardNo);
			likes.setUserNo(users.getNo());
			userBoardService.deleteLikes(likes);
			
			result.put("userBoardNo", userBoardNo);
			result.put("heart", "blank");
			result.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			result.put("success", false);
		}
		return result;
	}
	@GetMapping("/board/userBoardCompUnLikes.do")
	public @ResponseBody Map<String, Object> compUnLikes(@RequestParam("userBoardNo") long userBoardNo,Companies companies) {
		Map<String, Object> result = new HashMap<>();
		try {
			UserCompLikes likes = new UserCompLikes();
			likes.setUserBoardNo(userBoardNo);
			likes.setCompanyNo(companies.getNo());
			userBoardService.deleteCompLikes(likes);
			
			result.put("userBoardNo", userBoardNo);
			result.put("heart", "blank");
			result.put("success", true);
			
		} catch (Exception e) {
			e.printStackTrace();
			result.put("success", false);
		}
		return result;
	}
	
	@GetMapping("/board/userBoardCompLikes.do")
	public @ResponseBody Map<String, Object> compLikes(@RequestParam("userBoardNo") long userBoardNo,Companies companies) {
		Map<String, Object> result = new HashMap<>();
		try {
			UserCompLikes likes = new UserCompLikes();
			likes.setUserBoardNo(userBoardNo);
			likes.setCompanyNo(companies.getNo());
			userBoardService.addCompLikes(likes);
			
			result.put("userBoardNo", userBoardNo);
			result.put("heart", "full");
			result.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			result.put("success", false);
		}
		return result;
	}
	
	@RequestMapping(value = "/board/imageUpload", method = RequestMethod.POST)
    public void userBoardImageUpload(HttpServletRequest request, HttpServletResponse response, @RequestParam MultipartFile upload) {
 
        OutputStream out1 = null;
        OutputStream out2 = null;
        PrintWriter printWriter = null;
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
 
        try{
 
            String fileName = upload.getOriginalFilename();
            byte[] bytes = upload.getBytes();
            String uploadPath1 = "C:\\APP\\eGovFrameDev-3.9.0-64bit\\workspace\\suffort\\src\\main\\webapp\\resources\\boardImage\\" + fileName;//저장경로
            String uploadPath2 = "C:\\APP\\eGovFrameDev-3.9.0-64bit\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\suffort\\resources\\boardImage\\" + fileName;
            
            out1 = new FileOutputStream(new File(uploadPath1));
            out1.write(bytes);
            out2 = new FileOutputStream(new File(uploadPath2));
            out2.write(bytes);
            String callback = request.getParameter("CKEditorFuncNum");
 
            printWriter = response.getWriter();
           // String fileUrl = "/resources/image/" + fileName;//url경로
            String fileUrl = request.getContextPath()+"/resources/boardImage/" + fileName;//url경로
 
            printWriter.println("{\"filename\" : \""+fileName+"\", \"uploaded\" : 1, \"url\":\""+fileUrl+"\"}");
            printWriter.flush();
 
        }catch(IOException e){
            e.printStackTrace();
        } finally {
            try {
                if (out1 != null) {
                    out1.close();
                }
                if (out2 != null) {
                   out2.close();
                }
                if (printWriter != null) {
                    printWriter.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
 
        return;
    }
	
	
}
