package com.link.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

@MultipartConfig(maxFileSize = 1024 * 300)
@WebServlet("/upload")
public class ImgUploadServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private static final Logger logger = LogManager.getLogger();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		PrintWriter out = resp.getWriter();

		Part part = null;
		try {
			part = req.getPart("file");
		} catch (Exception e) {
			logger.atWarn().withThrowable(e).log("上传失败，请上传小于300kb的文件！");
		}

		if (part == null) {
			out.print("<script type='text/javascript'>");
			out.print("alert('上传失败，请上传小于300kb的文件！');");
			out.print("location.href='upload.jsp';");
			out.print("</script>");
			return;
		}

		String fileName = part.getSubmittedFileName();
		if (fileName == null || "".equals(fileName)) {
			out.print("<script type='text/javascript'>");
			out.print("alert('请选择文件进行上传！');");
			out.print("location.href='upload.jsp';");
			out.print("</script>");
			return;
		}
		logger.info("file name: {}", fileName);


		String path = this.getServletContext().getRealPath("/headImg/");
		logger.info(path);

		File file = new File(path);
		// 目录不存在则创建
		if (!file.exists()) {
			file.mkdirs();
		}

		part.write(path + fileName);

		out.print("<script type='text/javascript'>");
		out.print("alert('上传成功 ^_^');");
		out.print("location.href='upload.jsp';");
		out.print("</script>");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
