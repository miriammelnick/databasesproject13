<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:useBean id="editroomchange" class="cs4111.EditRoomChange" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Updating. Please wait.</title>
</head>
<body>
<%!	String id, reason, status, sql;
	int roomChangeRequestId;
%>
<%
	id = request.getParameter("roomChangeRequestId").trim();
	roomChangeRequestId = Integer.parseInt(id);
/* 	reason = request.getParameter("reason").trim(); */
	status = request.getParameter("status").trim();
	
	editroomchange.setRoomChangeRequestId(roomChangeRequestId);
/* 	editroomchange.setReason(reason); */
	editroomchange.setStatus(status);
	
	editroomchange.edit();
	out.println("<font size=3 color=blue>updating, please wait......</font><meta http-equiv='refresh' content='2;url=listRoomChange.jsp'>");
%>
</body>
</html>