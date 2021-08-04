package reservation.model.vo;

public class VaccineData {
	private String reg_bus_no;
	private int remain ;
	
	public String getReg_bus_no() {
		return reg_bus_no;
	}
	public void setReg_bus_no(String reg_bus_no) {
		this.reg_bus_no = reg_bus_no;
	}
	public int getRemain() {
		return remain;
	}
	public void setRemain(int remain) {
		this.remain = remain;
	}
		
	public VaccineData(String reg_bus_no, int remain) {

		this.reg_bus_no=reg_bus_no;
		this.remain=remain;
	}
	
	public VaccineData() {
	}
}


