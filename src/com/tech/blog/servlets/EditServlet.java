package com.tech.blog.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.User;
import com.tech.blog.helpers.helper;

/**
 * Servlet implementation class EditServlet
 */
@WebServlet("/EditServlet")
@MultipartConfig
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		
		
		String name = request.getParameter("user_name");
		
		String password = request.getParameter("user_password");
		String gender = request.getParameter("gender");
		String about = request.getParameter("user_about");
		Part part = request.getPart("user_profile");
		String profile = part.getSubmittedFileName();
		
		HttpSession s = request.getSession();
		User u = (User) s.getAttribute("currentUser");
		int ide = u.getId();
		String email = u.getEmail();
		String oldFile = u.getPicture();
		User user = new User(ide,name,email,password,gender,about,profile);
		
		int b = UserDao.updateUser(user);
		if(b == 0) {
			out.println("error");
		}else {
			out.println("done");
			String path = request.getRealPath("/") + "pics" + File.separator + user.getPicture();
			String oldPath = request.getRealPath("/") + "pics" + File.separator + oldFile;
			helper.deleteFile(oldPath);
			if(helper.saveFile(part.getInputStream(), path)) {
				
			out.println("profile updated");
			}
			
		}
		
	}

}
