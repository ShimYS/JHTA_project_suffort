package com.sample.service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sample.dao.UserDao;
import com.sample.web.form.UsersForm;
import com.sample.web.vo.Companies;
import com.sample.web.vo.Users;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	UserDao userDao;
	
	@Override
	public Users getUsersDetailByNo(long userNo) {
		return userDao.selectUserByNo(userNo);
	}
	
	@Override
	public Users getUsersDetailById(String userId) {
		
		return userDao.selectUserById(userId);
	}
	
	@Override
	public void addNewUserApi(Users user) {
		
//		Users findUser = userDao.selectUserById(user.getId());
//		System.out.println(findUser.getId());
		
		userDao.insertUserApi(user);
		
	}
	
//	@Override
//	public void addNewUser(Users user) {
//		
//		userDao.insertUser(user);
//	}

	@Override
	public void addNewUser(UsersForm userForm) {
		
		userDao.insertUser(userForm);
	}
	
	@Override
	public void modifyUserDetail(Users user) {
		
		userDao.updateUser(user);
	}

//	@Override
//	public void modifyBoardDetail(Board board) {
//		Board savedBoard = boardDao.selectBoard(board.getNo());
//		if (savedBoard == null) {
//			throw new RuntimeException("[" + board.getNo() + "] 번 게시글이 없습니다");
//		}
//		if (savedBoard.getPassword().equals(board.getPassword())) {
//			throw new RuntimeException("비밀번호가 일치하지 않습니다");
//		}
//		
//		savedBoard.setTitle(board.getTitle());
//		savedBoard.setContent(board.getContent());
//		savedBoard.setFilename(board.getFilename());
//		savedBoard.setUpdatedDate(new Date());
//		
//		boardDao.updateBoard(savedBoard);
//	}
	
	
	@Override
	public Users login(String userId, String password) {
		Users saveduser = userDao.selectUserById(userId);
		
		if (saveduser == null) {
			System.out.println("id가 null");
			return null;
		}
		
		if (!saveduser.getLoginWay().equals(password)) {
			System.out.println("비밀번호가 null");
			return null;
		}
		
		return saveduser;
	}
	
	@Override
	public void deleteUser(long userNo) {
		userDao.deleteUser(userNo);
	}
	
}
