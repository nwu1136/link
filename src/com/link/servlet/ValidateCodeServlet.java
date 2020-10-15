package com.link.servlet;

import java.awt.image.BufferedImage;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.link.util.ValidateCode;
import com.link.util.ValidateCode.ValidateCodeType;

@WebServlet({ "/ValidateCode", "/admin/ValidateCode" })
public class ValidateCodeServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		Object[] validateCode = ValidateCode.createValidateCode(ValidateCodeType.COMBINATION);

		req.getSession().setAttribute("serverValidateCode", validateCode[0]);

		resp.setContentType("image/jpeg");
		resp.setHeader("Pragma", "no-cache");
		ImageIO.write((BufferedImage) validateCode[1], "jpg", resp.getOutputStream());
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
