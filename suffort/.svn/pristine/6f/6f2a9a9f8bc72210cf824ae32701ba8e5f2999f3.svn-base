package com.sample.web.advice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.sample.service.CategoryService;
import com.sample.web.vo.Categories;

@ControllerAdvice
public class CommonControllerAdvice {

	@Autowired
	private CategoryService categoryService;
	
	@ModelAttribute("categories")
	public List<Categories> categories() {
		return categoryService.getAllCategories();
		
	}
}
