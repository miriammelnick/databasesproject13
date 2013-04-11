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
			String query = "select R.request_date, S.first_name, S.last_name, S.phone, " + 
			"S.email, A.reason from sends_request R, student S, "+
			"service_appointment A where R.student_id = S.student_id and " + 
			"A.appointment_id = R.appointment_id";
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
<title>All Sends-Request Records</title>

</head>
<body>
<h2>These students have requested service appointments.</h2>
<div align="left"><font color="#000000" size="3"> </font> </div>
<div>
<table border="1" cellspacing="1" cellpadding="1" align="left">
  <tr>
    <td width=10% align=left>first_name</td>
    <td width=10% align=left>last_name</td>
    <td width=10% align=left>email</td>
    <td width=10% align=left>phone</td>
	<td width=20% align=left>request_date</td>
	<td width=20% align=left>reason</td>
	
	

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
		<td width=20% align=left><%=rset.getString("request_date")%></td>
		<td width=20% align=left><%=rset.getString("reason")%></td>
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