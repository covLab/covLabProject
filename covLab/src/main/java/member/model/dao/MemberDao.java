package member.model.dao;

import static common.JDBCTemp.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import member.model.vo.Member;
public class MemberDao {

	public int searchUser(Connection conn, String username, String userrn) {
        int idCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select count(user_id) from members where user_name = ? and user_rn = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, username);
			pstmt.setString(2, userrn);
			 
			rset =pstmt.executeQuery();
			if(rset.next()) {
				idCount = rset.getInt(1);
				
				System.out.println("idCount : " + idCount);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		   
		return idCount;
	}

	public Member selectLogin(Connection conn, String userid, String userpw) {
		Member member = null;
		PreparedStatement pstmt = null;
		ResultSet rset =null;
		
		String query = "select * from members where user_id = ? and user_pw = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, userid);
			pstmt.setString(2, userpw);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				member = new Member();
				
				member.setUserId(userid);
				member.setUserPw(userpw);
				member.setUserName(rset.getString("user_name"));
				member.setUserRn(rset.getString("user_rn"));
				member.setUserAddress(rset.getString("user_address"));
				member.setUserEmail(rset.getString("user_email"));
				member.setUserGrade(rset.getString("user_grade"));
				member.setUserNo(rset.getInt("user_no"));
				member.setUserPhone(rset.getString("user_phone"));
				member.setSubUserNo(rset.getInt("sub_user_no"));
				member.setInoCnt(rset.getInt("ino_cnt"));
				member.setSmsAgr(rset.getString("sms_agr"));
				
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		   
		return member;
	}

	public int insertMember(Connection conn, Member member) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query ="insert into members values ((select max(user_no) + 1 from members), default, ?, ?, ?, ?, ?, ?, ?, default, ?, default)";
	
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getUserId());
			pstmt.setString(2, member.getUserPw());
			pstmt.setString(3, member.getUserName());
			pstmt.setString(4, member.getUserRn());
			pstmt.setString(5, member.getUserEmail());
			pstmt.setString(6, member.getUserPhone());
			pstmt.setString(7, member.getUserAddress());
			pstmt.setString(8, member.getSmsAgr());
			
			result=pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}

	public int selectCheckId(Connection conn, String userid) {
		 int idCount = 0;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			
			String query = "select count(user_id) from members where user_id = ?";
			
			try {
				pstmt = conn.prepareStatement(query);
				
				pstmt.setString(1, userid);
			
				 
				rset =pstmt.executeQuery();
				if(rset.next()) {
					idCount = rset.getInt(1);
					
					System.out.println("idCount : " + idCount);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				close(rset);
				close(pstmt);
			}
			   
			return idCount;
		}

	public int selectCheckId2(Connection conn, String username, String userrn) {
		int idCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset =null;
		
		String query = "select count(user_id) from members where user_name = ? and user_rn = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, username);
			pstmt.setString(2, userrn);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				idCount = rset.getInt(1);
				
				System.out.println("idCount : " + idCount);
			}
	} catch (Exception e) {
		e.printStackTrace();
	}finally {
		close(rset);
		close(pstmt);
	}
	   
	return idCount;
}

	public String searchUserIdEmail(Connection conn , String useremail, String username) {
		
		String userid = null;
		PreparedStatement pstmt = null;
		ResultSet rset =null;
		
		String query = "select user_id from members where user_email = ? and user_name = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, useremail);
			pstmt.setString(2, username);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				
				userid = rset.getString("user_id");
				
				System.out.println("userid : " + userid);
			}
	} catch (Exception e) {
		e.printStackTrace();
	}finally {
		close(rset);
		close(pstmt);
	}
	   
	return userid;
}

	public String searchUserIdPhone(Connection conn, String userphone, String username) {
		String userid = null;
		PreparedStatement pstmt = null;
		ResultSet rset =null;
		
		String query = "select user_id from members where user_phone = ? and user_name = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, userphone);
			pstmt.setString(2, username);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				
				userid = rset.getString("user_id");
				
				System.out.println("userid : " + userid);
			}
	} catch (Exception e) {
		e.printStackTrace();
	}finally {
		close(rset);
		close(pstmt);
	}
	   
	return userid;

}

	public Member searchpwd(Connection conn, String userid, String useremail) {
		Member member = null;
		PreparedStatement pstmt = null;
		ResultSet rset =null;
		
		String query = "select * from members where user_id = ? and user_email = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, userid);
			pstmt.setString(2, useremail);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				member = new Member();
				
				member.setUserId(userid);
				member.setUserPw(useremail);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		   
		return member;
	}

	public int updatePw(Connection conn, String cryptoUserpw, String userid) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "update members set user_pw = ? where user_id = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, cryptoUserpw);
			pstmt.setString(2, userid);
		
			result= pstmt.executeUpdate();
			System.out.println("reuslt : " + result);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
	 
		return result;
	}

	public int updateTempPw(Connection conn, String cryptoUserpw, String userid, String useremail) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "update members set user_pw = ? where user_id = ? and user_email = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, cryptoUserpw);
			pstmt.setString(2, userid);
			pstmt.setString(3, useremail);
		
			result= pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
	 
		return result;
	}

	public int selectCheckpd(Connection conn, String curpd) {
		int reuslt = 0;
		PreparedStatement pstmt = null;
		ResultSet rset =null;
		
		String query = "select count(user_pw) from members where user_pw = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, curpd);
			
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				reuslt = rset.getInt(1);
				
				System.out.println("reuslt : " + reuslt);
			}
	} catch (Exception e) {
		e.printStackTrace();
	}finally {
		close(rset);
		close(pstmt);
	}
	   
	return reuslt;
	}
}
