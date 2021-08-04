package reservation.model.vo;

public class Hospital implements java.io.Serializable{
	private static final long serialVersionUID = 150L;
	
	private String reg_bus_no;
	private String hp_name;
	private String hp_address;
	private String hp_phone;
	private float hp_latitude;
	private float hp_longitude;
	private int remain;
	
	public int getRemain() {
		return remain;
	}
	public void setRemain(int remain) {
		this.remain = remain;
	}
	public String getReg_bus_no() {
		return reg_bus_no;
	}
	public void setReg_bus_no(String reg_bus_no) {
		this.reg_bus_no = reg_bus_no;
	}
	public String getHp_name() {
		return hp_name;
	}
	public void setHp_name(String hp_name) {
		this.hp_name = hp_name;
	}
	public String getHp_address() {
		return hp_address;
	}
	public void setHp_address(String hp_address) {
		this.hp_address = hp_address;
	}
	public String getHp_phone() {
		return hp_phone;
	}
	public void setHp_phone(String hp_phone) {
		this.hp_phone = hp_phone;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public float getHp_latitude() {
		return hp_latitude;
	}
	public void setHp_latitude(float hp_latitude) {
		this.hp_latitude = hp_latitude;
	}
	public float getHp_longitude() {
		return hp_longitude;
	}
	public void setHp_longitude(float hp_longitude) {
		this.hp_longitude = hp_longitude;
	}
	public Hospital(String reg_bus_no, String hp_name, String hp_address, String hp_phone, float hp_latitude, float hp_longitude) {
		super();
		this.reg_bus_no = reg_bus_no;
		this.hp_name = hp_name;
		this.hp_address = hp_address;
		this.hp_phone = hp_phone;
		this.hp_latitude=hp_latitude;
		this.hp_longitude=hp_longitude;
	}
	public Hospital() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
