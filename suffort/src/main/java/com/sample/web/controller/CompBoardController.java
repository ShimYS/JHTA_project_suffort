package com.sample.web.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.sample.service.CompBoardService;
import com.sample.service.CompanyService;
import com.sample.web.dto.CompBoardDto;
import com.sample.web.dto.UserBoardDto;
import com.sample.web.form.CompBoardForm;
import com.sample.web.vo.Categories;
import com.sample.web.vo.CompBoard;
import com.sample.web.vo.Companies;
import com.sample.web.vo.CompanyUserLikes;
import com.sample.web.vo.UserUserLikes;
import com.sample.web.vo.Users;

@Controller
public class CompBoardController {
	
	@Autowired
	private CompBoardService compBoardService;
	
	@Autowired
	private CompanyService companyService;
	
	@Autowired
	private CategoryService categoryService;
	
	//기업 마이페이지
	@GetMapping("/board/compMyPage.do")
	public String compMyPage(Companies companies, Model model,@RequestParam(value="companyNo", required=false, defaultValue="0")long companyNo) {
		List<CompBoardDto> compMyPage = compBoardService.getCompBoardsByNo(companies.getNo());
		model.addAttribute("compMyPage", compMyPage);
		

		Companies company = companyService.selectCompanyDetailByNo(companyNo);
		model.addAttribute("company", company);
		
		return "board/compMyPage";
	}
	
	@GetMapping("/board/compMore.do")
	@ResponseBody
	public Map<String, Object> more(@RequestParam(value="pageNo", required=false, defaultValue="1") int pageNo,
			@RequestParam(value="tagNo",required=false,defaultValue="-1") long tagNo,Model model,Companies companies, Users users){
		Map<String, Object> paramMap = new HashMap<String, Object>();
		int rows = 7;
		int offset = (pageNo -1) * rows;
		paramMap.put("offset", offset);
		if (tagNo != -1) {
			paramMap.put("tagNo", tagNo);			
		}
		
		if (users != null) {
			paramMap.put("access", true);
			paramMap.put("userNo", users.getNo());
		} else {
			paramMap.put("access", false);
		}
		
		Map<String, Object> result = compBoardService.getAllCompBoard(paramMap);
		int totalRows = (int) result.get("totalRows");
		int totalPages = (int) Math.ceil((double)totalRows/rows);
		result.put("totalPages", totalPages);
		
		if (users != null) {
			result.put("logined", true);
			result.put("type", "user");
		}
		if(companies != null) {
			result.put("logined", true);
			result.put("type", "company");
		} else { 
			result.put("logined", false);
		}
		System.out.println(result);
		return result;
	}
	@GetMapping("/board/compBoardUserLikes.do")
	public @ResponseBody Map<String, Object> userLikes(@RequestParam("compBoardNo") long compBoardNo,Users users) {
		
		Map<String, Object> result = new HashMap<>();
		try {
			CompanyUserLikes likes = new CompanyUserLikes();
			likes.setCompBoardNo(compBoardNo);
			likes.setUserNo(users.getNo());
			compBoardService.addCompLikes(likes);
			
			result.put("compBoardNo", compBoardNo);
			result.put("heart", "full");
			result.put("success", true);
			
		} catch (Exception e) {
			e.printStackTrace();
			result.put("success", false);
		}
		return result;
	}
	
	@GetMapping("/board/compBoardUserUnLikes.do")
	public @ResponseBody Map<String, Object> userUnLikes(@RequestParam("compBoardNo") long compBoardNo,Users users) {
		Map<String, Object> result = new HashMap<>();
		try {
			CompanyUserLikes likes = new CompanyUserLikes();
			likes.setCompBoardNo(compBoardNo);
			likes.setUserNo(users.getNo());
			compBoardService.deleteCompLikes(likes);
			
			result.put("compBoardNo", compBoardNo);
			result.put("heart", "blank");
			result.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			result.put("success", false);
		}
		return result;
	}
	
	
	
	
	
	//기업 전체 리스트
	@GetMapping("/board/compTotalBoard.do")
	public String totalCompBoard() {
		 
	      return "board/totalCompBoard";
	}
	
	//기업 글 상세보기
	@GetMapping("/board/compBoardDetail.do")
	public String totalCompBoardDetail(@RequestParam("compBoardNo") long boardNo,
			@RequestParam(value="companyNo", required=false, defaultValue="0")long companyNo, Model model) {
		CompBoardDto compBoardDto = compBoardService.getCompBoardDetail(boardNo);
		model.addAttribute("compBoardDto", compBoardDto);
		
	
			Companies company = companyService.selectCompanyDetailByNo(companyNo);
			model.addAttribute("company", company);
		
		
		return "board/totalCompBoardDetail";
	}
	
	//기업 전체 리스트의 summary json
	@GetMapping("/board/compSummaryBoard.do")
	@ResponseBody
	public CompBoardDto summary(@RequestParam("compBoardNo") long compBoardNo){
		return compBoardService.getCompBoardDetail(compBoardNo);
	}
		
	//기업글쓰기1
	@GetMapping("/board/compBoardWrite.do")
	public String compBoardWrite(Model model, @RequestParam(value="companyNo", required=false, defaultValue="0")long companyNo) {
		List<Categories> categories = categoryService.getAllCategories();
		model.addAttribute("categories", categories);
		
		Companies company = companyService.selectCompanyDetailByNo(companyNo);
		model.addAttribute("company", company);
		
		return "board/compBoardWrite";
	}
	//기업글쓰기2
	@PostMapping("/board/compBoardWrite.do")
	public String comBoardAdd(CompBoardForm compBoardForm, Companies companies) {
		CompBoard compBoard = new CompBoard();
		
		BeanUtils.copyProperties(compBoardForm, compBoard);
		compBoard.setCompaniesNo(companies.getNo());
		compBoardService.addNewCompBoard(compBoard, compBoardForm.getTags());
		return "redirect:compTotalBoard.do";
	}
	
	
	@GetMapping("/board/compBoardModify.do")
	public String modify(@RequestParam(value="companyNo", required=false, defaultValue="0")long companyNo,@RequestParam("compBoardNo") long boardNo, Model model, CompBoardForm compBoardForm, Companies companies) {
		if(companies == null) {
			return "user/totalLogin";
		}
		CompBoardDto compBoardDto = compBoardService.getCompBoardDetail(boardNo);
		model.addAttribute("compBoardDto", compBoardDto);
		List<Categories> categories = categoryService.getAllCategories();
		model.addAttribute("categories", categories);
		
		Companies company = companyService.selectCompanyDetailByNo(companyNo);
		model.addAttribute("company", company);
		
		return "board/compBoardWriteModify";
	}
	
	@PostMapping("/board/compBoardModify.do")
	public String modifyBoard(@RequestParam("compBoardNo") long boardNo,CompBoardForm compBoardForm, Companies companies) {
		CompBoard compBoard = new CompBoard();
		
		compBoard.setNo(boardNo);
		compBoard.setCompaniesNo(companies.getNo());
		compBoard.setTitle(compBoardForm.getTitle());
		compBoard.setContent(compBoardForm.getContent());
		
		compBoardService.updateUserBoard(compBoard, compBoardForm.getTags());
		return "redirect:compMyPage.do";
	}
	
	@GetMapping("/board/compBoardDelete.do")
	public String compBoardDelete(@RequestParam("compBoardNo")long boardNo) {
		compBoardService.deleteCompBoard(boardNo);
		return "redirect:compTotalBoard.do";
	}
	
	//글쓰기 API
	@RequestMapping(value = "/board/compWrite", method = RequestMethod.POST)
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
