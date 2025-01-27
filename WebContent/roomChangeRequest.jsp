<jsp:useBean id="room_change_request" class="cs4111.RoomChangeRequestData" scope="session"/>
<jsp:useBean id="applies_for" class="cs4111.AppliesFor" scope="session"/>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- This import is necessary for JDBC -->
<%@ page import="java.sql.*"%>
<%-- <%@ page import="java.util.Random"%> --%>
<%@ page import="oracle.jdbc.pool.OracleDataSource"%>
<!-- Database lookup -->
<%
		Connection conn = null, conn2 = null;
		ResultSet rset = null, maxIdSet = null;
		String error_msg = "";
		int maxId, newPK;
		try {
			OracleDataSource ods = new OracleDataSource();
			ods.setURL("jdbc:oracle:thin:mrm2198/coms4111@//w4111f.cs.columbia.edu:1521/ADB"); 
			conn = ods.getConnection();
			Statement stmt = conn.createStatement();
			rset = stmt.executeQuery("select first_name, last_name, room_id, student_id from student");
			/* OracleDataSource ods2 = new OracleDataSource();
			ods2.setURL("jdbc:oracle:thin:mrm2198/coms4111@//w4111f.cs.columbia.edu:1521/ADB"); 
			conn2 = ods2.getConnection();
			Statement stmt2 = conn2.createStatement();
			String query = "select MAX(room_change_request_id) as max from room_change_request";
			
			maxIdSet = stmt2.executeQuery(query);
			maxIdSet.next();
			maxId = maxIdSet.getInt(1);

			newPK = maxId + 1; */
		} catch (SQLException e) {
			/* Random r = new Random();
			newPK = r.nextInt(10000) */;
			error_msg = e.getMessage();
			if( conn != null ) {
			conn.close();
			}
		}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>New Room Change Request</title>
<script type="text/javascript" src="validatious.js"></script>

</head>
<body>
	<H2>Submit a Room Change Request</H2>
	<form id="rcr-form" action="saveRoomChangeRequest.jsp" method="POST" class="validate">
		<b>Why are you requesting a room change? (required)</b>
		<br/>
		<textarea id="reason" name="reason" style="width:300px; height: 150px" class="required"></textarea>
		<br/>
 		Room Change Request ID: <input type="text" name="roomChangeRequestId" class="required numeric"></input><br/>
		<select style="width:300px " id="student_id" name="student_id">
	<%
	if(rset != null) {
	while(rset.next()) {
		out.print("<option value='"+ rset.getString("student_id") + "'> " +rset.getString("first_name") + " " +
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
<%-- 		<input type="hidden" name="roomChangeRequestId" value="<%=newPK %>"> --%>
		<input id="submitbutton" name="submitbutton" type="submit" value="submit">
	</form>
	
	
	
	<p><a href="student.jsp">Student Page</a></p>
</body>
</html>