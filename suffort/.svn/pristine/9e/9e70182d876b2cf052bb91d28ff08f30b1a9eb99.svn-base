package com.sample.service;

import java.util.List;

import com.sample.web.dto.UserBoardDto;
import com.sample.web.form.UsersForm;
import com.sample.web.vo.Users;

public interface UserService {

	Users getUsersDetailByNo(long userNo);
	Users getUsersDetailById(String userId);
	void addNewUserApi(Users user);
//	void addNewUser(Users user);
	void addNewUser(UsersForm userForm);
	void modifyUserDetail(Users user);
	Users login(String userId, String password);
	
	void deleteUser(long userNo);
}
