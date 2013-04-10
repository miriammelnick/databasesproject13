<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*"%>
<%@ page import="oracle.jdbc.pool.OracleDataSource"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Room Request Status</title>
</head>
<body>
<div align="left"><font color="#000000" size="5">Edit Room Request Status</font> </div>
<%!	String roomChangeRequestId, reason, status, sql;
	int id;
	String error_msg = "";
	Connection conn;
	ResultSet rs; 
	Statement stmt; %>
<%
	roomChangeRequestId=request.getParameter("roomChangeRequestId").trim();
	id = Integer.parseInt(roomChangeRequestId);
	try{
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:mrm2198/coms4111@//w4111f.cs.columbia.edu:1521/ADB"); 
		conn = ods.getConnection();
		stmt = conn.createStatement();
		sql = "select * from room_change_request where room_change_request_id=" + id;
		rs=stmt.executeQuery(sql);
		while(rs.next()){
%>
<form name="form1" method="post" action="edit_query.jsp?roomChangeRequestId=<%=id%>">
  <table width="35%" border="1" cellspacing="1" cellpadding="1" align="left">
    <tr> 
      <td width="46%" align="left">Room Change Request ID</td>
      <td width="54%"> &nbsp;&nbsp;&nbsp;<%=rs.getObject(1)%></td>
    </tr>
    <tr> 
      <td width="46%" align="left">Reason</td>
      <td width="54%"> &nbsp;&nbsp;&nbsp;<%=rs.getObject(2)%></td>
    </tr>
    <tr> 
      <td width="46%" align="left">Status</td>
      <td width="54%">&nbsp;&nbsp;
<%
	  status=rs.getString(3).trim();
	  if(status.equals("resolved")){
%>
		<select name="status" size="1">
          <option value="resolved" selected>resolved</option>
          <option value="unresolved">unresolved</option>
        </select>
<%
	  }
	  else{
%>
		<select name="status" size="1">
          <option value="resolved" >resolved</option>
          <option value="unresolved" selected>unresolved</option>
        </select>
<%
	  }
%>
		</td>
    <tr align="left"> 
      <td colspan="2" align="left"> 
        <input type="submit" name="Submit" value="submit">&nbsp;&nbsp;&nbsp; 
        <input type="reset" name="reset" value="reset">
      </td>
    </tr>
   </table>
 </form>
 
 <%
		}
		rs.close();
		stmt.close();
		conn.close();
	}
		catch (SQLException e) {
			error_msg = e.getMessage();
			if( conn != null ) {
			conn.close();
			}
		}
 %>
</body>
</html>