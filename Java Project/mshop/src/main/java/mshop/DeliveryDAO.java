package mshop;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DeliveryDAO {
	
	private String jdbcURL="jdbc:mysql://localhost:3306/mobilestore?useSSL=false";
	private String jdbcusername="root";
	private String jdbcpassword="admin";
	
	private static final String SELECT_ALL_USERS="select * from delivery";
	private static final String UPDATE_USERS_SQL="update delivery set name= ? , author = ? , status= ? where id = ? ";
	private static final String DELECT_USERS_SQL="delete from delivery where id = ? ";
	private static final String INSERT_USER_SQL="INSERT INTO delivery (name,author,status) VALUES" + " (?,?,?);";
	
	
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
	
	
	
	//create or insert delivery
		public void insertUser(Delivery delivery) {
			try {
				Connection connection=getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USER_SQL);
				preparedStatement.setString(1, delivery.getName());
				preparedStatement.setString(2, delivery.getAuthor());
				preparedStatement.setString(3, delivery.getStatus());
				preparedStatement.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	
	//delete delivery
		public boolean deleteUser (int id) throws SQLException{
			boolean rowDeleted;
			try (
				Connection connection=getConnection();
				PreparedStatement statement = connection.prepareStatement(DELECT_USERS_SQL);){
				statement.setInt(1, id);
				rowDeleted =statement.executeUpdate() > 0 ;
			} 
			return rowDeleted;
		}
	
	
	//update delivery
		public void updatetUser(Delivery delivery) {
			boolean rowUpdate;
			try {
				Connection connection=getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_USERS_SQL);
				preparedStatement.setString(1, delivery.getName());
				preparedStatement.setString(2,delivery.getAuthor() );
				preparedStatement.setString(3,delivery.getStatus());
				preparedStatement.setInt(4, delivery.getId());
				rowUpdate = preparedStatement.executeUpdate() > 0;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	
	//select deliveries
			public List<Delivery> selectAllUsers() {
				List<Delivery> items =new ArrayList<Delivery>();
				try {
					Connection connection=getConnection();
					PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS);
					System.out.println(preparedStatement);
					ResultSet rs = preparedStatement.executeQuery();
					
					while(rs.next()) {
						int id=rs.getInt("id");
						String name=rs.getString("name");
						String author=rs.getString("author");
						String status = rs.getString("status");
						items.add(new Delivery(id,name,author,status));
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
				return items;
			}
	
	
}
