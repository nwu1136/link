package com.link.dao.impl;

import java.sql.ResultSet;
import java.util.List;

import com.izual.dao.IBaseDaoImpl;
import com.link.dao.ISuperAdminDao;
import com.link.entity.Admin;

public class SuperAdminDaoImpl extends IBaseDaoImpl<Admin> implements ISuperAdminDao {

	@Override
	public Admin login(Admin admin) throws Exception {

		String sql = "select * from tb_admin where adminName=? and adminPassword=?";
		Object[] params = { admin.getAdminName(), admin.getAdminPassword() };

		List<Admin> adminList = select(sql, params);

//		if (adminList != null && adminList.size() > 0)
		if (adminList.size() > 0) {
			return adminList.get(0);
		}

		return null;
	}

	@Override
	public List<Admin> getAllAdmins() throws Exception {

		String sql = "select * from tb_admin where adminID>1";

		List<Admin> adminList = select(sql);

		return adminList;
	}

	@Override
	public List<Admin> getAdminsByAdminName(String adminName) throws Exception {

		String sql = "select * from tb_admin where adminID>1 and adminName like '%" + adminName + "%'";

		List<Admin> adminList = select(sql);

		return adminList;
	}

	@Override
	public int modifyStatusByAdminID(int adminID, int status) throws Exception {

		String sql = "update tb_admin set adminStatus=? where adminID=?";
		Object[] params = { status, adminID };

		return update(sql, params);
	}

	@Override
	public int modifyPasswordByAdminID(int adminID, String adminPassword) throws Exception {

		String sql = "update tb_admin set adminPassword=? where adminID=?";
		Object[] params = { adminPassword, adminID };

		return update(sql, params);
	}

	@Override
	public int checkAdminNameIsUniqueForModify(int adminID, String adminName) throws Exception {

		String sql = "select * from tb_admin where adminID!=? and adminName=?";
		Object[] params = { adminID, adminName };

		List<Admin> admins = select(sql, params);

		return admins.size();
	}

	@Override
	public int checkAdminNameIsUnique(String adminName) throws Exception {

		String sql = "select * from tb_admin where adminName=?";
		Object[] params = { adminName };

		List<Admin> admins = select(sql, params);

		return admins.size();
	}

	@Override
	public int modifyAdminInfoByAdminID(Admin admin) throws Exception {

		String sql = "update tb_admin set adminName=?, adminRealName=?, adminPhoneNum=? where adminID=?";
		Object[] params = { admin.getAdminName(), admin.getAdminRealName(), admin.getAdminPhoneNum(),
				admin.getAdminID() };

		return update(sql, params);
	}

	@Override
	public int regist(Admin admin) throws Exception {

		String sql = "insert into tb_admin(adminName, adminPassword, adminRealName, adminPhoneNum) values(?,?,?,?)";
		Object[] params = { admin.getAdminName(), admin.getAdminPassword(), admin.getAdminRealName(),
				admin.getAdminPhoneNum() };

		return insert(sql, params);
	}

	@Override
	protected Admin getBean(ResultSet rs) throws Exception {

		Admin admin = new Admin();
		admin.setAdminID(rs.getInt(1));
		admin.setAdminName(rs.getString(2));
		admin.setAdminPassword(rs.getString(3));
		admin.setAdminRealName(rs.getString(4));
		admin.setAdminPhoneNum(rs.getString(5));
		admin.setAdminStatus(rs.getInt(6));

		return admin;
	}

}
