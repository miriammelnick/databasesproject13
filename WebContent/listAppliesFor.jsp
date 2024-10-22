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
			String query = "select S.first_name, S.last_name, S.email, S.phone, " + 
			"A.application_date, R.reason, r.status from applies_for A, student S, "+
			"room_change_request R where A.student_id = S.student_id and " +
			"A.room_change_request_id = R.room_change_request_id";
			rset = stmt.executeQuery(query);
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
<title>All Applies-For Records</title>

</head>
<body>
<h2>These students have applied for room changes.</h2>
<div align="left"><font color="#000000" size="3"> </font> </div>
<div>
<table border="1" cellspacing="1" cellpadding="1" align="left">
  <tr>
    <td width=10% align=left>first_name</td>
    <td width=10% align=left>last_name</td>
    <td width=10% align=left>email</td>
    <td width=10% align=left>phone</td>
	<td width=15% align=left>application_date</td>
	<td width=20% align=left>reason</td>
	<td width=8% align=left>status</td>
	
	

  </tr>
 	<%
	if(rset != null) {
	while(rset.next()) {
	%>
	<tr>
	    <td width=10% align=left><%=rset.getString("first_name")%></td>
	    <td width=10% align=left><%=rset.getString("last_name")%></td>
	    <td width=10% align=left><%=rset.getString("email")%></td>
	    <td width=10% align=left><%=rset.getString("phone")%></td>
		<td width=15% align=left><%=rset.getString("application_date")%></td>
		<td width=20% align=left><%=rset.getString("reason")%></td>
		<td width=8% align=left><%=rset.getString("status")%></td>
	</tr>
  <%
	} 
	}
	else {
		out.print(error_msg);
		}
		if( conn != null ) {
		conn.close();
		}
  %>
</table>
	<p style="clear:left; float:left"><a href="employee.jsp">Employee Page</a></p>
</div>
</body>
</html>