package com.sample.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sample.dao.CareerDao;
import com.sample.dao.LicenseDao;
import com.sample.web.vo.Careers;
import com.sample.web.vo.Licenses;

@Service
public class LicenseServiceImpl implements LicenseService {
	
	@Autowired
	LicenseDao licenseDao;

	@Override
	public void addNewLicense(Licenses license) {
		licenseDao.insertLicense(license);
		
	}
	
	@Override
	public List<Licenses> getLicenseByUserNo(long userNo) {
		List<Licenses> savedlicenses =  licenseDao.getLicensesByUserNo(userNo);
		return savedlicenses;
	}
	
	@Override
	public void deleteLicense(long licenseNo) {
		
		licenseDao.deleteLicense(licenseNo);
	}
	

}
