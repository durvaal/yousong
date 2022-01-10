package br.com.ufrn.bean;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.ufrn.dao.SongDao;
import br.com.ufrn.model.ReportSongModel;
import br.com.ufrn.model.SongModel;

/**
 * @author Paulo Lima (paulo.xavier.700@ufrn.edu.br, plimayep@gmail.com)
 */
public class SongBean {
	
	public SongBean() {

	}

	public void save(HttpServletRequest request, HttpServletResponse response, Integer userIdLogged) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");

		PrintWriter printWriter = response.getWriter();
		
		Integer songId = Integer.parseInt(request.getParameter("songId"));
		
		SongDao songDao = new SongDao();

		Boolean songHasExists = songDao.songHasExists(songId);
		
		if (songHasExists) {
			songDao.closeConnection();
	        printWriter.print("{\"message\":\"The song has already been saved\",\"success\":false}");
		} else {
			SongModel songBean = new SongModel();
			
			songBean.setUserId(userIdLogged);
			songBean.setFavorite(false);
			songBean.setSong(request.getParameter("songObject"));
			
			Boolean songCreated = songDao.save(songBean);
	
			if (songCreated) {
		        printWriter.print("{\"message\":\"The song was successfully saved\",\"success\":true}");
			} else {
		        printWriter.print("{\"message\":\"The song was not saved successfully\",\"success\":false}");
			}
		}
	}

	public void getAll(HttpServletRequest request, HttpServletResponse response, Integer userIdLogged) throws ServletException, IOException {
		SongDao songDao = new SongDao();
		
		ArrayList<SongModel> songModels = songDao.getAll(userIdLogged);
		
		request.setAttribute("songs", songModels);
		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/my-songs.jsp");
		
		requestDispatcher.forward(request, response);
	}

	public void favorite(HttpServletRequest request, HttpServletResponse response, Integer userIdLogged) throws ServletException, IOException {
		Integer id = Integer.parseInt(request.getParameter("songId"));

		SongDao songDao = new SongDao();
		
		songDao.favorite(id, userIdLogged);
		
		response.sendRedirect(request.getServletContext().getContextPath() + "/my-songs");
	}

	public void delete(HttpServletRequest request, HttpServletResponse response, Integer userIdLogged) throws ServletException, IOException {
		Integer id = Integer.parseInt(request.getParameter("songId"));

		SongDao songDao = new SongDao();
		
		songDao.delete(id, userIdLogged);

		response.sendRedirect(request.getServletContext().getContextPath() + "/my-songs");
	}

	public void report(HttpServletRequest request, HttpServletResponse response, Integer userIdLogged) throws ServletException, IOException {
		SongDao songDao = new SongDao();
		
		ReportSongModel reportSongModel = songDao.report(userIdLogged);

		request.setAttribute("favoriteCount", reportSongModel.getFavoriteCount());
		request.setAttribute("savedCount", reportSongModel.getSavedCount());

		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/dashboard.jsp");
		
		requestDispatcher.forward(request, response);
	}
}
