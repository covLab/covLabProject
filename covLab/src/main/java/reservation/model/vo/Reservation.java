package reservation.model.vo;

import java.sql.Timestamp;

public class Reservation implements java.io.Serializable{
	private static final long serialVersionUID = 151L;
	
	private String serial_num;
	private String sub_ok;
	private String user_rn;
	private String reg_bus_no;
	private java.sql.Timestamp rev_date;
	private Timestamp ioc_date;
	private Timestamp can_date;
	private String state;
	public Reservation() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Reservation(String serial_num, String sub_ok, String user_rn, String reg_bus_no, Timestamp rev_date,
			Timestamp ioc_date, Timestamp can_date, String state) {
		super();
		this.serial_num = serial_num;
		this.sub_ok = sub_ok;
		this.user_rn = user_rn;
		this.reg_bus_no = reg_bus_no;
		this.rev_date = rev_date;
		this.ioc_date = ioc_date;
		this.can_date = can_date;
		this.state = state;
	}
	public String getSerial_num() {
		return serial_num;
	}
	public void setSerial_num(String serial_num) {
		this.serial_num = serial_num;
	}
	public String getSub_ok() {
		return sub_ok;
	}
	public void setSub_ok(String sub_ok) {
		this.sub_ok = sub_ok;
	}
	public String getUser_rn() {
		return user_rn;
	}
	public void setUser_rn(String user_rn) {
		this.user_rn = user_rn;
	}
	public String getReg_bus_no() {
		return reg_bus_no;
	}
	public void setReg_bus_no(String reg_bus_no) {
		this.reg_bus_no = reg_bus_no;
	}
	public java.sql.Timestamp getRev_date() {
		return rev_date;
	}
	public void setRev_date(java.sql.Timestamp rev_date) {
		this.rev_date = rev_date;
	}
	public Timestamp getIoc_date() {
		return ioc_date;
	}
	public void setIoc_date(Timestamp ioc_date) {
		this.ioc_date = ioc_date;
	}
	public Timestamp getCan_date() {
		return can_date;
	}
	public void setCan_date(Timestamp can_date) {
		this.can_date = can_date;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
}
