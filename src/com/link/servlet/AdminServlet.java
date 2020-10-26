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
			case "registUser":
				registUser(req, resp);
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

		req.setAttribute("userList", userList);
		req.getRequestDispatcher("admin.jsp").forward(req, resp);
	}

	private void registUser(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		PrintWriter out = resp.getWriter();

		String userName = req.getParameter("userName");
		String password = req.getParameter("password");
		String userRealName = req.getParameter("userRealName");
		String userPhoneNum = req.getParameter("userPhoneNum");
		String userEamil = req.getParameter("userEmail");

		// 判断用户名是否为空
		if (userName == null || "".equals(userName)) {
			out.print("<script type='text/javascript'>");
			out.print("alert('注册失败，用户名不可以为空！');");
			out.print("location.href='registUser.jsp';");
			out.print("</script>");
			return;
		}

		// 判断用户名格式是否正确

		// 用户名是否重复

		User user = new User(null, userName, password, userRealName, userPhoneNum, userEamil, null);
		logger.info("regist user, request params: {}", user);

		boolean ret = userService.registUser(user);
		if (ret) {
			logger.info("registed successfully");
			out.print("<script type='text/javascript'>");
			out.print("alert('注册成功！');");
//			out.print("location.href='superAdmin.jsp';");
			out.print("</script>");
		} else {
			logger.info("registed failed");
			out.print("<script type='text/javascript'>");
			out.print("alert('注册失败！');");
//			out.print("location.href='superAdmin.jsp';");
			out.print("</script>");
		}

		
	}

}
