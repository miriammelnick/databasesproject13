<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- This import is necessary for JDBC -->
<%@ page import="java.sql.*"%>
<%@ page import="oracle.jdbc.pool.OracleDataSource"%>
<!-- Database lookup -->
<%
		Connection conn = null;
		ResultSet rset = null;
		String error_msg = "";
		try {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:mrm2198/coms4111@//w4111f.cs.columbia.edu:1521/ADB"); 
		conn = ods.getConnection();
		Statement stmt = conn.createStatement();
		rset = stmt.executeQuery("select room_change_request_id, status, reason from room_change_request");
		} catch (SQLException e) {
		error_msg = e.getMessage();
		if( conn != null ) {
		conn.close();
		}
		}
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>All Room Change Requests</title>
</head>
<body>
	<H2>All Room Change Requests</H2>
	<TABLE>
	<tr>
	<td>room_change_request_id</td><td>status</td><td>reason</td>
	</tr>
	<tr>
	<td><b>----------</b></td><td><b>----------</b></td><td><b>----------</b></td>
	</tr>
	<%
	if(rset != null) {
	while(rset.next()) {
	out.print("<tr>");
	out.print("<td>" + rset.getString("room_change_request_id") + "</td><td>" + 
	rset.getString("status") + "</td>" +
	"<td>" + rset.getString("reason") + "</td>");
	out.print("</tr>");
	}
	} else {
	out.print(error_msg);
	}
	if( conn != null ) {
	conn.close();
	}
	%>
	</TABLE>
	<p><a href="index.jsp">Student Page</a></p>
</body>
</html>