package com.link.servlet;

import java.io.IOException;
import java.io.PrintWriter;
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
			case "userAddContact":
				userAddContact(req, resp);
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

	private void userAddContact(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		PrintWriter out = resp.getWriter();

		Integer userID = Integer.parseInt(req.getParameter("userID"));
		String contactName = req.getParameter("contactName");
		String contactPhoneNum = req.getParameter("contactPhoneNum");
		String contactCompany = req.getParameter("contactCompany");
		String contactEmail = req.getParameter("contactEmail");
		String contactDetails = req.getParameter("contactDetails");

		// TODO:判断是否为NULL 是否为空

		Contact contact = new Contact(null, userID, contactName, contactCompany, contactPhoneNum, contactEmail,
				contactDetails);
//		logger.info(contact);

		boolean ret = contactService.userAddContact(contact);

		if (ret) {
			logger.info("添加成功！");
			out.print("<script type='text/javascript'>");
			out.print("alert('添加成功！');");
			out.print("location.href='index.jsp';");
			out.print("</script>");
		} else {
			logger.info("添加失败！");
			out.print("<script type='text/javascript'>");
			out.print("alert('添加失败！');");
			out.print("location.href='userAddContact.jsp';");
			out.print("</script>");

		}

	}

}
