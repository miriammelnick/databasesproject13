<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student Housing Home</title>
<script type="text/javascript" src="validatious.js"></script>
</head>
<body>
	<h2>Student Page</h2>
	<br/>
	<form id="search-form" action="search.jsp" method="POST" class="validate">
		<b>Search Employee Name</b>
		<br/>
		<input type="text" id="search" name="search" class="required alpha">
		<input type="submit" name="Submit" value="Search">
		<br/>
	</form>
	<br/>
	<p><a href="roomChangeRequest.jsp">Room Change Request</a></p>
	<p><a href="serviceAppointment.jsp">Apply for Service Appointment</a></p>
	<p><a href="newAppliance.jsp">Add an Appliance</a></p>
	<p><a href="lookUpStaff.jsp">Staff Directory</a></p>
	<p><a href="index.jsp">Log out</a></p>
</body>
</html>