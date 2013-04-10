package cs4111;

import java.sql.*;
import oracle.jdbc.pool.OracleDataSource;
import javax.swing.JOptionPane;

public class EditRoomChange {
	private String reason;
    private String status = "unresolved";
    private int roomChangeRequestId;

	private String sql;
	private Statement stmt;
	private Connection conn;
    
    public void setReason(String value) {
    	reason = value ;
    }
    
    public void setStatus(String value) {
    	status = value;
    }
    
    public void setRoomChangeRequestId(int value) {
    	roomChangeRequestId = value;
    }
    
    public String getReason() {
    	return reason;
    }
    
    public String getStatus() {
    	return status;
    }
    
    public int getRoomChangeRequestId() {
    	return roomChangeRequestId;
    }
    
	public String getSql() {
		return sql;
	}

	public void setSql(String sql) {
		this.sql = sql;
	}

	public Statement getStmt() {
		return stmt;
	}

	public void setStmt(Statement stmt) {
		this.stmt = stmt;
	}

	public Connection getConn() {
		return conn;
	}

	public void setConn(Connection conn) {
		this.conn = conn;
	}

	public void edit() {
		try{
			OracleDataSource ods = new OracleDataSource();
			ods.setURL("jdbc:oracle:thin:mrm2198/coms4111@//w4111f.cs.columbia.edu:1521/ADB"); 
			conn = ods.getConnection();
			Statement stmt = conn.createStatement();
			sql = "update room_change_request set status='" + status + "' where room_change_request_id='" + roomChangeRequestId+"'";
			stmt.executeUpdate(sql);
			stmt.close();
			conn.close();
		} catch(Exception e){
			JOptionPane.showMessageDialog(null, "error!");
		}
	}
}
