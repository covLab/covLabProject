package member.model.dao;

import static common.JDBCTemp.*;

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
<<<<<<< Updated upstream
=======

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

	public int searchEmail(Connection conn, String useremail) {
		int idCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset =null;
		
		String query = "select count(user_email) from members where user_email = ? ";
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, useremail);
			
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

>>>>>>> Stashed changes
}
