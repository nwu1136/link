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

import com.link.entity.Admin;
import com.link.service.IAdminService;
import com.link.service.impl.AdminServiceImpl;

@WebServlet("/admin/superAdmin")
public class SuperAdminServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private static final Logger logger = LogManager.getLogger();

	IAdminService adminService = new AdminServiceImpl();

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String action = req.getParameter("action");
		logger.info("superAdmin action = {}", action);

		try {
			switch (action) {
			case "getAllAdmins":
				getAllAdmins(req, resp);
				break;
			case "getAdminsByAdminName":
				getAdminsByAdminName(req, resp);
				break;
			case "modifyStatus":
				modiftStatusByAdminID(req, resp);
				break;
			case "modifySuperAdminPassword":
				modifySuperAdminPassword(req, resp);
				break;
			case "modifyAdminPassword":
				modifyAdminPassword(req, resp);
				break;
			case "checkAdminNameForModify":
				checkAdminNameIsUniqueForModify(req, resp);
				break;
			case "checkAdminName":
				checkAdminNameIsUnique(req, resp);
				break;
			case "modifyAdminInfo":
				modifyAdminInfoByAdminID(req, resp);
				break;
			case "regist":
				regist(req, resp);
				break;
			default:
				break;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void getAllAdmins(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		List<Admin> adminList = adminService.getAllAdmins();
		req.setAttribute("adminList", adminList);

		req.getRequestDispatcher("superAdmin.jsp").forward(req, resp);
	}

	private void getAdminsByAdminName(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		PrintWriter out = resp.getWriter();

		String adminName = req.getParameter("searchName");
		System.out.println("根据用户名查询管理员信息：adminName=" + adminName);
		if (adminName.equals("")) {
			System.out.println("输入为空！");
			out.print("<script type='text/javascript'>");
			out.print("alert('输入为空！');");
			out.print("location.href='superAdmin.jsp';");
			out.print("</script>");
			return;
		}

		List<Admin> adminList = adminService.getAdminsByAdminName(adminName);
		if (adminList.size() == 0) {
			out.print("<script type='text/javascript'>");
			out.print("alert('未找到相关管理员信息！');");
			out.print("location.href='superAdmin.jsp';");
			out.print("</script>");
			return;
		}

		req.setAttribute("adminList", adminList);
		req.getRequestDispatcher("superAdmin.jsp").forward(req, resp);
	}

	private void modiftStatusByAdminID(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		PrintWriter out = resp.getWriter();

		int adminID = Integer.parseInt(req.getParameter("id"));
		int status = Integer.parseInt(req.getParameter("status"));

		boolean ret = adminService.modifyStatusByAdminID(adminID, status);

		if (ret) {
			System.out.println("状态修改成功！");
			out.print("<script type='text/javascript'>");
			out.print("alert('状态修改成功！');");
			out.print("location.href='superAdmin.jsp';");
			out.print("</script>");
		} else {
			System.out.println("状态修改失败！");
			out.print("<script type='text/javascript'>");
			out.print("alert('状态修改失败！');");
			out.print("location.href='superAdmin.jsp';");
			out.print("</script>");
		}
	}

	private void modifySuperAdminPassword(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		PrintWriter out = resp.getWriter();

		String adminPassword = req.getParameter("password1");
		String adminPassword2 = req.getParameter("password2");

		System.out.println("修改超级管理员密码");
		System.out.println("adminID=1");

		// 先验证是否为空
		if (adminPassword == null || adminPassword.equals("") || adminPassword2 == null || adminPassword2.equals("")) {
			out.print("<script type='text/javascript'>");
			out.print("alert('密码不能为空！');");
			out.print("location.href='modifySuperAdminPassword.jsp';");
			out.print("</script>");
			return;
		}

		// 再验证是否相等
		if (!adminPassword.equals(adminPassword2)) {
			out.print("<script type='text/javascript'>");
			out.print("alert('密码不一致！');");
			out.print("location.href='modifySuperAdminPassword.jsp';");
			out.print("</script>");
			return;
		}

		boolean ret = adminService.modifyPasswordByAdminID(1, adminPassword);
		if (ret) {
			System.out.println("超级管理员密码修改成功！");
			req.getSession().invalidate();

			out.print("<script type='text/javascript'>");
			out.print("alert('密码修改成功，请重新登录！');");
			out.print("location.href='login.jsp';");
			out.print("</script>");
		} else {
			System.out.println("超级管理员密码修改失败！");
			out.print("<script type='text/javascript'>");
			out.print("alert('密码修改失败！');");
			out.print("location.href='modifySuperAdminPassword.jsp';");
			out.print("</script>");
		}
	}

	private void modifyAdminPassword(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		PrintWriter out = resp.getWriter();

		String adminID = req.getParameter("adminID");
		String adminPassword = req.getParameter("password1");
		String adminPassword2 = req.getParameter("password2");

		System.out.println("修改管理员密码");
		System.out.println("adminID=" + adminID);

		if (adminPassword == null || adminPassword.equals("") || adminPassword2 == null || adminPassword2.equals("")) {
			out.print("<script type='text/javascript'>");
			out.print("alert('密码不能为空！');");
			out.print("location.href='superAdmin.jsp';"); // TODO:应该跳到modifyAdminPassword.jsp，回填adminID
			out.print("</script>");
			return;
		}

		if (!adminPassword.equals(adminPassword2)) {
			out.print("<script type='text/javascript'>");
			out.print("alert('密码不一致！');");
			out.print("location.href='superAdmin.jsp';");
			out.print("</script>");
			return;
		}

		boolean ret = adminService.modifyPasswordByAdminID(Integer.parseInt(adminID), adminPassword);
		if (ret) {
			System.out.println("管理员密码修改成功！");
			out.print("<script type='text/javascript'>");
			out.print("alert('密码修改成功！');");
			out.print("location.href='superAdmin.jsp';");
			out.print("</script>");
		} else {
			System.out.println("管理员密码修改失败！");
			out.print("<script type='text/javascript'>");
			out.print("alert('密码修改失败，请重试！');");
			out.print("location.href='superAdmin.jsp';");
			out.print("</script>");
		}
	}

	private void checkAdminNameIsUnique(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		PrintWriter out = resp.getWriter();

		String adminName = req.getParameter("adminName");
		if (adminName == null || "".equals(adminName)) // 前端验证
			return;
		
		logger.info("check admin name is unique? request param: adminName = {}", adminName);

		boolean isUnique = adminService.checkAdminNameIsUnique(adminName);
		if (isUnique)
			out.print(1);
		else
			out.print(0);
	}

	private void checkAdminNameIsUniqueForModify(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		PrintWriter out = resp.getWriter();

		int adminID = Integer.parseInt(req.getParameter("adminID"));
		String adminName = req.getParameter("adminName");
		System.out.println(adminID + " " + adminName);

		boolean isUnique = adminService.checkAdminNameIsUniqueForModify(adminID, adminName);

		if (isUnique)
			out.print(1);
		else
			out.print(0);
	}

	private void modifyAdminInfoByAdminID(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		PrintWriter out = resp.getWriter();

		String adminID = req.getParameter("adminID");
		String adminName = req.getParameter("adminName");
		String adminRealName = req.getParameter("adminRealName");
		String adminPhoneNum = req.getParameter("adminPhoneNum");

		if (adminID == null || adminID.equals("")) {
			out.print("<script type='text/javascript'>");
			out.print("alert('无效操作！');");
			out.print("location.href='superAdmin.jsp';");
			out.print("</script>");
			return;
		}

		Admin admin = new Admin();
		admin.setAdminID(Integer.parseInt(adminID));
		admin.setAdminName(adminName);
		admin.setAdminRealName(adminRealName);
		admin.setAdminPhoneNum(adminPhoneNum);
		System.out.println("修改管理员信息：" + admin);

		boolean ret = adminService.modifyAdminInfoByAdminID(admin);
		if (ret) {
			System.out.println("管理员信息修改成功！");
			out.print("<script type='text/javascript'>");
			out.print("alert('管理员信息修改成功！');");
			out.print("location.href='superAdmin.jsp';");
			out.print("</script>");

		} else {
			out.print("<script type='text/javascript'>");
			out.print("alert('信息修改失败，请重试！');");
			out.print("location.href='superAdmin.jsp';");
			out.print("</script>");
		}

	}

	private void regist(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		PrintWriter out = resp.getWriter();

		String adminName = req.getParameter("adminName");
		String adminRealName = req.getParameter("adminRealName");
		String adminPhoneNum = req.getParameter("adminPhoneNum");
		String password1 = req.getParameter("password1");
		String password2 = req.getParameter("password2");

		// 后端仅做判空处理，格式前端验证
		if (adminName == null || "".equals(adminName)) {
			out.print("<script type='text/javascript'>");
			out.print("alert('用户名不能为空！');");
			out.print("location.href='regist.jsp';");
			out.print("</script>");
			return;
		}

		if (adminRealName == null || "".equals(adminRealName)) {
			out.print("<script type='text/javascript'>");
			out.print("alert('姓名不能为空！');");
			out.print("location.href='regist.jsp';");
			out.print("</script>");
			return;
		}

		if (adminPhoneNum == null || "".equals(adminPhoneNum)) {
			out.print("<script type='text/javascript'>");
			out.print("alert('电话号码不能为空！');");
			out.print("location.href='regist.jsp';");
			out.print("</script>");
			return;
		}

		if (password1 == null || "".equals(password1) || password2 == null || "".equals(password2)) {
			out.print("<script type='text/javascript'>");
			out.print("alert('密码不能为空！');");
			out.print("location.href='regist.jsp';");
			out.print("</script>");
			return;
		}

		if (!password1.equals(password2)) {
			out.print("<script type='text/javascript'>");
			out.print("alert('密码不一致！');");
			out.print("location.href='regist.jsp';");
			out.print("</script>");
			return;
		}

		Admin admin = new Admin(null, adminName, password1, adminRealName, adminPhoneNum, null);
		logger.info("regist new admin. request params: " + admin);

		boolean ret = adminService.regist(admin);
		if (ret) {
			logger.info("admin registered successfully");
			out.print("<script type='text/javascript'>");
			out.print("var ret=confirm('注册成功！继续注册？');");
			out.print("if(ret) location.href='regist.jsp';");
			out.print("else location.href='superAdmin.jsp';");
			out.print("</script>");
		} else {
			logger.info("admin registration failed");
			out.print("<script type='text/javascript'>");
			out.print("alert('注册失败！');");
			out.print("location.href='regist.jsp';");
			out.print("</script>");
		}
	}
}
