import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class SqlConnection2
{
	public SqlConnection2()
	{
		
	}
	public Connection getConnection()
	{
		String url = "jdbc:mysql://127.0.0.1:3306/?user = root";
		Connection con = null;
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
		}
		catch(ClassNotFoundException e)
		{
			e.printStackTrace();
		}
		
		try
		{
			con = DriverManager.getConnection(url, "root", "Straw125Berry$");
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		
		return con;
	}
	
	public void closeConnection(Connection con)
	{
		try
		{
			con.close();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
	}
}