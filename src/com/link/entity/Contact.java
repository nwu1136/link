package com.link.entity;

import java.io.Serializable;

public class Contact implements Serializable {

	private static final long serialVersionUID = 1L;

	private Integer contactID;
	private Integer userID;
	private String contactName;
	private String contactCompany;
	private String contactPhoneNum;
	private String contactEmail;
	private String contactDetails;

	public Contact() {
		super();
	}

	public Contact(Integer contactID, Integer userID, String contactName, String contactCompany, String contactPhoneNum,
			String contactEmail, String contactDetails) {
		super();
		this.contactID = contactID;
		this.userID = userID;
		this.contactName = contactName;
		this.contactCompany = contactCompany;
		this.contactPhoneNum = contactPhoneNum;
		this.contactEmail = contactEmail;
		this.contactDetails = contactDetails;
	}

	@Override
	public String toString() {
		return "Contact [contactID=" + contactID + ", userID=" + userID + ", contactName=" + contactName
				+ ", contactCompany=" + contactCompany + ", contactPhoneNum=" + contactPhoneNum + ", contactEmail="
				+ contactEmail + ", contactDetails=" + contactDetails + "]";
	}

	public Integer getContactID() {
		return contactID;
	}

	public void setContactID(Integer contactID) {
		this.contactID = contactID;
	}

	public Integer getUserID() {
		return userID;
	}

	public void setUserID(Integer userID) {
		this.userID = userID;
	}

	public String getContactName() {
		return contactName;
	}

	public void setContactName(String contactName) {
		this.contactName = contactName;
	}

	public String getContactCompany() {
		return contactCompany;
	}

	public void setContactCompany(String contactCompany) {
		this.contactCompany = contactCompany;
	}

	public String getContactPhoneNum() {
		return contactPhoneNum;
	}

	public void setContactPhoneNum(String contactPhoneNum) {
		this.contactPhoneNum = contactPhoneNum;
	}

	public String getContactEmail() {
		return contactEmail;
	}

	public void setContactEmail(String contactEmail) {
		this.contactEmail = contactEmail;
	}

	public String getContactDetails() {
		return contactDetails;
	}

	public void setContactDetails(String contactDetails) {
		this.contactDetails = contactDetails;
	}

}
