package com.link.entity;

import java.io.Serializable;

public class Admin implements Serializable {

	private static final long serialVersionUID = 1L;

	private Integer adminID;
	private String adminName;
	private String adminPassword;
	private String adminRealName;
	private String adminPhoneNum;
	private Integer adminStatus;

	public Admin() {
		super();
	}

	public Admin(Integer adminID, String adminName, String adminPassword, String adminRealName, String adminPhoneNum,
			Integer adminStatus) {
		super();
		this.adminID = adminID;
		this.adminName = adminName;
		this.adminPassword = adminPassword;
		this.adminRealName = adminRealName;
		this.adminPhoneNum = adminPhoneNum;
		this.adminStatus = adminStatus;
	}

	@Override
	public String toString() {
		return "Admin [adminID=" + adminID + ", adminName=" + adminName + ", adminPassword=p@$$w0rd"
				+ ", adminRealName=" + adminRealName + ", adminPhoneNum=" + adminPhoneNum + ", adminStatus="
				+ adminStatus + "]";
	}

	public Integer getAdminID() {
		return adminID;
	}

	public void setAdminID(Integer adminID) {
		this.adminID = adminID;
	}

	public String getAdminName() {
		return adminName;
	}

	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}

	public String getAdminPassword() {
		return adminPassword;
	}

	public void setAdminPassword(String adminPassword) {
		this.adminPassword = adminPassword;
	}

	public String getAdminRealName() {
		return adminRealName;
	}

	public void setAdminRealName(String adminRealName) {
		this.adminRealName = adminRealName;
	}

	public String getAdminPhoneNum() {
		return adminPhoneNum;
	}

	public void setAdminPhoneNum(String adminPhoneNum) {
		this.adminPhoneNum = adminPhoneNum;
	}

	public Integer getAdminStatus() {
		return adminStatus;
	}

	public void setAdminStatus(Integer adminStatus) {
		this.adminStatus = adminStatus;
	}

}
