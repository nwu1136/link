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

import com.link.entity.Admin;
import com.link.service.ISuperAdminService;
import com.link.service.impl.SuperAdminServiceImpl;

@WebServlet("/admin/login")
public class AdminLoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private static final Logger logger = LogManager.getLogger();

	ISuperAdminService adminService = new SuperAdminServiceImpl();

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		logger.info("admin action = login");

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

		String adminName = req.getParameter("username");
		String adminPassword = req.getParameter("password");

		// 验证用户名或密码是否为空（前端已过滤）
		if (adminName == null || "".equals(adminName) || adminPassword == null || "".equals(adminPassword)) {
			out.print("<script type='text/javascript'>");
			out.print("alert('用户名或密码不能为空！');");
			out.print("location.href='login.jsp';");
			out.print("</script>");
			return;
		}

		Admin admin = new Admin();
		admin.setAdminName(adminName);
		admin.setAdminPassword(adminPassword);
		
		logger.info("admin login, request params: {}", admin);

		// 验证用户名和密码
		try {
			admin = adminService.login(admin);
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (admin != null && admin.getAdminID() > 0) {
			logger.info("用户名和密码正确");
		} else {
			logger.info("登录失败：用户名或密码错误！");
			out.print("<script type='text/javascript'>");
			out.print("alert('用户名或密码错误，请重试！');");
			out.print("location.href='login.jsp';");
			out.print("</script>");
			return;
		}

		// 验证账号是否被禁用
		if (admin.getAdminStatus() > 0) {
			logger.info("账号状态正常");
		} else {
			logger.info("登录失败：账号已被禁用");
			out.print("<script type='text/javascript'>");
			out.print("alert('账号已被禁用！');");
			out.print("location.href='login.jsp';");
			out.print("</script>");
			return;
		}

		HttpSession session = req.getSession();
		session.setAttribute("adminID", admin.getAdminID());

		// 判断是超级管理员还是普通管理员
		if (admin.getAdminID() == 1) {
			logger.info("登录成功：超级管理员");
			// 转到超级管理员界面
			resp.sendRedirect("superAdmin.jsp");
		} else {
			logger.info("登录成功：普通管理员");
			// 转到普通管理员界面
			resp.sendRedirect("admin.jsp");
		}
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

}
