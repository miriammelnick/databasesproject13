package cs4111;

public class NeedsFixing {
    int roomId;
    String applianceName;
    int appointmentId; 
    
    public void setRoomId(int value) {
    	roomId = value ;
    }
    
    public void setApplianceName(String value) {
    	applianceName = value;
    }
    
    public void setAppointmentId(int value) {
    	appointmentId = value;
    }
    
    public int getRoomId() {
    	return roomId;
    }
    
    public String getApplianceName() {
    	return applianceName;
    }

    public int getAppointmentId() {
    	return appointmentId;
    }
}
