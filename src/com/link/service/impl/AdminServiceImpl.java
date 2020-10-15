package com.link.service.impl;

import java.util.List;

import com.link.dao.IAdminDao;
import com.link.dao.impl.AdminDaoImpl;
import com.link.entity.Admin;
import com.link.service.IAdminService;
import com.link.util.MD5;

public class AdminServiceImpl implements IAdminService {

	IAdminDao adminDao = new AdminDaoImpl();

	@Override
	public Admin login(Admin admin) throws Exception {

		// 使用MD5摘要算法生成密码摘要（在数据库中存32位的MD5摘要的16进制字符串）
		String adminPassword = admin.getAdminPassword();
		String passwordDigest = MD5.getStrMD5(adminPassword);
		admin.setAdminPassword(passwordDigest);

		return adminDao.login(admin);
	}

	@Override
	public List<Admin> getAllAdmins() throws Exception {
		return adminDao.getAllAdmins();
	}

	@Override
	public List<Admin> getAdminsByAdminName(String adminName) throws Exception {

		return adminDao.getAdminsByAdminName(adminName.replaceAll("\\s+", "%"));
	}

	@Override
	public boolean modifyStatusByAdminID(int adminID, int status) throws Exception {

		int ret = adminDao.modifyStatusByAdminID(adminID, status);
		return ret > 0 ? true : false;
	}

	@Override
	public boolean modifyPasswordByAdminID(int adminID, String adminPassword) throws Exception {

		String newPassword = MD5.getStrMD5(adminPassword);
		int ret = adminDao.modifyPasswordByAdminID(adminID, newPassword);
		return ret > 0 ? true : false;
	}

	@Override
	public boolean checkAdminNameIsUniqueForModify(int adminID, String adminName) throws Exception {
		int ret = adminDao.checkAdminNameIsUniqueForModify(adminID, adminName);
		return ret > 0 ? false : true;
	}

	@Override
	public boolean checkAdminNameIsUnique(String adminName) throws Exception {
		int ret = adminDao.checkAdminNameIsUnique(adminName);
		return ret > 0 ? false : true;
	}

	@Override
	public boolean modifyAdminInfoByAdminID(Admin admin) throws Exception {
		int ret = adminDao.modifyAdminInfoByAdminID(admin);
		return ret > 0 ? true : false;
	}

	@Override
	public boolean regist(Admin admin) throws Exception {

		String adminPassword = admin.getAdminPassword();
		String passwordDigest = MD5.getStrMD5(adminPassword);
		admin.setAdminPassword(passwordDigest);

		return adminDao.regist(admin) > 0 ? true : false;
	}

}
