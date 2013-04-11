<jsp:useBean id="sa" class="cs4111.ServiceAppointment" scope="session"/> 
<html>
<body>
	Thank you. We have received your request and will get back to you shortly.<br/>


	Room Change Request Id: <%= sa.getAppointmentId() %><br/>
	Reason: <%= sa.getReason() %><br/>
	
</body>
</html>
