package hospital.model.vo;

import java.sql.Date;
import java.sql.Timestamp;

public class ReservationInfo implements java.io.Serializable{

	private static final long serialVersionUID = 55L;
	//members
	private int userNo;
	private String userName;
	private String userRn;
	private String userGrade;
	private int inoCnt;
	//reservation
	private String serialNum;
	private String subOk;
	private Timestamp revDate;
	private Timestamp iocDate;
	private Timestamp canDate;
	private String state;
	//vaccine_data
	private String regBusNo;
	private String vacName;
	//hospital
	private String hpName;
	
	public ReservationInfo() {}


	public ReservationInfo(int userNo, String userName, String userRn, String userGrade, int inoCnt, String serialNum,
			String subOk, Timestamp revDate, Timestamp iocDate, Timestamp canDate, String state, String regBusNo, String vacName,
			String hpName) {
		super();
		this.userNo = userNo;
		this.userName = userName;
		this.userRn = userRn;
		this.userGrade = userGrade;
		this.inoCnt = inoCnt;
		this.serialNum = serialNum;
		this.subOk = subOk;
		this.revDate = revDate;
		this.iocDate = iocDate;
		this.canDate = canDate;
		this.state = state;
		this.regBusNo = regBusNo;
		this.vacName = vacName;
		this.hpName = hpName;
	}



	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserRn() {
		return userRn;
	}

	public void setUserRn(String userRn) {
		this.userRn = userRn;
	}

	public String getUserGrade() {
		return userGrade;
	}

	public void setUserGrade(String userGrade) {
		this.userGrade = userGrade;
	}

	public int getInoCnt() {
		return inoCnt;
	}

	public void setInoCnt(int inoCnt) {
		this.inoCnt = inoCnt;
	}

	public String getSerialNum() {
		return serialNum;
	}

	public void setSerialNum(String serialNum) {
		this.serialNum = serialNum;
	}

	public String getSubOk() {
		return subOk;
	}

	public void setSubOk(String subOk) {
		this.subOk = subOk;
	}

	public Timestamp getRevDate() {
		return revDate;
	}

	public void setRevDate(Timestamp revDate) {
		this.revDate = revDate;
	}

	public Timestamp getIocDate() {
		return iocDate;
	}

	public void setIocDate(Timestamp iocDate) {
		this.iocDate = iocDate;
	}

	public Timestamp getCanDate() {
		return canDate;
	}

	public void setCanDate(Timestamp canDate) {
		this.canDate = canDate;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getRegBusNo() {
		return regBusNo;
	}

	public void setRegBusNo(String regBusNo) {
		this.regBusNo = regBusNo;
	}

	public String getVacName() {
		return vacName;
	}

	public void setVacName(String vacName) {
		this.vacName = vacName;
	}

	public String getHpName() {
		return hpName;
	}

	public void setHpName(String hpName) {
		this.hpName = hpName;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "ReservationInfo [userNo=" + userNo + ", userName=" + userName + ", userRn=" + userRn + ", userGrade="
				+ userGrade + ", inoCnt=" + inoCnt + ", serialNum=" + serialNum + ", subOk=" + subOk + ", revDate="
				+ revDate + ", iocDate=" + iocDate + ", canDate=" + canDate + ", state=" + state + ", regBusNo="
				+ regBusNo + ", vacName=" + vacName + "]";
	}
	

}
