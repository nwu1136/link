package com.link.dao.impl;

import java.sql.ResultSet;
import java.util.List;

import com.izual.dao.IBaseDaoImpl;
import com.link.dao.IUserDao;
import com.link.entity.User;

public class UserDaoImpl extends IBaseDaoImpl<User> implements IUserDao {

	@Override
	public List<User> getAllUsers() throws Exception {
		return null;
	}

	@Override
	protected User getBean(ResultSet rs) throws Exception {
		return null;
	}

}
