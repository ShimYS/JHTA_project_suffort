package com.sample.service;

import java.util.List;

import com.sample.web.form.CompaniesForm;
import com.sample.web.form.CompaniesUpdateForm;
import com.sample.web.vo.Companies;

public interface CompanyService {

	
	List<Companies> getAllCompanies();
	Companies getCompaniesDetail(String companyId);
//	void addNewCompanies(Companies companies);
	void addNewCompanies(CompaniesForm companiesForm);
//	void modifyCompaniesDetail(Companies companies);
	void modifyCompaniesDetail(CompaniesUpdateForm companiesUpdateForm);
	void deleteCompanies (long companyNo, String password);
	Companies login(String companyId, String password);
	
}