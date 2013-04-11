package cs4111;

public class HasAppliance {
    int roomId;
    String applianceName;
    String category; 
    
    public void setRoomId(int value) {
    	roomId = value ;
    }
    
    public void setApplianceName(String value) {
    	applianceName = value;
    }
    
    public void setCategory(String value) {
    	category = value;
    }
    
    public int getRoomId() {
    	return roomId;
    }
    
    public String getApplianceName() {
    	return applianceName;
    }
    
    public String getCategory() {
    	return category;
    }
}
