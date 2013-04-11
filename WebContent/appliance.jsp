<jsp:useBean id="appliance" class="cs4111.HasAppliance" scope="session"/>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- This import is necessary for JDBC -->
<%@ page import="java.sql.*"%>
<%@ page import="oracle.jdbc.pool.OracleDataSource"%>
<!-- Database lookup -->
<%
		Connection conn = null;
		ResultSet appliances = null, rooms = null;
		String error_msg = "";
		try {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:mrm2198/coms4111@//w4111f.cs.columbia.edu:1521/ADB"); 
		conn = ods.getConnection();
		Statement stmt = conn.createStatement();
		appliances = stmt.executeQuery("select appliance_name, category, room_id from has_appliance");
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
<title>Appliance List</title>
</head>
<body>
	<H2>Appliances</H2>
	<div id="all">
	<a href="newAppliance.jsp">Add a new appliance</a><br/>
	
	
	<TABLE>
	<tr>
	<td>room_id</td><td>appliance_name</td><td>category</td>
	</tr>
	<tr>
	<td><b>----------</b></td><td><b>----------</b></td><td><b>----------</b></td>
	</tr>
	<%
	if(appliances != null) {
		while(appliances.next()) {
			out.print("<tr>");
			out.print("<td>" + appliances.getString("room_id") + "</td><td>" + 
			appliances.getString("appliance_name") + "</td>" +
				"<td>" + appliances.getString("category") + "</td>");
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


	</div>


	<p><a href="student.jsp">Student Page</a></p>
</body>
</html>