package com.sample.service;

import java.util.List;

import com.sample.web.vo.Careers;
import com.sample.web.vo.Licenses;

public interface LicenseService {

	void addNewLicense(Licenses license);
	List<Licenses> getLicenseByUserNo(long userNo);
	void deleteLicense(long licenseNo);
	
}
