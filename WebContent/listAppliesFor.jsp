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
			rset = stmt.executeQuery("select student_id, application_date, room_change_request_id from applies_for");
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
<table width="75%" border="1" cellspacing="1" cellpadding="1" align="left">
  <tr>
    <td width=16% align=left>student_id</td>
	<td width=16% align=left>application_date</td>
	<td width=8% align=left>room_change_request_id</td>

  </tr>
 	<%
	if(rset != null) {
	while(rset.next()) {
	%>
	<tr>
	    <td width=16% align=left><%=rset.getInt("student_id")%></td>
		<td width=16% align=left><%=rset.getString("application_date")%></td>
		<td width=8% align=left><%=rset.getInt("room_change_request_id")%></td>
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
	<p><a href="employee.jsp">Employee Page</a></p>
</div>
</body>
</html>