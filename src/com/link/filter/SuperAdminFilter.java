package com.link.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

@WebFilter(filterName = "Filter02", urlPatterns = { "/admin/superAdmin", "/admin/superAdmin.jsp",
		"/admin/regist.jsp", "/admin/modifyAdminInfo.jsp", "/admin/modifySuperAdminPassword.jsp",
		"/admin/modifyAdminPassword.jsp"
		 })
public class SuperAdminFilter implements Filter {

	private static final Logger logger = LogManager.getLogger();

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		PrintWriter out = response.getWriter();

		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		HttpSession session = req.getSession();

		Integer adminID = (Integer) session.getAttribute("adminID");

		if (adminID == null) {
			logger.info("尚未登录！");
			out.print("<script type='text/javascript'>");
			out.print("alert('尚未登录！');");
			out.print("location.href='login.jsp';");
			out.print("</script>");
			return;
		} else if (adminID != 1) {
			logger.info("无此权限！");
			resp.sendRedirect("noPermission.jsp");
			return;
		}

		chain.doFilter(request, response);
	}

}
