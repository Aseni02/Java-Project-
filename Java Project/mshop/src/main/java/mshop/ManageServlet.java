package mshop;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ManageServlet
 */
@WebServlet("/")
public class ManageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ItemDAO itemDAO;
	private UserDAO userDAO;
	private DeliveryDAO deliveryDAO;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManageServlet() {
        this.itemDAO = new ItemDAO();
        this.userDAO = new UserDAO();
        this.deliveryDAO =new DeliveryDAO();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getServletPath();
		switch(action) {
		case "/account":
			try {
				goAccount(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case "/delivery":
			try {
				listDelivery(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case "/insertdelivery":
			try {
				insertdelivery(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case "/adddelivery":
			showaddDelivery(request, response);
			break;
		case "/deliveryupdate":
			try {
				deliveryupdate(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case "/deliverydelete":
			try {
				deliverydelete(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
			
			
		case "/account/details":
			try {
				getaccountdetals(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case "/update":
			try {
				updateUser(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case "/delete":
			try {
				deleteUser(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		default:
			try {
				listUser(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	private void insertdelivery(HttpServletRequest request,HttpServletResponse response)
			throws SQLException , IOException {
		String name = request.getParameter("name");
		String author = request.getParameter("author");
		String status =request.getParameter("status");
		Delivery delivery=new Delivery(name,author,status);
		deliveryDAO.insertUser(delivery);
		response.sendRedirect("http://localhost:8090/mshop/delivery");
	}

	
	private void deliverydelete(HttpServletRequest request,HttpServletResponse response ) 
			throws SQLException , IOException {
			int id = Integer.parseInt(request.getParameter("id"));
			deliveryDAO.deleteUser(id);
			response.sendRedirect("http://localhost:8090/mshop/delivery");
	}
	
	private void deliveryupdate(HttpServletRequest request,HttpServletResponse response)
			throws SQLException , IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String author = request.getParameter("author");
		String status =request.getParameter("status");
		Delivery delivery=new Delivery(id,name,author,status);
		deliveryDAO.updatetUser(delivery);
		response.sendRedirect("http://localhost:8090/mshop/delivery");
	}
	
	
	private void showaddDelivery(HttpServletRequest request,HttpServletResponse response ) 
			throws ServletException,  IOException {
			RequestDispatcher dispatcher=request.getRequestDispatcher("addDelivery.jsp");
			dispatcher.forward(request, response);
	}
	
	private void deleteUser(HttpServletRequest request,HttpServletResponse response ) 
			throws SQLException , IOException {
			userDAO.deleteUser();
			response.sendRedirect("http://localhost:8090/mshop");
	}
	
	
	private void listDelivery(HttpServletRequest request,HttpServletResponse response)
			throws SQLException,ServletException , IOException {
		List<Delivery> listDelivery=deliveryDAO.selectAllUsers();
		request.setAttribute("listDelivery", listDelivery);
		RequestDispatcher dispatcher=request.getRequestDispatcher("Delivery.jsp");
		dispatcher.forward(request, response);
	}


	private void listUser(HttpServletRequest request,HttpServletResponse response)
			throws SQLException,ServletException , IOException {
		List<Item> listUser=itemDAO.selectAllUsers();
		request.setAttribute("listitem", listUser);
		RequestDispatcher dispatcher=request.getRequestDispatcher("welcome.jsp");
		dispatcher.forward(request, response);
	}
	
	
	private void goAccount(HttpServletRequest request,HttpServletResponse response)
			throws SQLException,ServletException , IOException {
		User existingUser = userDAO.selectUser();
	    request.setAttribute("name", existingUser.getName());
	    request.setAttribute("number", existingUser.getNumber());
		RequestDispatcher dispatcher=request.getRequestDispatcher("account.jsp");
		dispatcher.forward(request, response);
	}
	
	
	
	private void updateUser(HttpServletRequest request,HttpServletResponse response)
			throws SQLException , IOException {
		String name = request.getParameter("name");
		String number = request.getParameter("number");
		System.out.println(name + number);
		User user=new User(name,number);
		userDAO.updatetUser(user);
		response.sendRedirect("account");
	}
	
	
	private void getaccountdetals(HttpServletRequest request,HttpServletResponse response)
			throws SQLException,ServletException , IOException {
		User existingUser=userDAO.selectUser();
		
		List<String> userDetailsList = new ArrayList<>();
	    userDetailsList.add(existingUser.getName());
	    userDetailsList.add(existingUser.getNumber());
	    
		RequestDispatcher dispatcher=request.getRequestDispatcher("account.jsp");
		request.setAttribute("user",userDetailsList);
		dispatcher.forward(request, response);
	}


}
