package com.link.service.impl;

import java.util.List;

import com.link.dao.IUserDao;
import com.link.dao.impl.UserDaoImpl;
import com.link.entity.User;
import com.link.service.IUserService;
import com.link.util.MD5;

public class UserServiceImpl implements IUserService {

	IUserDao userDao = new UserDaoImpl();

	@Override
	public List<User> getAllUsers() throws Exception {
		return userDao.getAllUsers();
	}

	@Override
	public boolean registUser(User user) throws Exception {
		return userDao.registUser(user) > 0 ? true : false;
	}

	@Override
	public User login(User user) throws Exception {
		String userPassword = user.getUserPassword();
		String passwordDigest = MD5.getStrMD5(userPassword);
		user.setUserPassword(passwordDigest);

		return userDao.login(user);
	}
}
