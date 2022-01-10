package br.com.ufrn.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.com.ufrn.bean.UserBean;

/**
 * Servlet implementation class UserController
 */
@WebServlet(urlPatterns = {"/login", "/logout", "/users", "/api/v1/users/register", "/api/v1/users/update", "/api/v1/users/delete"})
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		execute(request, response);
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		execute(request, response);
	}
	
	private void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String routePath = request.getServletPath();
		UserBean userBean = new UserBean();

		if (routePath.equals("/login")) {
			userBean.login(request, response);
		} else if (routePath.equals("/logout")) {
			userBean.logout(request, response);
		} else if (routePath.equals("/api/v1/users/register")) {
			userBean.create(request, response);
		} else {
			HttpSession httpSession = request.getSession();
			
			Integer userIdLogged = (Integer) httpSession.getAttribute("userIdLogged");
	
			if (userIdLogged == null) {
				request.setAttribute("sessionExpired", true);

				RequestDispatcher requestDispatcher = request.getRequestDispatcher("/login.jsp");
				
				requestDispatcher.forward(request, response);
			} else {
				if (routePath.equals("/users")) {
					userBean.getAll(request, response);
				} else if (routePath.equals("/api/v1/users/update")) {
					userBean.update(request, response, userIdLogged);
				} else if (routePath.equals("/api/v1/users/delete")) {
					userBean.delete(request, response, userIdLogged);
				}
			}
		}
	}

}
