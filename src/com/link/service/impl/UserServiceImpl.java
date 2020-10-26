package com.link.service.impl;

import java.util.List;

import com.link.dao.IUserDao;
import com.link.dao.impl.UserDaoImpl;
import com.link.entity.User;
import com.link.service.IUserService;

public class UserServiceImpl implements IUserService {

	IUserDao userDao = new UserDaoImpl();

	@Override
	public List<User> getAllUsers() throws Exception {
		return userDao.getAllUsers();
	}

}
