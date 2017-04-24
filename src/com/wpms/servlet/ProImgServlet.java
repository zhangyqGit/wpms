package com.wpms.servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wpms.service.ProService;
import com.wpms.serviceImpl.ProServiceImpl;

public class ProImgServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ProService service = new ProServiceImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		try {
			String fname = new String(request.getParameter("fname").getBytes("ISO-8859-1"), "utf-8");
			String imgPath = "D:/img";
			File file = new File(imgPath, fname + ".jpg");
			InputStream is = new FileInputStream(file);
			ServletOutputStream out = response.getOutputStream();
			byte[] bys = new byte[1024];
			int len = 0;
			while ((len = is.read(bys)) > 0) {
				out.write(bys, 0, len);
			}
			out.flush();
			out.close();
			is.close();
		} catch (Exception e) {
			System.out.println("Õº∆¨º”‘ÿ“Ï≥£!!");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
