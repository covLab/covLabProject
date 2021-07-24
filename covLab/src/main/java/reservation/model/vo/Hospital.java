package reservation.model.vo;

public class Hospital implements java.io.Serializable{
	private static final long serialVersionUID = 100L;
	
	private String reg_bus_no;
	private String hp_name;
	private String hp_address;
	private String hp_phone;
	
	
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
	
	
	public Hospital(String reg_bus_no, String hp_name, String hp_address, String hp_phone) {
		super();
		this.reg_bus_no = reg_bus_no;
		this.hp_name = hp_name;
		this.hp_address = hp_address;
		this.hp_phone = hp_phone;
	}
	public Hospital() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
