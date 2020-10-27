package com.link.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.link.entity.User;
import com.link.service.IUserService;
import com.link.service.impl.UserServiceImpl;

@WebServlet("/user/login")
public class UserLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static final Logger logger = LogManager.getLogger();

	IUserService userService = new UserServiceImpl();

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		logger.info("user action = login");

		PrintWriter out = resp.getWriter();

		String clientValidateCode = req.getParameter("validateCode");
		String serverValidateCode = (String) req.getSession().getAttribute("serverValidateCode");

		// 先验证验证码是否正确（验证时忽略大小写）
		if (clientValidateCode.equalsIgnoreCase(serverValidateCode)) {
			logger.info("验证码正确");
		} else {
			logger.info("登录失败：验证码错误！");
			out.print("<script type='text/javascript'>");
			out.print("alert('验证码错误，请重试！');");
			out.print("location.href='login.jsp';");
			out.print("</script>");
			return;
		}

		String userName = req.getParameter("username");
		String userPassword = req.getParameter("userPassword");

		// 验证用户名或密码是否为空（前端已过滤）
		if (userName == null || "".equals(userName) || userPassword == null || "".equals(userPassword)) {
			out.print("<script type='text/javascript'>");
			out.print("alert('用户名或密码不能为空！');");
			out.print("location.href='login.jsp';");
			out.print("</script>");
			return;
		}

		User user = new User();
		user.setUserName(userName);
		user.setUserPassword(userPassword);

		logger.info("user login, request params: {}", user);

		// 验证用户名和密码
		try {
			user = userService.login(user);
		} catch (Exception e) {
			logger.atWarn().withThrowable(e).log("登录错误");
		}

		if (user != null && user.getUserID() > 0) {
			logger.info("用户名和密码正确");
		} else {
			logger.info("登录失败：用户名或密码错误！");
			out.print("<script type='text/javascript'>");
			out.print("alert('用户名或密码错误，请重试！');");
			out.print("location.href='login.jsp';");
			out.print("</script>");
			return;
		}

		HttpSession session = req.getSession();
		session.setAttribute("userID", user.getUserID());
		session.setAttribute("userName", user.getUserName());

	}

}
