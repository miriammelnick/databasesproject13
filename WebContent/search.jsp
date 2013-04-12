<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:useBean id="employeeData" class="cs4111.EmployeeData" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*"%>
<%@ page import="oracle.jdbc.pool.OracleDataSource"%>
<!-- Database lookup -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%! 
String search, searchName;
Connection conn;
Statement stmt;
String sql;
ResultSet rset = null;
String error_msg = "";
%>
<%
  	search=request.getParameter("search").trim();
%>
<a>Search Result</a>
<br/>
<%
 	try{
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:mrm2198/coms4111@//w4111f.cs.columbia.edu:1521/ADB"); 
		conn = ods.getConnection();
		stmt = conn.createStatement();
		sql = "select * from employee M where M.first_name='" + search + "' or M.last_name='" +search + "'";
		rset=stmt.executeQuery(sql);
 	}catch (SQLException e) {
			error_msg = e.getMessage();
			if( conn != null ) {
			conn.close();
			}
			}
 %>
  	<TABLE>
	<tr>
	<td>first_name</td><td>last_name</td><td>email</td><td>phone</td>
	</tr>
	<tr>
	<td><b>----------</b></td><td><b>----------</b></td><td><b>----------</b></td><td><b>----------</b></td>
	</tr>
<%
		while(rset.next()){
			out.print("<tr>");
			out.print("<td>" + rset.getString("first_name") + "</td><td>" + 
			rset.getString("last_name") + "</td>" +
			"<td>" + rset.getString("email") + "</td>"+
			"<td>" + rset.getString("phone") + "</td>");
			out.print("</tr>");
		}
%>
	</TABLE>
	<p><a href="student.jsp">Student Page</a></p>
</body>
</html>