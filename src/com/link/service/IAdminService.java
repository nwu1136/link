package com.link.service;

import java.util.List;

import com.link.entity.Admin;

public interface IAdminService {

	public Admin login(Admin admin) throws Exception;

	public List<Admin> getAllAdmins() throws Exception;

	public List<Admin> getAdminsByAdminName(String adminName) throws Exception;

	public boolean modifyStatusByAdminID(int adminID, int status) throws Exception;

	public boolean modifyPasswordByAdminID(int adminID, String adminPassword) throws Exception;

	public boolean checkAdminNameIsUniqueForModify(int adminID, String adminName) throws Exception;

	public boolean checkAdminNameIsUnique(String adminName) throws Exception;

	public boolean modifyAdminInfoByAdminID(Admin admin) throws Exception;

	public boolean regist(Admin admin) throws Exception;
}
