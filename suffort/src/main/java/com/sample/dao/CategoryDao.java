package com.sample.dao;

import java.util.List;

import com.sample.web.dto.TagDto;
import com.sample.web.vo.Categories;

public interface CategoryDao {
	List<Categories> getAllCategories();
	List<TagDto> getAllTagsByNo(long categoryNo);
}
