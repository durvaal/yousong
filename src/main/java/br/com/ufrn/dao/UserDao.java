package br.com.ufrn.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import br.com.ufrn.database.ConnectionFactory;
import br.com.ufrn.model.UserModel;

/**
 * @author Paulo Lima (paulo.xavier.700@ufrn.edu.br, plimayep@gmail.com)
 */
public class UserDao {

	private Connection connection;
	
	public UserDao() {
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
	
	public UserModel login(UserModel userModel) {
		try {
			String sql = "SELECT * FROM users WHERE email = ? AND password = ?";
			PreparedStatement preparedStatement = this.connection.prepareStatement(sql);
			
			preparedStatement.setString(1, userModel.getEmail());
			preparedStatement.setString(2, userModel.getPassword());
			
			ResultSet resultSet = preparedStatement.executeQuery();

			UserModel userModelFinded = new UserModel();

			if (resultSet.next()) {
				userModelFinded.setId(resultSet.getInt("id"));
				userModelFinded.setName(resultSet.getString("name"));
				userModelFinded.setEmail(resultSet.getString("email"));
	        }
			
			resultSet.close();
			preparedStatement.close();
			
			return userModelFinded;
		} catch (SQLException e) {
			// TODO: handle exception
			System.out.println(e);
			return null;
		} finally {
			this.closeConnection();
		}
	}
	
	public Boolean create(UserModel userModel) {
		Boolean userCreated = false;

		try {
			if (!userHasExists(userModel.getEmail())) {
				String sql = "INSERT INTO users(name, email, password) values(?, ?, ?)";
				PreparedStatement preparedStatement = this.connection.prepareStatement(sql);
				
				preparedStatement.setString(1, userModel.getName());
				preparedStatement.setString(2, userModel.getEmail());
				preparedStatement.setString(3, userModel.getPassword());
				
				preparedStatement.execute();
				preparedStatement.close();
				
				userCreated = true;
			}
			
			return userCreated;
		} catch (SQLException e) {
			// TODO: handle exception
			System.out.println(e);
			return userCreated;
		} finally {
			this.closeConnection();
		}
	}
	
	public Boolean userHasExists(String email) {
		Boolean userHasExists = false;
		
		try {
			String sql = "SELECT id FROM users WHERE email = ?";
			PreparedStatement preparedStatement = this.connection.prepareStatement(sql);
			
			preparedStatement.setString(1, email);
			
			ResultSet resultSet = preparedStatement.executeQuery();

			if (resultSet.next()) {
				userHasExists = true;
	        }
			
			resultSet.close();
			preparedStatement.close();
			
			return userHasExists;
		} catch (SQLException e) {
			// TODO: handle exception
			System.out.println(e);
			return userHasExists;
		}
	}
	
	public ArrayList<UserModel> getAll() {
		ArrayList<UserModel> userModels = new ArrayList<UserModel>();

		try {
			String sql = "SELECT id, name, email FROM users";
			PreparedStatement preparedStatement = this.connection.prepareStatement(sql);
						
			ResultSet resultSet = preparedStatement.executeQuery();
			
			while (resultSet.next()) {
				UserModel userModel = new UserModel();
				
				userModel.setId(resultSet.getInt("id"));
				userModel.setName(resultSet.getString("name"));
				userModel.setEmail(resultSet.getString("email"));
				
				userModels.add(userModel);
			}
			
			preparedStatement.close();
			resultSet.close();
			
			return userModels;
		} catch (SQLException e) {
			// TODO: handle exception
			System.out.println(e);
			return null;
		} finally {
			this.closeConnection();
		}
	}

	public Boolean delete(Integer id) {
		Boolean userDeleted = false;

		try {
			String sql = "DELETE FROM users WHERE id = ?";
			PreparedStatement preparedStatement = this.connection.prepareStatement(sql);
			
			preparedStatement.setInt(1, id);
			
			preparedStatement.execute();
			preparedStatement.close();
			
			userDeleted = true;
			
			return userDeleted;
		} catch (SQLException e) {
			// TODO: handle exception
			System.out.println(e);
			return userDeleted;
		} finally {
			this.closeConnection();
		}
	}

	public Boolean update(Integer id, String name) {
		Boolean userUpdated = false;

		try {
			String sql = "UPDATE users SET name = ? WHERE id = ?";
			PreparedStatement preparedStatement = this.connection.prepareStatement(sql);

			preparedStatement.setString(1, name);
			preparedStatement.setInt(2, id);
			
			preparedStatement.execute();
			preparedStatement.close();
			
			userUpdated = true;
			
			return userUpdated;
		} catch (SQLException e) {
			// TODO: handle exception
			System.out.println(e);
			return userUpdated;
		} finally {
			this.closeConnection();
		}
	}
}
