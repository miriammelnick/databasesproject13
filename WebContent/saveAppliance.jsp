<jsp:useBean id="appliance" class="cs4111.HasAppliance" scope="session"/>
<jsp:setProperty name="appliance" property="*"/> 

<!-- This import is necessary for JDBC -->
<%@page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,java.util.*"  %>
<%@ page import="oracle.jdbc.pool.OracleDataSource"%>
<!-- Database lookup -->
<%!	String roomIdStr, category, applianceName;
	int roomId; %>
<%
		Connection conn = null;
		ResultSet rset = null;
		String error_msg = "";
		String query = "";
		category = request.getParameter("category").trim();
		applianceName = request.getParameter("appliance_name").trim();
		roomIdStr = request.getParameter("room_id").trim();
		roomId = Integer.parseInt(roomIdStr);
		try {
/* 			room_change_request.setReason(reason); 
			room_change_request.setRoomChangeRequestId(roomChangeRequestId); */
			OracleDataSource ods = new OracleDataSource();
			ods.setURL("jdbc:oracle:thin:mrm2198/coms4111@//w4111f.cs.columbia.edu:1521/ADB"); 
			conn = ods.getConnection();
			Statement stmt = conn.createStatement();
			query = "insert into has_appliance values ('" + 
				applianceName + "', '" + category + "'," +  
				roomId + ")";
	//		out.print("query: " + query + "<br/>");
			stmt.executeUpdate(query);
		} catch (SQLException e) {
			error_msg = e.getMessage();
			if( conn != null ) {
			conn.close();
			}
		}
%>
<html>
<body>


	<a href="appliance.jsp">Continue</a>
		<%
	
		out.print("room Id: " + roomId + "<br/> appliance name: " + applianceName + 
				"<br/> category: " + category + "<br/>");

	if( conn != null ) {
	conn.close();
	}
	%>
</body>
</html>