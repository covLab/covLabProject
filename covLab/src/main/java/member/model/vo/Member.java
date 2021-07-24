package member.model.vo;

public class Member implements java.io.Serializable{
    private static final long serialVersionUID = 112L;
     
    private String userRn;
    private String userPw;
    private String userPhone;
    private int userNo;
    private String userName;
    private String userId;
    private String userGrade;
    private String userEmail;
    private String userAddress;
    private int subUserNo;
    private String smsAgr;
    private int inoCnt;
    
    public Member () {}

	public Member(String userRn, String userPw, String userPhone, int userNo, String userName, String userId,
			String userGrade, String userEmail, String userAddress, int subUserNo, String smsAgr, int inoCnt) {
		super();
		this.userRn = userRn;
		this.userPw = userPw;
		this.userPhone = userPhone;
		this.userNo = userNo;
		this.userName = userName;
		this.userId = userId;
		this.userGrade = userGrade;
		this.userEmail = userEmail;
		this.userAddress = userAddress;
		this.subUserNo = subUserNo;
		this.smsAgr = smsAgr;
		this.inoCnt = inoCnt;
	}

	public String getUserRn() {
		return userRn;
	}

	public void setUserRn(String userRn) {
		this.userRn = userRn;
	}

	public String getUserPw() {
		return userPw;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
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

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserGrade() {
		return userGrade;
	}

	public void setUserGrade(String userGrade) {
		this.userGrade = userGrade;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	public int getSubUserNo() {
		return subUserNo;
	}

	public void setSubUserNo(int subUserNo) {
		this.subUserNo = subUserNo;
	}

	public String getSmsAgr() {
		return smsAgr;
	}

	public void setSmsAgr(String smsAgr) {
		this.smsAgr = smsAgr;
	}

	public int getInoCnt() {
		return inoCnt;
	}

	public void setInoCnt(int inoCnt) {
		this.inoCnt = inoCnt;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Member [userRn=" + userRn + ", userPw=" + userPw + ", userPhone=" + userPhone + ", userNo=" + userNo
				+ ", userName=" + userName + ", userId=" + userId + ", userGrade=" + userGrade + ", userEmail="
				+ userEmail + ", userAddress=" + userAddress + ", subUserNo=" + subUserNo + ", smsAgr=" + smsAgr
				+ ", inoCnt=" + inoCnt + "]";
	}
    
    
}
