package db;

public class RoomChange {
	private int id;
	private String reason;
	private String status;
	
	public RoomChange(int id, String reason, String status) {
		super();
		this.id = id;
		this.reason = reason;
		this.status = status;
	}

	public RoomChange() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}

