package com.wpms.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspsmart.upload.File;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;
import com.wpms.service.UserService;
import com.wpms.serviceImpl.UserServiceImpl;


public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserService service = new UserServiceImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
//		String uname = request.getParameter("username");
//		String upwd = request.getParameter("userpwd");
//		String urole = request.getParameter("userrole");
//		String usex = request.getParameter("usersex");
//		String umail = request.getParameter("usermail");
//		String urlPath = "register.jsp";
//		String msg = null;
//		if(uname != null &&uname !=""){
//			boolean result = service.checkUsername(uname);
//			if(result){
//				msg = "用户名已经存在";
//			}else{
//				int i = service.register(uname,upwd,urole,usex,umail);
//				if(i>0){
//			     msg="注册成功,";
//			     urlPath="index.jsp";
//				}else{
//				 msg="注册失败";
//				}
//			}
//		}else{
//			msg="用户名不能为空";
//		}
//		 request.setAttribute("msg", msg);
//		 request.getRequestDispatcher(urlPath).forward(request, response);
		 try {	
			    SmartUpload smu = new SmartUpload();
				smu.initialize(this.getServletConfig(), request, response);
				smu.setAllowedFilesList("gif,jpg,png,bmp");
				smu.setMaxFileSize(100 * 1024); // 单个文件最大限制为100K
				smu.setCharset("utf-8");
				
				
				smu.upload();
				String uname = smu.getRequest().getParameter("username");
				String upwd = smu.getRequest().getParameter("userpwd");
				String urole = smu.getRequest().getParameter("userrole");
				String usex = smu.getRequest().getParameter("usersex");
				String umail = smu.getRequest().getParameter("usermail");
				String urlPath = "register.jsp";
				String msg = null;
				File file = smu.getFiles().getFile(0);
				file.saveAs("D:/img/"+uname+"."+file.getFileExt());
				if(uname != null &&uname !=""){
					boolean result = service.checkUsername(uname);
					if(result){
						msg = "用户名已经存在";
					}else{
						int i = service.register(uname,upwd,urole,usex,umail);
						if(i>0){
					     msg="注册成功,";
					     urlPath="index.jsp";
						}else{
						 msg="注册失败";
						}
					}
				}else{
					msg="用户名不能为空";
				}
				request.setAttribute("msg", msg);
				request.getRequestDispatcher(urlPath).forward(request, response);
			} catch (SmartUploadException e) {
				e.printStackTrace();
				System.out.println("上传失败，请联系管理员！");
			}
	
	}

}
