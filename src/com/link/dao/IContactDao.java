package com.link.dao;

import java.util.List;

import com.link.entity.Contact;

public interface IContactDao {

	public List<Contact> getAllContacts() throws Exception;

	public int userAddContact(Contact contact) throws Exception;

}
