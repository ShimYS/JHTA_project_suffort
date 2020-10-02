package com.sample.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sample.dao.CategoryDao;
import com.sample.dao.CompBoardDao;
import com.sample.web.vo.Categories;
@Service
public class CategoryServiceImpl implements CategoryService{

	@Autowired
	CompBoardDao compBoardDao;
	
	@Override
	public List<Categories> getAllCategories() {
	
		return compBoardDao.getAllCategories();
	}
}
