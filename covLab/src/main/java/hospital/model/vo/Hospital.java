package hospital.model.vo;

public class Hospital implements java.io.Serializable{

	private static final long serialVersionUID = 33L;
	
	private String regBusNo;
	private String hpName;
	private String hpAddress;
	private String hpPhone;
	private float hpLatitude;
	private float hpLongitude;

	public Hospital() {}

	public Hospital(String regBusNo, String hpName, String hpAddress, String hpPhone, float hpLatitude,
			float hpLongitude) {
		super();
		this.regBusNo = regBusNo;
		this.hpName = hpName;
		this.hpAddress = hpAddress;
		this.hpPhone = hpPhone;
		this.hpLatitude = hpLatitude;
		this.hpLongitude = hpLongitude;
	}

	public String getRegBusNo() {
		return regBusNo;
	}

	public void setRegBusNo(String regBusNo) {
		this.regBusNo = regBusNo;
	}

	public String getHpName() {
		return hpName;
	}

	public void setHpName(String hpName) {
		this.hpName = hpName;
	}

	public String getHpAddress() {
		return hpAddress;
	}

	public void setHpAddress(String hpAddress) {
		this.hpAddress = hpAddress;
	}

	public String getHpPhone() {
		return hpPhone;
	}

	public void setHpPhone(String hpPhone) {
		this.hpPhone = hpPhone;
	}

	public float getHpLatitude() {
		return hpLatitude;
	}

	public void setHpLatitude(float hpLatitude) {
		this.hpLatitude = hpLatitude;
	}

	public float getHpLongitude() {
		return hpLongitude;
	}

	public void setHpLongitude(float hpLongitude) {
		this.hpLongitude = hpLongitude;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Hospital [regBusNo=" + regBusNo + ", hpName=" + hpName + ", hpAddress=" + hpAddress + ", hpPhone="
				+ hpPhone + ", hpLatitude=" + hpLatitude + ", hpLongitude=" + hpLongitude + "]";
	};
	
	

}
