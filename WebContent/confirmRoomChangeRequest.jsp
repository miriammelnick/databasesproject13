<jsp:useBean id="room_change_request" class="cs4111.RoomChangeRequestData" scope="session"/> 
<html>
<body>
	<b>Thank you. We have received your request and will get back to you shortly.</b><br/>


	Room Change Request Id: <%= room_change_request.getRoomChangeRequestId() %><br/>
	Reason: <%= room_change_request.getReason() %><br/>
	Status: <%= room_change_request.getStatus() %><br/>
	
		<p><a href="student.jsp">Student Page</a></p>
	
</body>
</html>
