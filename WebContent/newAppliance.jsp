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
		ResultSet rset = null;
		String error_msg = "", category;
		try {
			OracleDataSource ods = new OracleDataSource();
			ods.setURL("jdbc:oracle:thin:mrm2198/coms4111@//w4111f.cs.columbia.edu:1521/ADB"); 
			conn = ods.getConnection();
			Statement stmt = conn.createStatement();
			rset = stmt.executeQuery("select room_id, room_number, building_id from room");
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
<title>New Appliance</title>
<script type="text/javascript" src="validatious.js"></script>
</head>
<body>

<H2>Add a new appliance</H2>
	<form id="appliance-form" action="saveAppliance.jsp" method="POST" class="validate">
		Select your room:
		<select id="room_id" name="room_id">
	<%
	if(rset != null) {
	while(rset.next()) {
		out.print("<option value='"+ rset.getString("room_id") + "'> Building " +rset.getString("building_id") +
				", Room " + rset.getString("room_number"));
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
	Appliance Name (required): <input id="appliance_name" name="appliance_name" type="text" class="required"></input><br/>
	Appliance Category: <select id="category" name="category">
		<option value="kitchen">Kitchen</option>
		<option value="bathroom">Bathroom</option>
		<option value="heating">Heating</option>
		<option value="cooling">Cooling</option>
		<option value="electronics">Electronics</option>
		<option value="furniture">Furniture</option>
		
	</select><br/>
		<input id="submitbutton" name="submitbutton" type="submit" value="submit">
	</form>
	
	
	<p><a href="student.jsp">Student Page</a></p>
</body>
</html>