package com.sample.dao;

import java.util.List;

import com.sample.web.vo.Careers;
import com.sample.web.vo.Licenses;

public interface LicenseDao {

	void insertLicense(Licenses license);
	List<Licenses> getLicensesByUserNo(long userNo);
	void deleteLicense(long licenseNo);
}
