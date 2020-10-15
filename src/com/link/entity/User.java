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

	public User() {
		super();
	}

	public User(Integer userID, String userName, String userPassword, String userRealName, String userPhoneNum,
			String userEmail) {
		super();
		this.userID = userID;
		this.userName = userName;
		this.userPassword = userPassword;
		this.userRealName = userRealName;
		this.userPhoneNum = userPhoneNum;
		this.userEmail = userEmail;
	}

	@Override
	public String toString() {
		return "User [userID=" + userID + ", userName=" + userName + ", userPassword=" + userPassword
				+ ", userRealName=" + userRealName + ", userPhoneNum=" + userPhoneNum + ", userEmail=" + userEmail
				+ "]";
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

}
