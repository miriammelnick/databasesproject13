package cs4111;

public class ServiceAppointment {
	String reason;
    int appointmentId;
    
    public void setReason(String value) {
    	reason = value ;
    }
    
    public void setAppointmentId(int value) {
    	appointmentId = value;
    }
    
    public String getReason() {
    	return reason;
    }
    
    public int getAppointmentId() {
    	return appointmentId;
    }
}
