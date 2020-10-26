package com.link.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.link.entity.Contact;
import com.link.service.IContactService;
import com.link.service.impl.ContactServiceImpl;

@WebServlet("/user")
public class UserServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private static final Logger logger = LogManager.getLogger();

	IContactService contactService = new ContactServiceImpl();

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String action = req.getParameter("action");
		logger.info("superAdmin action = {}", action);
		
		try {
			switch (action) {
			case "getAllContacts":
				getAllContacts(req, resp);
				break;

			default:
				break;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void getAllContacts(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		List<Contact> contactList = contactService.getAllContacts();

//		for (Contact contact : contactList) {
//			logger.debug(contact);
//		}

		req.setAttribute("contactList", contactList);
		req.getRequestDispatcher("index.jsp").forward(req, resp);
	}

}
