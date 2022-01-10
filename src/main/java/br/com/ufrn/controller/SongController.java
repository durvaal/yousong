package br.com.ufrn.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.com.ufrn.bean.SongBean;

/**
 * Servlet implementation class UserController
 */
@WebServlet(urlPatterns = {"/dashboard", "/my-songs", "/api/v1/songs/save", "/api/v1/songs/favorite", "/api/v1/songs/delete"})
public class SongController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SongController() {
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
		HttpSession httpSession = request.getSession();
		
		Integer userIdLogged = (Integer) httpSession.getAttribute("userIdLogged");

		if (userIdLogged == null) {
			request.setAttribute("sessionExpired", true);

			RequestDispatcher requestDispatcher = request.getRequestDispatcher("/login.jsp");
			
			requestDispatcher.forward(request, response);
		} else {
			String routePath = request.getServletPath();
			SongBean songBean = new SongBean();

			if (routePath.equals("/dashboard")) {
				songBean.report(request, response, userIdLogged);
			} else if (routePath.equals("/my-songs")) {
				songBean.getAll(request, response, userIdLogged);
			} else if (routePath.equals("/api/v1/songs/save")) {
				songBean.save(request, response, userIdLogged);
			} else if (routePath.equals("/api/v1/songs/favorite")) {
				songBean.favorite(request, response, userIdLogged);
			} else if (routePath.equals("/api/v1/songs/delete")) {
				songBean.delete(request, response, userIdLogged);
			}
		}
	}

}
