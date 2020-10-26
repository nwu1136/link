package com.link.entity;

import java.io.Serializable;

public class User implements Serializable {

	private static final long serialVersionUID = 1L;

	private Integer userID;
	private String userName;
	private String userPassword;
	private String userRealName;
	private String userPhoneNum;
	private String userEmail;
	private String headImgName;

	public User() {
		super();
	}

	public User(Integer userID, String userName, String userPassword, String userRealName, String userPhoneNum,
			String userEmail, String headImgName) {
		super();
		this.userID = userID;
		this.userName = userName;
		this.userPassword = userPassword;
		this.userRealName = userRealName;
		this.userPhoneNum = userPhoneNum;
		this.userEmail = userEmail;
		this.headImgName = headImgName;
	}

	@Override
	public String toString() {
		return "User [userID=" + userID + ", userName=" + userName + ", userPassword=p@$$w0rd" + ", userRealName="
				+ userRealName + ", userPhoneNum=" + userPhoneNum + ", userEmail=" + userEmail + ", headImgName="
				+ headImgName + "]";
	}

	public Integer getUserID() {
		return userID;
	}

	public void setUserID(Integer userID) {
		this.userID = userID;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getUserRealName() {
		return userRealName;
	}

	public void setUserRealName(String userRealName) {
		this.userRealName = userRealName;
	}

	public String getUserPhoneNum() {
		return userPhoneNum;
	}

	public void setUserPhoneNum(String userPhoneNum) {
		this.userPhoneNum = userPhoneNum;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getHeadImgName() {
		return headImgName;
	}

	public void setHeadImgName(String headImgName) {
		this.headImgName = headImgName;
	}

}
