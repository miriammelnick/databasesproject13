<jsp:useBean id="sa" class="cs4111.ServiceAppointment" scope="session"/> 
<html>
<body>
	<b>Thank you. We have received your request and will get back to you shortly.</b><br/>


	Room Change Request Id: <%= sa.getAppointmentId() %><br/>
	Reason: <%= sa.getReason() %><br/>
	
		<p><a href="student.jsp">Student Page</a></p>
	
</body>
</html>
