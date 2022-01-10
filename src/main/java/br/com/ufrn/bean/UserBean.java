package br.com.ufrn.bean;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.com.ufrn.dao.SongDao;
import br.com.ufrn.dao.UserDao;
import br.com.ufrn.model.UserModel;

/**
 * @author Paulo Lima (paulo.xavier.700@ufrn.edu.br, plimayep@gmail.com)
 */
public class UserBean {
	
	public UserBean() {

	}
	
	public void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		UserModel userBean = new UserModel();
		
		userBean.setEmail(request.getParameter("userEmail"));
		userBean.setPassword(request.getParameter("userPassword"));
		
		UserDao userDao = new UserDao();
		
		UserModel userBeanFinded = userDao.login(userBean);
		
		if (userBeanFinded.getId() == null) {			
			request.setAttribute("userNotFound", true);

			RequestDispatcher requestDispatcher = request.getRequestDispatcher("/login.jsp");
			
			requestDispatcher.forward(request, response);
		} else {
			HttpSession httpSession = request.getSession();
			
			httpSession.setAttribute("userIdLogged", userBeanFinded.getId());
			httpSession.setAttribute("userNameLogged", userBeanFinded.getName());
			httpSession.setAttribute("userEmailLogged", userBeanFinded.getEmail());
			httpSession.setAttribute("userNotFound", false);
			httpSession.setMaxInactiveInterval(300);
			
			response.sendRedirect(request.getServletContext().getContextPath() + "/dashboard");
		}
	}
	
	public void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession httpSession = request.getSession();
		
		httpSession.invalidate();
		
		response.sendRedirect(request.getServletContext().getContextPath() + "/login.jsp");
	}
	
	public void create(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		UserModel userBean = new UserModel();
		
		userBean.setName(request.getParameter("userName"));
		userBean.setEmail(request.getParameter("userEmail"));
		userBean.setPassword(request.getParameter("userPassword"));
		
		UserDao userDao = new UserDao();
		
		Boolean userCreated = userDao.create(userBean);
		
		if (userCreated) {
			response.sendRedirect(request.getServletContext().getContextPath() + "/register.html?userCreated=true");
		} else {
			response.sendRedirect(request.getServletContext().getContextPath() + "/register.html?userHasExists=true");
		}
	}
	
	public void getAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserDao userDao = new UserDao();
		
		ArrayList<UserModel> userModels = userDao.getAll();
		
		request.setAttribute("users", userModels);
		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/users.jsp");
		
		requestDispatcher.forward(request, response);
	}

	public void delete(HttpServletRequest request, HttpServletResponse response, Integer userIdLogged) throws ServletException, IOException {
		Integer id = Integer.parseInt(request.getParameter("userId"));

		SongDao songDao = new SongDao();
		
		UserDao userDao = new UserDao();
		
		songDao.deleteAllByUserId(userIdLogged);
		userDao.delete(id);
		
		if (userIdLogged == id) {
			response.sendRedirect(request.getServletContext().getContextPath() + "/logout");	
		} else {
			response.sendRedirect(request.getServletContext().getContextPath() + "/users");	
		}
	}
	
	public void update(HttpServletRequest request, HttpServletResponse response, Integer userIdLogged) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		Integer id = Integer.parseInt(request.getParameter("userId"));
		String name = request.getParameter("userName");

		UserDao userDao = new UserDao();
		
		Boolean userUpdated = userDao.update(id, name);
		
		if (userUpdated && id == userIdLogged) {
			HttpSession httpSession = request.getSession();
			
			httpSession.setAttribute("userNameLogged", name);
		}
		
		response.sendRedirect(request.getServletContext().getContextPath() + "/users");
	}

}
