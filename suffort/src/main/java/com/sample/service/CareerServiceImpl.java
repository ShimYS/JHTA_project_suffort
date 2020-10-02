package com.sample.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sample.dao.CareerDao;
import com.sample.web.vo.Careers;

@Service
public class CareerServiceImpl implements CareerService {
	
	@Autowired
	CareerDao careerDao;

//	@Override
//	public void addNewCareer(List<Careers> careers) {
//		Careers ca = new Careers();
//		for(Careers career : careers) {
//			/*ca.setCompanyName(career.getCompanyName());
//			ca.setJobContent(career.getJobContent());
//			ca.setJobPosition(career.getJobPosition());
//			ca.setMonth(career.getMonth());
//			ca.setUserNo(career.getUserNo());*/
//			careerDao.insertCareer(ca);
//			
//		}
//	}
	
	@Override
	public void addNewCareer(Careers career) {
		careerDao.insertCareer(career);
	}
	
	@Override
	public List<Careers> getCareerByUserNo(long userNo) {
		
		List<Careers> savedCareers = careerDao.getCareersByUserNo(userNo);
		return savedCareers;
	}
	
	@Override
	public void deleteCareer(long careerNo) {
		
		careerDao.deleteCareer(careerNo);
	}
}
