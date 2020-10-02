package com.sample.service;

import java.util.List;

import com.sample.web.vo.Careers;

public interface CareerService {

//	void addNewCareer(List<Careers> career);
	void addNewCareer(Careers career);
	List<Careers> getCareerByUserNo(long userNo);
	void deleteCareer(long careerNo);
	
}
