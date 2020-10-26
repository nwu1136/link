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

import com.link.entity.User;
import com.link.service.IAdminService;
import com.link.service.IUserService;
import com.link.service.impl.AdminServiceImpl;
import com.link.service.impl.UserServiceImpl;

@WebServlet("/admin/admin")
public class AdminServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private static final Logger logger = LogManager.getLogger();

	IAdminService adminService = new AdminServiceImpl();
	IUserService userService = new UserServiceImpl();

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String action = req.getParameter("action");
		logger.info("admin action = {}", action);

		try {
			switch (action) {
			case "getAllUsers":
				getAllUsers(req, resp);
				break;
			default:
				break;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void getAllUsers(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		List<User> userList = userService.getAllUsers();
//		for (User user : userList) {
//			logger.debug(user);
//		}

		req.setAttribute("userList", userList);
		req.getRequestDispatcher("admin.jsp").forward(req, resp);
	}

}
