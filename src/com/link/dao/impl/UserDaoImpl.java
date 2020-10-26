package com.link.dao.impl;

import java.sql.ResultSet;
import java.util.List;

import com.izual.dao.IBaseDaoImpl;
import com.link.dao.IUserDao;
import com.link.entity.User;

public class UserDaoImpl extends IBaseDaoImpl<User> implements IUserDao {

	@Override
	public List<User> getAllUsers() throws Exception {

		String sql = "select * from tb_user";

		List<User> userList = select(sql);

		return userList;
	}

	@Override
	protected User getBean(ResultSet rs) throws Exception {

		User user = new User();
		user.setUserID(rs.getInt(1));
		user.setUserName(rs.getString(2));
		user.setUserPassword(rs.getString(3));
		user.setUserRealName(rs.getString(4));
		user.setUserPhoneNum(rs.getString(5));
		user.setUserEmail(rs.getString(6));
		user.setHeadImgName(rs.getString(7));

		return user;
	}

}
