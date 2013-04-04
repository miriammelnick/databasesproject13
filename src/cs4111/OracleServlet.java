package cs4111;
import java.io.IOException; import java.io.PrintWriter; import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest; import javax.servlet.http.HttpServletResponse;
import oracle.jdbc.pool.OracleDataSource;
/**
* Servlet implementation class OracleServlet */

public class OracleServlet extends HttpServlet { 
	private static final long serialVersionUID = 1L; 
	private static final String connect_string = "jdbc:oracle:thin:scott/tiger@//w4111b.cs.columbia.edu:1521/ADB";
	private Connection conn;
/**
* @see HttpServlet#HttpServlet() */

public OracleServlet() { 
	super();
// TODO Auto-generated constructor stub 
}
/**
* @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
response) */

protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	PrintWriter pw = new PrintWriter(response.getOutputStream()); 
	try {
		if (conn == null) {
		// Create a OracleDataSource instance and set URL
		OracleDataSource ods = new OracleDataSource(); ods.setURL(connect_string);
		conn = ods.getConnection();
	}
	Statement stmt = conn.createStatement();
	ResultSet rset = stmt.executeQuery("select ENAME from EMP");
	response.setContentType("text/html"); pw.println("<html>"); 
	pw.println("<head><title>Employee Table Servlet Sample</title></head>");
	pw.println("<H1>Show EMP Table Data <BR></H1>");
	pw.println("<body><BR>"); 
	while (rset.next()) {
		pw.println (rset.getString("ename") + "<BR>");
		}
	pw.println("</body></html>"); 
	} catch (SQLException e) {
	pw.println(e.getMessage()); 
	}
	pw.close();
}
/**
* @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response) */

protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
// TODO Auto-generated method stub }
	}
}