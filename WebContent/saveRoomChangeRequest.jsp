<jsp:useBean id="room_change_request" class="cs4111.RoomChangeRequestData" scope="session"/>
<jsp:setProperty name="room_change_request" property="*"/> 
<jsp:useBean id="applies_for" class="cs4111.AppliesFor" scope="session"/>
<jsp:setProperty name="applies_for" property="*"/> 

<!-- This import is necessary for JDBC -->
<%@page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,java.util.*"  %>
<%@ page import="oracle.jdbc.pool.OracleDataSource"%>
<%@ page import="java.io.*,java.util.*,java.util.Date" %>
<%@ page import="javax.servlet.*,java.text.*" %>
<!-- Database lookup -->
<%!	String reason, roomChangeRequestId, studentId;
	int rcrid, sid; %>
<%
		Connection conn = null;
		String error_msg = "";
		String query = "", query2 = "";
		reason = request.getParameter("reason").trim();
		roomChangeRequestId = request.getParameter("roomChangeRequestId").trim();
		rcrid = Integer.parseInt(roomChangeRequestId);
		studentId = request.getParameter("student_id").trim();
		sid = Integer.parseInt(studentId);
		
		DateFormat df = new SimpleDateFormat("dd-MMM-yyyy");
		String formattedDate = df.format(new Date());
		try {
/* 			room_change_request.setReason(reason); 
			room_change_request.setRoomChangeRequestId(roomChangeRequestId); */
			OracleDataSource ods = new OracleDataSource();
			ods.setURL("jdbc:oracle:thin:mrm2198/coms4111@//w4111f.cs.columbia.edu:1521/ADB"); 
			conn = ods.getConnection();
			Statement stmt = conn.createStatement();
			query = "insert into room_change_request values (" + 
				rcrid + ",' " + 
				reason + "', '" + 
				"unresolved" + "')";
			query2 = "insert into applies_for values (" + sid + ", '" +
				formattedDate + "', " + rcrid + ")";
			//out.print("query: " + query + "<br/>" + "query2: " + query2 + "<br/>");
			stmt.executeUpdate(query);
			stmt.executeUpdate(query2);
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
	
		
		out.print("<meta http-equiv='refresh' content='2;url=confirmRoomChangeRequest.jsp'>");
	if( conn != null ) {
	conn.close();
	}
	%>
</body>
</html>