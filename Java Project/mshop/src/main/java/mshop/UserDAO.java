package mshop;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class UserDAO {
	private String jdbcURL="jdbc:mysql://localhost:3306/mobilestore?useSSL=false";
	private String jdbcusername="root";
	private String jdbcpassword="admin";
	private int userid= 44;
	
	
	private static final String SELECT_ALL_USERS="select * from items";
	private static final String SELECT_USER_BY_ID="select * from user where id = ?";
	private static final String UPDATE_USERS_SQL="update user set name= ? , number = ?  where id = ? ";
	private static final String DELECT_USERS_SQL="delete from user where id = ? ";
	
	
	protected Connection getConnection() {
		Connection connection = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(jdbcURL,jdbcusername,jdbcpassword);
		}catch(SQLException e) {
			e.printStackTrace();
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
		return connection;
	}
	
	
	//delete user
		public boolean deleteUser () throws SQLException{
			boolean rowDeleted;
			try (
				Connection connection=getConnection();
				PreparedStatement statement = connection.prepareStatement(DELECT_USERS_SQL);){
				statement.setInt(1, userid);
				rowDeleted =statement.executeUpdate() > 0 ;
			} 
			return rowDeleted;
		}
	
	
	//update user
		public void updatetUser(User user) {
			boolean rowUpdate;
			try {
				Connection connection=getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_USERS_SQL);
				preparedStatement.setString(1, user.getName());
				preparedStatement.setString(2, user.getNumber());
				preparedStatement.setInt(3,userid);
				
				rowUpdate = preparedStatement.executeUpdate() > 0;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	
	
	//select user by id
			public User selectUser() {
				User user = null;
				try {
					Connection connection=getConnection();
					PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID);
					preparedStatement.setInt(1, userid);
					System.out.println(preparedStatement);
					ResultSet rs = preparedStatement.executeQuery();
					
					while(rs.next()) {
						int uid=rs.getInt("id");
						String name=rs.getString("name");
						String number = rs.getString("number");
						user = new User(userid,name,number);
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
				System.out.println(user);
				return user;
				
			}
}
