<jsp:useBean id="sa" class="cs4111.ServiceAppointment" scope="session"/>
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
			rset = stmt.executeQuery("select first_name, last_name, room_id, student_id from student");
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
<title>New Service Appointment</title>
<script type="text/javascript" src="validatious.js"></script>
</head>
<body>
	<H2>Apply for a Service Appointment</H2>
	<form id="sa-form" action="saveServiceAppointment.jsp" method="POST" class="validate">
		Why are you requesting a service appointment? (required)
		<br/>
		<textarea id="reason" name="reason" style="width:300px; height: 150px" class="required"></textarea>
		<br/>
		Appointment ID: <input type="text" name="appointmentId" class="required numeric"></input><br/>
		<select style="width:300px " id="room_id" name="room_id">
	<%
	if(rset != null) {
	while(rset.next()) {
		out.print("<option value='"+ rset.getString("room_id") + "'> " +rset.getString("first_name") + " " +
			rset.getString("last_name")+ ", room " + rset.getString("room_id"));
		out.print("</option>");
		}
	} else {
	out.print(error_msg);
	}
	if( conn != null ) {
	conn.close();
	}
	%>
  	
	</select><br/>
		<input id="submitbutton" name="submitbutton" type="submit" value="submit">
	</form>
	
	
	
	<p><a href="student.jsp">Student Page</a></p>
</body>
</html>