package mshop;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ItemDAO {
	private String jdbcURL="jdbc:mysql://localhost:3306/mobilestore?useSSL=false";
	private String jdbcusername="root";
	private String jdbcpassword="admin";
	
	
	private static final String SELECT_ALL_USERS="select * from items";
	
	
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
	
	
		//select users
		public List<Item> selectAllUsers() {
			List<Item> items =new ArrayList<Item>();
			try {
				Connection connection=getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS);
				System.out.println(preparedStatement);
				ResultSet rs = preparedStatement.executeQuery();
				
				while(rs.next()) {
					int id=rs.getInt("id");
					String name=rs.getString("name");
					int price = rs.getInt("price");
					String details = rs.getString("details");
					String image = rs.getString("image");
					items.add(new Item(id,name,price,details,image));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return items;
			
		}
		
		
}
