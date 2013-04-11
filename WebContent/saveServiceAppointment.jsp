<jsp:useBean id="sa" class="cs4111.ServiceAppointment" scope="session"/>
<jsp:setProperty name="sa" property="*"/> 

<!-- This import is necessary for JDBC -->
<%@page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,java.util.*"  %>
<%@ page import="oracle.jdbc.pool.OracleDataSource"%>
<!-- Database lookup -->
<%!	String reason, serviceAppointmentId, roomIdStr;
	int id, roomId; %>
<%
		Connection conn = null;
		ResultSet rset = null;
		String error_msg = "";
		String query = "";
		reason = request.getParameter("reason").trim();
		serviceAppointmentId = request.getParameter("appointmentId").trim();
		roomIdStr = request.getParameter("room_id");
		roomId = Integer.parseInt(roomIdStr);
		id = Integer.parseInt(serviceAppointmentId);
		try {
/* 			room_change_request.setReason(reason); 
			room_change_request.setRoomChangeRequestId(roomChangeRequestId); */
			OracleDataSource ods = new OracleDataSource();
			ods.setURL("jdbc:oracle:thin:mrm2198/coms4111@//w4111f.cs.columbia.edu:1521/ADB"); 
			conn = ods.getConnection();
			Statement stmt = conn.createStatement();
			query = "insert into service_appointment values (" + 
				id + ",' " + 
				reason + "')";
		//	out.print("query: " + query + "<br/>");
			stmt.executeUpdate(query);
			String query2 = "select appliance_name, category from has_appliance where room_id = " + roomId;
			rset = stmt.executeQuery(query2);
		} catch (SQLException e) {
			error_msg = e.getMessage();
			if( conn != null ) {
			conn.close();
			}
		}
%>
<html>
<body>
	
	<h3>Is this appointment about a broken appliance?</h3>
	<form id="appliance-appointment-form" action="addApplianceToAppointment.jsp" method="POST">
		<b>Which appliance is broken?</b>
		<br/>
		<select style="width:300px " id="appliance_name" name="appliance_name">
	<%
	if(rset != null) {
	while(rset.next()) {
		out.print("<option value='"+ rset.getString("appliance_name") + "'> " +rset.getString("appliance_name"));
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
	<a href="confirmServiceAppointment.jsp">My appointment is not related to an appliance.</a>
</body>
</html>