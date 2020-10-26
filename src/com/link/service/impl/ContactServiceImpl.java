package com.link.service.impl;

import java.util.List;

import com.link.dao.IContactDao;
import com.link.dao.impl.ContactDaoImpl;
import com.link.entity.Contact;
import com.link.service.IContactService;

public class ContactServiceImpl implements IContactService {

	IContactDao contactDao = new ContactDaoImpl();

	@Override
	public List<Contact> getAllContacts() throws Exception {
		return contactDao.getAllContacts();
	}

}
