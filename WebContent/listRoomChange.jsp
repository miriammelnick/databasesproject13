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
		rset = stmt.executeQuery("select * from room_change_request");
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
<div align="left"><font color="#000000" size="3"> </font> </div>
<div>
<table width="75%" border="1" cellspacing="1" cellpadding="1" align="left">
  <tr>
    <td width=16% align=left>Room_Change_Request_id</td>
	<td width=16% align=left>Reason</td>
	<td width=8% align=left>Status</td>
	<td width=12% align=left>Update</td>
	<td width=12% align=left>Delete</td>
  </tr>
 	<%
	if(rset != null) {
	while(rset.next()) {
	%>
	<tr>
	    <td width=16% align=left><%=rset.getObject(1)%></td>
		<td width=16% align=left><%=rset.getObject(2)%></td>
		<td width=8% align=left><%=rset.getObject(3)%></td>
		<td width=12% align=left><a href="edit.jsp?roomChangeRequestId=<%=rset.getObject(1)%>">edit</a></td>
		<td width=12% align=left><a href="del.jsp?roomChangeRequestId=<%=rset.getObject(1)%>">delete</a></td>
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