<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*"%>
<%@ page import="oracle.jdbc.pool.OracleDataSource"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%!	String id, reason, status, sql;
	int roomChangeRequestId;
%>
<%!	
	String error_msg = "";
	Connection conn;
	ResultSet rs; 
	Statement stmt; %>
<%
	id = request.getParameter("roomChangeRequestId").trim();
	roomChangeRequestId = Integer.parseInt(id);
	sql = "delete from room_change_request where room_change_request_id="+roomChangeRequestId;
	try{
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:mrm2198/coms4111@//w4111f.cs.columbia.edu:1521/ADB"); 
		conn = ods.getConnection();
		stmt = conn.createStatement();
		stmt.executeQuery(sql);
	} catch (SQLException e) {
		error_msg = e.getMessage();
		if( conn != null ) {
		conn.close();
		}
		}
	out.println("<font size=3 color=blue>deleting, please wait......</font><meta http-equiv='refresh' content='2;url=listRoomChange.jsp'>");
%>
</body>
</html>