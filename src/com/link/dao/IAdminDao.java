package com.link.dao;

import java.util.List;

import com.link.entity.Admin;

public interface IAdminDao {

	public Admin login(Admin admin) throws Exception;

	public List<Admin> getAllAdmins() throws Exception;

	public List<Admin> getAdminsByAdminName(String adminName) throws Exception;

	public int modifyStatusByAdminID(int adminID, int status) throws Exception;

	public int modifyPasswordByAdminID(int adminID, String adminPassword) throws Exception;

	public int checkAdminNameIsUniqueForModify(int adminID, String adminName) throws Exception;

	public int checkAdminNameIsUnique(String adminName) throws Exception;

	public int modifyAdminInfoByAdminID(Admin admin) throws Exception;

	public int regist(Admin admin) throws Exception;
}
