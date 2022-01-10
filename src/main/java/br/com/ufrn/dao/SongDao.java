package br.com.ufrn.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import br.com.ufrn.database.ConnectionFactory;
import br.com.ufrn.model.ReportSongModel;
import br.com.ufrn.model.SongModel;

/**
 * @author Paulo Lima (paulo.xavier.700@ufrn.edu.br, plimayep@gmail.com)
 */
public class SongDao {

	private Connection connection;
	
	public SongDao() {
		ConnectionFactory connectionFactory = new ConnectionFactory();
		
		this.connection = connectionFactory.getConnection();
	}
	
	public void closeConnection() {
		try {
			this.connection.close();
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	public ArrayList<SongModel> getAll(Integer userIdLogged) {
		ArrayList<SongModel> songModels = new ArrayList<SongModel>();

		try {
			String sql = "SELECT * FROM songs WHERE user_id = ?";
			PreparedStatement preparedStatement = this.connection.prepareStatement(sql);
			
			preparedStatement.setInt(1, userIdLogged);
						
			ResultSet resultSet = preparedStatement.executeQuery();
			
			while (resultSet.next()) {
				SongModel songBean = new SongModel();
				
				songBean.setId(resultSet.getInt("id"));
				songBean.setUserId(resultSet.getInt("user_id"));
				songBean.setFavorite(resultSet.getBoolean("favorite"));
				songBean.setSong(resultSet.getString("song"));
				
				songModels.add(songBean);
			}
			
			preparedStatement.close();
			resultSet.close();
			
			return songModels;
		} catch (SQLException e) {
			// TODO: handle exception
			System.out.println(e);
			return null;
		} finally {
			this.closeConnection();
		}
	}

	public Boolean save(SongModel songBean) {
		Boolean songCreated = false;

		try {
			String sql = "INSERT INTO songs(user_id, favorite, song) values(?, ?, ?)";
			PreparedStatement preparedStatement = this.connection.prepareStatement(sql);
			
			preparedStatement.setInt(1, songBean.getUserId());
			preparedStatement.setBoolean(2, songBean.getFavorite());
			preparedStatement.setString(3, songBean.getSong());
			
			preparedStatement.execute();
			preparedStatement.close();
			
			songCreated = true;
			
			return songCreated;
		} catch (SQLException e) {
			// TODO: handle exception
			System.out.println(e);
			return songCreated;
		} finally {
			this.closeConnection();
		}
	}
	
	public Boolean songHasExists(Integer songId) {
		Boolean songHasExists = false;
		
		try {
			String sql = "SELECT * FROM songs WHERE JSON_EXTRACT(song, \"$.id\") = ?";
			PreparedStatement preparedStatement = this.connection.prepareStatement(sql);
			
			preparedStatement.setInt(1, songId);
			
			ResultSet resultSet = preparedStatement.executeQuery();

			if (resultSet.next()) {
				songHasExists = true;
	        }
			
			resultSet.close();
			preparedStatement.close();
			
			return songHasExists;
		} catch (SQLException e) {
			// TODO: handle exception
			System.out.println(e);
			return songHasExists;
		}
	}
	
	public Boolean favorite(Integer id, Integer userId) {
		Boolean songFavorited = false;

		try {
			String sql = "UPDATE songs SET favorite = !favorite WHERE id = ? AND user_id = ?";
			PreparedStatement preparedStatement = this.connection.prepareStatement(sql);
			
			preparedStatement.setInt(1, id);
			preparedStatement.setInt(2, userId);
			
			preparedStatement.execute();
			preparedStatement.close();
			
			songFavorited = true;
			
			return songFavorited;
		} catch (SQLException e) {
			// TODO: handle exception
			System.out.println(e);
			return songFavorited;
		} finally {
			this.closeConnection();
		}
	}
	
	public Boolean delete(Integer id, Integer userId) {
		Boolean songDeleted = false;

		try {
			String sql = "DELETE FROM songs WHERE id = ? AND user_id = ?";
			PreparedStatement preparedStatement = this.connection.prepareStatement(sql);
			
			preparedStatement.setInt(1, id);
			preparedStatement.setInt(2, userId);
			
			preparedStatement.execute();
			preparedStatement.close();
			
			songDeleted = true;
			
			return songDeleted;
		} catch (SQLException e) {
			// TODO: handle exception
			System.out.println(e);
			return songDeleted;
		} finally {
			this.closeConnection();
		}
	}
	
	public Boolean deleteAllByUserId(Integer userId) {
		Boolean songDeleted = false;

		try {
			String sql = "DELETE FROM songs WHERE user_id = ?";
			PreparedStatement preparedStatement = this.connection.prepareStatement(sql);
			
			preparedStatement.setInt(1, userId);
			
			preparedStatement.execute();
			preparedStatement.close();
			
			songDeleted = true;
			
			return songDeleted;
		} catch (SQLException e) {
			// TODO: handle exception
			System.out.println(e);
			return songDeleted;
		} finally {
			this.closeConnection();
		}
	}
	
	public ReportSongModel report(Integer userId) {
		ReportSongModel reportSongModel = new ReportSongModel();
		
		try {
			String sql = "SELECT SUM(CASE WHEN favorite = true THEN 1 ELSE 0 END) AS favoriteCount, SUM(CASE WHEN (favorite = false OR favorite = true) THEN 1 ELSE 0 END) AS savedCount FROM songs WHERE user_id = ?";
			PreparedStatement preparedStatement = this.connection.prepareStatement(sql);
			
			preparedStatement.setInt(1, userId);
			
			ResultSet resultSet = preparedStatement.executeQuery();

			if (resultSet.next()) {
				reportSongModel.setFavoriteCount(resultSet.getInt("favoriteCount"));
				reportSongModel.setSavedCount(resultSet.getInt("savedCount"));
	        }
			
			resultSet.close();
			preparedStatement.close();
			
			return reportSongModel;
		} catch (SQLException e) {
			// TODO: handle exception
			System.out.println(e);
			return null;
		}
	}
}
