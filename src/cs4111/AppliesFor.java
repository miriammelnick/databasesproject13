package cs4111;

public class AppliesFor {
    int studentId;
    int roomChangeRequestId;
    String applicationDate; 
    
    public void setStudentId(int value) {
    	studentId = value ;
    }
    
    public void setRoomChangeRequestId(int value) {
    	roomChangeRequestId = value;
    }
    
    public void setApplicationDate(String value) {
    	applicationDate = value;
    }
    
    public int getStudentId() {
    	return studentId;
    }
    
    public int getRoomChangeRequestId() {
    	return roomChangeRequestId;
    }
    
    public String getApplicationDate() {
    	return applicationDate;
    }
}
