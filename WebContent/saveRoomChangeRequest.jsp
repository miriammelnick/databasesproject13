<jsp:useBean id="room_change_request" class="cs4111.RoomChangeRequestData" scope="session"/>
<jsp:setProperty name="room_change_request" property="*"/> 

<!-- This import is necessary for JDBC -->
<%@ page import="java.sql.*"%>
<%@ page import="oracle.jdbc.pool.OracleDataSource"%>
<!-- Database lookup -->
<%
		Connection conn = null;
		ResultSet rset = null;
		String error_msg = "";
		String query = "";
		try {
			OracleDataSource ods = new OracleDataSource();
			ods.setURL("jdbc:oracle:thin:mrm2198/coms4111@//w4111f.cs.columbia.edu:1521/ADB"); 
			conn = ods.getConnection();
			Statement stmt = conn.createStatement();
			query = "insert into room_change_request values (" + 
				room_change_request.getRoomChangeRequestId() + ", " + 
				room_change_request.getReason() + ", " + 
				room_change_request.getStatus() + ")";
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
	
		out.print(room_change_request.getRoomChangeRequestId() + "<br/> " +
			room_change_request.getStatus() + "<br/> " +
			room_change_request.getReason());

	if( conn != null ) {
	conn.close();
	}
	%>
</body>
</html>