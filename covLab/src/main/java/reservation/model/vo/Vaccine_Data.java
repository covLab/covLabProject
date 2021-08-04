package reservation.model.vo;

import java.sql.Date;
import java.sql.Timestamp;

public class Vaccine_Data {
	private static final long serialVersionUID = 154L;
	
	private String serial_num;
	private String reg_bus_no;
	private Timestamp rel_date;
	private int remain;
	private Date sell_by_date;
	public Vaccine_Data() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Vaccine_Data(String serial_num, String reg_bus_no, Timestamp rel_date, int remain, Date sell_by_date) {
		super();
		this.serial_num = serial_num;
		this.reg_bus_no = reg_bus_no;
		this.rel_date = rel_date;
		this.remain = remain;
		this.sell_by_date = sell_by_date;
	}
	public String getSerial_num() {
		return serial_num;
	}
	public void setSerial_num(String serial_num) {
		this.serial_num = serial_num;
	}
	public String getReg_bus_no() {
		return reg_bus_no;
	}
	public void setReg_bus_no(String reg_bus_no) {
		this.reg_bus_no = reg_bus_no;
	}
	public Timestamp getRel_date() {
		return rel_date;
	}
	public void setRel_date(Timestamp rel_date) {
		this.rel_date = rel_date;
	}
	public int getRemain() {
		return remain;
	}
	public void setRemain(int remain) {
		this.remain = remain;
	}
	public Date getSell_by_date() {
		return sell_by_date;
	}
	public void setSell_by_date(Date sell_by_date) {
		this.sell_by_date = sell_by_date;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
}
