package cs4111;

public class SendsRequest {
    int studentId;
    int appointmentId;
    String requestDate; 
    
    public void setStudentId(int value) {
    	studentId = value ;
    }
    
    public void setAppointmentId(int value) {
    	appointmentId = value;
    }
    
    public void setRequestDate(String value) {
    	requestDate = value;
    }
    
    public int getStudentId() {
    	return studentId;
    }
    
    public int getAppointmentId() {
    	return appointmentId;
    }
    
    public String getRequestDate() {
    	return requestDate;
    }
}
