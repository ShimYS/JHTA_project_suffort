package com.sample.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sample.dao.CompanyDao;
import com.sample.web.form.CompaniesForm;
import com.sample.web.form.CompaniesUpdateForm;
import com.sample.web.vo.Companies;

// @Transactional
@Service
public class CompanyServiceImpl implements CompanyService {

	
	@Autowired
	CompanyDao companyDao;
	
	@Override
	public void addNewCompanies(CompaniesForm companiesForm) {

		companyDao.insertCompanies(companiesForm);
	}
	
	@Override
	public Companies getCompaniesDetail(String companyId) {

		return companyDao.selectCompany(companyId);
	}
	
	@Override
	public List<Companies> getAllCompanies() {
		
		return companyDao.selectCompanies();
	}
	
//	@Override
//	public void modifyCompaniesDetail(Companies companies) {
//		companyDao.updateCompanies(companies);
//	}
	
	@Override
	public void modifyCompaniesDetail(CompaniesUpdateForm companiesUpdateForm) {
		
		if (companiesUpdateForm.getLogo() == null) {
			Companies companies = companyDao.selectCompanyDetailByNo(companiesUpdateForm.getNo());
			companiesUpdateForm.setLogo(companies.getLogo());
		}
		companyDao.updateCompany(companiesUpdateForm);
	}
	
	@Override
	public void deleteCompanies(long companyNo, String password) {
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public Companies login(String companyId, String password) {
		Companies savedCompanies = companyDao.selectCompany(companyId);
		
		if (savedCompanies == null) {
			System.out.println("id가 null");
			return null;
		}
		
		if (!savedCompanies.getPassword().equals(password)) {
			System.out.println("비밀번호가 null");
			return null;
		}
		
		return savedCompanies;
		
	}
	@Override
	public Companies selectCompanyDetailByNo(long companyNo) {
		
		return companyDao.selectCompanyDetailByNo(companyNo);
	}
	
}