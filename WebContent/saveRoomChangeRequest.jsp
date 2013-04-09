<jsp:useBean id="room_change_request" class="cs4111.RoomChangeRequestData" scope="session"/>
<jsp:setProperty name="room_change_request" property="*"/> 

<!-- This import is necessary for JDBC -->
<%@page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,java.util.*"  %>
<%@ page import="oracle.jdbc.pool.OracleDataSource"%>
<!-- Database lookup -->
<%!	String reason, roomChangeRequestId;
	int id; %>
<%
		Connection conn = null;
		ResultSet rset = null;
		String error_msg = "";
		String query = "";
		reason = request.getParameter("reason").trim();
		roomChangeRequestId = request.getParameter("roomChangeRequestId").trim();
		id = Integer.parseInt(roomChangeRequestId);
		try {
/* 			room_change_request.setReason(reason); 
			room_change_request.setRoomChangeRequestId(roomChangeRequestId); */
			OracleDataSource ods = new OracleDataSource();
			ods.setURL("jdbc:oracle:thin:mrm2198/coms4111@//w4111f.cs.columbia.edu:1521/ADB"); 
			conn = ods.getConnection();
			Statement stmt = conn.createStatement();
			query = "insert into room_change_request values (" + 
				id + ",' " + 
				reason + "', '" + 
				"unresolved" + "')";
			out.print("query: " + query + "<br/>");
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
	<a href="confirmRoomChangeRequest.jsp">Continue</a>
		<%
	
		out.print(id + "<br/> " +
			"unsolved" + "<br/> " +
			reason);

	if( conn != null ) {
	conn.close();
	}
	%>
</body>
</html>