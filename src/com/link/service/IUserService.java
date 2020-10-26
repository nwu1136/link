package com.link.service;

import java.util.List;

import com.link.entity.User;

public interface IUserService {

	public List<User> getAllUsers() throws Exception;

	public boolean registUser(User user) throws Exception;
}
