package com.sample.dao;

import java.util.List;

import com.sample.web.form.CompaniesForm;
import com.sample.web.form.CompaniesUpdateForm;
import com.sample.web.vo.Companies;

public interface CompanyDao {

	List<Companies> selectCompanies();
	Companies selectCompany(String companyId);
//	void insertCompanies(Companies companies);
	void insertCompanies(CompaniesForm companiesForm);
//	void updateCompanies(Companies companies);
	void updateCompany(CompaniesUpdateForm companiesUpdateForm);
	
	Companies selectCompanyDetailByNo(long companyNo);
}