import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class SqlConnection1
 */
@WebServlet("/SqlConnection1")
public class SqlConnection1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SqlConnection1() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		if(request.getParameter("Click").equalsIgnoreCase("Sign In"))
		{
			singIn(request, response);
		}
		else if(request.getParameter("Click").equalsIgnoreCase("Login"))
		{
			login(request, response);
		}
	}
	
	protected void singIn(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		try
		{
			//This initialize the class of driver 
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://127.0.0.1:3306/?user = root";
			String user = "root";
			String pass = "Straw125Berry$";
			
			String firstName = request.getParameter("FirstName");
			String lastName = request.getParameter("LastName");
			String username = request.getParameter("UsrName");
			String email = request.getParameter("Email");
			String password = request.getParameter("Password");
			
			Connection con = DriverManager.getConnection(url,user,pass);
			Statement stmt = con.createStatement();
			
			String sql = "INSERT INTO clone.user(First_Name, Last_Name, Email, User_Name, Password)VALUES('"+firstName+"','"+lastName+"','"+email+"','"+username+"','"+password+"');";
					
			stmt.executeUpdate(sql);
			
			con.close();
			stmt.close();
			response.sendRedirect("Login.jsp");
				
		}
		catch(ClassNotFoundException | SQLException e)
		{
			e.printStackTrace();
		}
	}
	protected void login(HttpServletRequest request, HttpServletResponse response)throws IOException, ServletException
	{
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://127.0.0.1:3306/?user = root";
			String user = "root";
			String pass = "Straw125Berry$";
			
			String user_Name = request.getParameter("UserName"); 
			String password = request.getParameter("PassWord");
			
			Connection con = DriverManager.getConnection(url,user,pass);
			Statement stmt = con.createStatement();
			
			String sql = "SELECT*FROM clone.user WHERE User_Name= '"+user_Name+"'and Password='"+password+"'";
			
			ResultSet rows = stmt.executeQuery(sql);
			
			if(rows.next())
			{
				String name = rows.getString(2);
				
				HttpSession session = request.getSession();
				session.setAttribute("Users", name);
				
				response.sendRedirect("Home.jsp");
			}
			else if(!rows.next())
			{
				String sql2 = "SELECT*FROM clone.employee WHERE User_Name= '"+user_Name+"'and Password='"+password+"'";
				ResultSet find = stmt.executeQuery(sql2);
				if(find.next())
				{
					String name = find.getString(2);
					
					HttpSession sess = request.getSession();
					sess.setAttribute("Users", name);					
					response.sendRedirect("Home.jsp");
				}
			}
			else 
			{
				response.sendRedirect("Login.jsp");
			}
			con.close();
			stmt.close();
		}
		catch(ClassNotFoundException | SQLException e)
		{
			e.printStackTrace();
		}	
	}
}