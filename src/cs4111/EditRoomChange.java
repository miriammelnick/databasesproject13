package cs4111;

import 
import javax.swing.JOptionPane;


public class EditRoomChange {
	String reason;
    String status = "unresolved";
    int roomChangeRequestId;
    
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
    
}
