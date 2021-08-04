package member.model.vo;

public class Profile {
	private static final long serialVersionUID = 115L;
	
	private String userPw;
    private String userPhone;
    private String userName;
    private String userId;
   private String userAddress;
   private String userGrade;
   private int userNo;
private String userEmail;
   private int subUserNo;
   private String smsAgr;
   private int inoCnt;
   private java.sql.Timestamp rev_date;
   private String vac_name;
   private String hp_name;
     	private String userRn;
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
		public String getUserAddress() {
			return userAddress;
		}
		public void setUserAddress(String userAddress) {
			this.userAddress = userAddress;
		}
		public java.sql.Timestamp getRev_date() {
			return rev_date;
		}
		public void setRev_date(java.sql.Timestamp rev_date) {
			this.rev_date = rev_date;
		}
		public String getVac_name() {
			return vac_name;
		}
		public void setVac_name(String vac_name) {
			this.vac_name = vac_name;
		}
		public String getHp_name() {
			return hp_name;
		}
		public void setHp_name(String hp_name) {
			this.hp_name = hp_name;
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
		public int getUserNo() {
			return userNo;
		}
		public void setUserNo(int userNo) {
			this.userNo = userNo;
		}
		
}



