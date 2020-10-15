package com.link.dao;

import java.util.List;

import com.link.entity.User;

public interface IUserDao {

	public List<User> getAllUsers() throws Exception;
}
