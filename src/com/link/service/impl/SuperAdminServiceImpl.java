package com.link.service.impl;

import java.util.List;

import com.link.dao.ISuperAdminDao;
import com.link.dao.impl.SuperAdminDaoImpl;
import com.link.entity.Admin;
import com.link.service.ISuperAdminService;
import com.link.util.MD5;

public class SuperAdminServiceImpl implements ISuperAdminService {

	ISuperAdminDao superAdminDao = new SuperAdminDaoImpl();

	@Override
	public Admin login(Admin admin) throws Exception {

		// 使用MD5摘要算法生成密码摘要（在数据库中存32位的MD5摘要的16进制字符串）
		String adminPassword = admin.getAdminPassword();
		String passwordDigest = MD5.getStrMD5(adminPassword);
		admin.setAdminPassword(passwordDigest);

		return superAdminDao.login(admin);
	}

	@Override
	public List<Admin> getAllAdmins() throws Exception {
		return superAdminDao.getAllAdmins();
	}

	@Override
	public List<Admin> getAdminsByAdminName(String adminName) throws Exception {

		return superAdminDao.getAdminsByAdminName(adminName.replaceAll("\\s+", "%"));
	}

	@Override
	public boolean modifyStatusByAdminID(int adminID, int status) throws Exception {

		int ret = superAdminDao.modifyStatusByAdminID(adminID, status);
		return ret > 0 ? true : false;
	}

	@Override
	public boolean modifyPasswordByAdminID(int adminID, String adminPassword) throws Exception {

		String newPassword = MD5.getStrMD5(adminPassword);
		int ret = superAdminDao.modifyPasswordByAdminID(adminID, newPassword);
		return ret > 0 ? true : false;
	}

	@Override
	public boolean checkAdminNameIsUniqueForModify(int adminID, String adminName) throws Exception {
		int ret = superAdminDao.checkAdminNameIsUniqueForModify(adminID, adminName);
		return ret > 0 ? false : true;
	}

	@Override
	public boolean checkAdminNameIsUnique(String adminName) throws Exception {
		int ret = superAdminDao.checkAdminNameIsUnique(adminName);
		return ret > 0 ? false : true;
	}

	@Override
	public boolean modifyAdminInfoByAdminID(Admin admin) throws Exception {
		int ret = superAdminDao.modifyAdminInfoByAdminID(admin);
		return ret > 0 ? true : false;
	}

	@Override
	public boolean regist(Admin admin) throws Exception {

		String adminPassword = admin.getAdminPassword();
		String passwordDigest = MD5.getStrMD5(adminPassword);
		admin.setAdminPassword(passwordDigest);

		return superAdminDao.regist(admin) > 0 ? true : false;
	}

}
