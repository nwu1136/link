package com.link.dao.impl;

import java.sql.ResultSet;
import java.util.List;

import com.izual.dao.IBaseDaoImpl;
import com.link.dao.IContactDao;
import com.link.entity.Contact;

public class ContactDaoImpl extends IBaseDaoImpl<Contact> implements IContactDao {

	@Override
	public List<Contact> getAllContacts() throws Exception {

		String sql = "select * from tb_contact";

		List<Contact> contactList = select(sql);

		return contactList;
	}

	@Override
	public int userAddContact(Contact contact) throws Exception {
		String sql = "insert into tb_contact(userID,contactName,contactCompany,contactPhoneNum,contactEmail,contactDetails) value(?,?,?,?,?,?)";
		Object[] params = { contact.getUserID(), contact.getContactName(), contact.getContactCompany(),
				contact.getContactPhoneNum(), contact.getContactEmail(), contact.getContactDetails() };

		return insert(sql, params);
	}

	@Override
	protected Contact getBean(ResultSet rs) throws Exception {

		Contact contact = new Contact();
		contact.setContactID(rs.getInt(1));
		contact.setUserID(rs.getInt(2));
		contact.setContactName(rs.getString(3));
		contact.setContactCompany(rs.getString(4));
		contact.setContactPhoneNum(rs.getString(5));
		contact.setContactEmail(rs.getString(6));
		contact.setContactDetails(rs.getString(7));

		return contact;
	}


}
