package com.link.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.link.entity.Admin;
import com.link.service.IAdminService;
import com.link.service.impl.AdminServiceImpl;

@WebServlet("/admin/admin")
public class AdminServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	IAdminService adminService = new AdminServiceImpl();

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String action = req.getParameter("action");
		System.out.println("admin action = " + action);

		try {
			switch (action) {
			case "login":
				login(req, resp);
				break;
			case "logout":
				logout(req, resp);
				break;
			default:
				break;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void login(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		PrintWriter out = resp.getWriter();

		String clientValidateCode = req.getParameter("validateCode");
		String serverValidateCode = (String) req.getSession().getAttribute("serverValidateCode");
		
		// 先验证验证码是否正确（验证时忽略大小写）
		if (clientValidateCode.equalsIgnoreCase(serverValidateCode)) {
			System.out.println("验证码正确");
		} else {
			System.out.println("登录失败：验证码错误！");
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

		// 验证用户名和密码
		admin = adminService.login(admin);
		if (admin != null && admin.getAdminID() > 0) {
			System.out.println("用户名和密码正确");
		} else {
			System.out.println("登录失败：用户名或密码错误！");
			out.print("<script type='text/javascript'>");
			out.print("alert('用户名或密码错误，请重试！');");
			out.print("location.href='login.jsp';");
			out.print("</script>");
			return;
		}

		// 验证账号是否被禁用
		if (admin.getAdminStatus() > 0) {
			System.out.println("账号状态正常");
		} else {
			System.out.println("登录失败：账号已被禁用");
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
			System.out.println("登录成功：超级管理员");
			// 转到超级管理员界面
			resp.sendRedirect("superAdmin.jsp");
		} else {
			System.out.println("登录成功：普通管理员");
			// 转到普通管理员界面
			resp.sendRedirect("admin.jsp");
		}
	}

	private void logout(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		HttpSession session = req.getSession();
		session.invalidate();
		resp.sendRedirect("login.jsp");
	}

}
