package reservation.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Vaccine implements Serializable {
	private static final long serialVersionUID = 102L;
	
	private String serial_num;
	private String vac_name;
	private Date product_date;
	public Vaccine() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Vaccine(String serial_num, String vac_name, Date product_date) {
		super();
		this.serial_num = serial_num;
		this.vac_name = vac_name;
		this.product_date = product_date;
	}
	public String getSerial_num() {
		return serial_num;
	}
	public void setSerial_num(String serial_num) {
		this.serial_num = serial_num;
	}
	public String getVac_name() {
		return vac_name;
	}
	public void setVac_name(String vac_name) {
		this.vac_name = vac_name;
	}
	public Date getProduct_date() {
		return product_date;
	}
	public void setProduct_date(Date product_date) {
		this.product_date = product_date;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	
}
