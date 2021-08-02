package hospital.model.vo;

public class VaccineInfo implements java.io.Serializable{

	private static final long serialVersionUID = 44L;
	
	private String vacName;
	private String madeByCompany;
	private String madeInCountry;
	private int maxIocCount;
	private String expDur;
	
	public VaccineInfo() {}

	public VaccineInfo(String vacName, String madeByCompany, String madeInCountry, int maxIocCount, String expDur) {
		super();
		this.vacName = vacName;
		this.madeByCompany = madeByCompany;
		this.madeInCountry = madeInCountry;
		this.maxIocCount = maxIocCount;
		this.expDur = expDur;
	}

	public String getVacName() {
		return vacName;
	}

	public void setVacName(String vacName) {
		this.vacName = vacName;
	}

	public String getMadeByCompany() {
		return madeByCompany;
	}

	public void setMadeByCompany(String madeByCompany) {
		this.madeByCompany = madeByCompany;
	}

	public String getMadeInCountry() {
		return madeInCountry;
	}

	public void setMadeInCountry(String madeInCountry) {
		this.madeInCountry = madeInCountry;
	}

	public int getMaxIocCount() {
		return maxIocCount;
	}

	public void setMaxIocCount(int maxIocCount) {
		this.maxIocCount = maxIocCount;
	}

	public String getExpDur() {
		return expDur;
	}

	public void setExpDur(String expDur) {
		this.expDur = expDur;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "VaccineInfo [vacName=" + vacName + ", madeByCompany=" + madeByCompany + ", madeInCountry="
				+ madeInCountry + ", maxIocCount=" + maxIocCount + ", expDur=" + expDur + "]";
	}
	
	

}
