package com.link.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServletRequest;

@WebFilter(filterName = "Filter01", urlPatterns = { "/*" }, initParams = {
		@WebInitParam(name = "encoding", value = "UTF-8") })
public class EncodingFilter implements Filter {

	private String encoding = null;

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		this.encoding = filterConfig.getInitParameter("encoding");
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest req = (HttpServletRequest) request;
		String uri = req.getRequestURI();
//		System.out.println(uri);

		if (uri.endsWith(".css")) {
			chain.doFilter(request, response);
			return;
		}

		request.setCharacterEncoding(encoding);
		response.setContentType("text/html;charset=" + encoding);

		chain.doFilter(request, response);
	}

	@Override
	public void destroy() {
		encoding = null;
	}

}
