package com.wpms.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspsmart.upload.File;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;
import com.wpms.model.Project;
import com.wpms.service.ProService;
import com.wpms.serviceImpl.ProServiceImpl;

public class ProAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ProService service = new ProServiceImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			try {	
		    SmartUpload smu = new SmartUpload();
			smu.initialize(this.getServletConfig(), request, response);
			smu.setAllowedFilesList("gif,jpg,png,bmp");
			smu.setMaxFileSize(100 * 1024); // 单个文件最大限制为100K
			smu.setCharset("utf-8");
			
			
			smu.upload();
			String pname = smu.getRequest().getParameter("proname");
			String pclass = smu.getRequest().getParameter("proclass");
			String pfirm = smu.getRequest().getParameter("profirm");
			String count = smu.getRequest().getParameter("procount");
			String price = smu.getRequest().getParameter("proprice");
			Integer pcount = Integer.parseInt(count);
			Double pprice = Double.parseDouble(price);
			String urlPath = "admin/index.jsp";
			String msg = null;
			File file = smu.getFiles().getFile(0);
			file.saveAs("D:/img/"+pname+"."+file.getFileExt());
//			int size = file.getSize();
//			byte[] bytesPic = new byte[size];
//			for (int i = 0; i < size; i++) {
//				bytesPic[i] = file.getBinaryData(i);
//			}
			Project project = new Project(pcount, pprice, pname, pclass, pfirm, file.getFileName());
			int i = service.addPro(project);
			if (i > 0) {
				msg = "添加成功";
			} else {
				msg = "添加失败";
				urlPath = "product/proadd.jsp";
			}
			request.setAttribute("msg", msg);
			request.getRequestDispatcher(urlPath).forward(request, response);
		} catch (SmartUploadException e) {
			e.printStackTrace();
			System.out.println("上传失败，请联系管理员！");
		}
	}

}
