<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- This import is necessary for JDBC -->
<%@ page import="java.sql.*"%>
<%@ page import="oracle.jdbc.pool.OracleDataSource"%>
<!-- Database lookup -->

<%!String area, choice; %>
<%
		Connection conn = null;
		ResultSet rset = null;
		String error_msg = "";
/*  	  	area=request.getParameter("choice").trim();
 		buildingManager.setArea(area);  */
		//buildingManager.setArea(area); 
		try {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:mrm2198/coms4111@//w4111f.cs.columbia.edu:1521/ADB"); 
		conn = ods.getConnection();
		Statement stmt = conn.createStatement();
		rset = stmt.executeQuery("select first_name, last_name, email, phone from employee");
		} catch (SQLException e) {
		error_msg = e.getMessage();
		if( conn != null ) {
		conn.close();
		}
		}
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Staff Directory</title>
</head>
<body>
	<H2>Staff Contact Information</H2>
	<div id="all">
	<TABLE>
	<tr>
	<td>first_name</td><td>last_name</td><td>email</td><td>phone</td>
	</tr>
	<tr>
	<td><b>----------</b></td><td><b>----------</b></td><td><b>----------</b></td><td><b>----------</b></td>
	</tr>
	<%
	if(rset != null) {
	while(rset.next()) {
	out.print("<tr>");
	out.print("<td>" + rset.getString("first_name") + "</td><td>" + 
	rset.getString("last_name") + "</td>" +
	"<td>" + rset.getString("email") + "</td>"+
	"<td>" + rset.getString("phone") + "</td>");
	out.print("</tr>");
	}
	} else {
	out.print(error_msg);
	}
	if( conn != null ) {
	conn.close();
	}
	%>
	</TABLE>
	</div>
	<p>Select to see building managers</p>
<form name="form1" method="post" action="staff_select.jsp">
		<select name="choice" size="1">
          <option value="east campus" selected>East Campus Managers</option>
          <option value="west campus">West Campus Managers</option>
          <option value="on campus">On Campus Managers</option>
          <option value="other">Other Area Managers</option>
        </select>
        <input type="submit" name="Submit" value="View">
</form>

	<p><a href="student.jsp">Student Page</a></p>
</body>
</html>