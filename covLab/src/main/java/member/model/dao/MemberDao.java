package member.model.dao;

import static common.JDBCTemp.close;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.sql.Statement;

import java.util.ArrayList;

import board.model.vo.Board;
import member.model.vo.Member;
import member.model.vo.Profile;
import reservation.model.vo.Hospital;
import reservation.model.vo.Reservation;
import reservation.model.vo.Vaccine;
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
		
		String query = "select * from members where user_id = ? and user_pw = ? ";
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

//	public int selectCheckpd(Connection conn, String curpd) {
//		int reuslt = 0;
//		PreparedStatement pstmt = null;
//		ResultSet rset =null;
//		
//		String query = "select count(user_pw) from members where user_pw = ?";
//		
//		try {
//			pstmt = conn.prepareStatement(query);
//			
//			pstmt.setString(1, curpd);
//			
//			
//			rset = pstmt.executeQuery();
//			if(rset.next()) {
//				reuslt = rset.getInt(1);
//				
//				System.out.println("reuslt : " + reuslt);
//			}
//	} catch (Exception e) {
//		e.printStackTrace();
//	}finally {
//		close(rset);
//		close(pstmt);
//	}
//	   
//	return reuslt;
//	}

	public int updateMember(Connection conn, Member member) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "update members set user_pw = ?, user_email = ?, user_phone = ?, user_address = ? where user_id = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			;
			pstmt.setString(1, member.getUserPw());
			pstmt.setString(2, member.getUserEmail());
			pstmt.setString(3, member.getUserPhone());
			pstmt.setString(4, member.getUserAddress());
			pstmt.setString(5, member.getUserId());
	
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int searchUseri(Connection conn, String userid, String userpwd) {
		int idCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset =null;
		
		String query = "select count(user_id) from members where user_id = ? and user_pw = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, userid);
			pstmt.setString(2, userpwd);
			
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

	public int deleteMember(Connection conn, String userid, String cryptoUserpwd) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "delete from members where user_id = ? and user_pw = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userid);			
			pstmt.setString(2, cryptoUserpwd);
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}


	// 회원 전체 목록 조회
	public ArrayList<Member> selectList(Connection conn, int startRow, int endRow) {
		ArrayList<Member> list = new ArrayList<Member>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from  "
				+ "(select rownum rnum, user_no, sub_user_no, user_id, user_pw, user_name, user_rn, user_email, user_phone, user_address, user_grade, sms_agr, ino_cnt "
				+ "from "
				+ "(select * from members "
				+ "start with sub_user_no is null "
				+ "connect by sub_user_no = prior user_no)) "
				+ "where rnum between ? and ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Member member = new Member();
				
				member.setUserNo(rset.getInt("user_no"));
				member.setSubUserNo(rset.getInt("sub_user_no"));
				member.setUserId(rset.getString("user_id"));
				member.setUserPw(rset.getString("user_pw"));
				member.setUserName(rset.getString("user_name"));
				member.setUserRn(rset.getString("user_rn"));
				member.setUserEmail(rset.getString("user_email"));
				member.setUserPhone(rset.getString("user_phone"));
				member.setUserAddress(rset.getString("user_address"));
				member.setUserGrade(rset.getString("user_grade"));
				member.setSmsAgr(rset.getString("sms_agr"));
				member.setInoCnt(rset.getInt("ino_cnt"));
				
				list.add(member);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}

	// 회원 전체 카운트
	public int getListCount(Connection conn) {
		int listCount = 0;
		Statement stmt = null;
		ResultSet rset = null;

		String query = "select count(*) from members";

		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);

			if (rset.next()) {
				listCount = rset.getInt(1); // select 절의 첫번째 항목
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}

		return listCount;
	}

	public ArrayList<Member> selectSearchUserNo(Connection conn, int startRow, int endRow, String keyword) {
		ArrayList<Member> list = new ArrayList<Member>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from "
				+ "(select rownum rnum, user_no, sub_user_no, user_id, user_pw, user_name, user_rn, user_email, user_phone, user_address, user_grade, sms_agr, ino_cnt "
				+ "from "
				+ "(select * from members "
				+ "start with user_no like ?"
				+ "connect by sub_user_no = prior user_no)) "
				+ "where rnum between ? and ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, keyword);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Member member = new Member();
				
				// 컬럼 값 꺼내서 필드에 옮겨 기록하기 : 결과 매핑
				member.setUserNo(rset.getInt("user_no"));
				member.setSubUserNo(rset.getInt("sub_user_no"));
				member.setUserId(rset.getString("user_id"));
				member.setUserPw(rset.getString("user_pw"));
				member.setUserName(rset.getString("user_name"));
				member.setUserRn(rset.getString("user_rn"));
				member.setUserEmail(rset.getString("user_email"));
				member.setUserPhone(rset.getString("user_phone"));
				member.setUserAddress(rset.getString("user_address"));
				member.setUserGrade(rset.getString("user_grade"));
				member.setSmsAgr(rset.getString("sms_agr"));
				member.setInoCnt(rset.getInt("ino_cnt"));
								
				list.add(member);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public ArrayList<Member> selectSearchUserName(Connection conn, int startRow, int endRow, String keyword) {
		ArrayList<Member> list = new ArrayList<Member>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from "
				+ "(select rownum rnum, user_no, sub_user_no, user_id, user_pw, user_name, user_rn, user_email, user_phone, user_address, user_grade, sms_agr, ino_cnt "
				+ "from "
				+ "(select * from members "
				+ "start with user_name like ?"
				+ "connect by sub_user_no = prior user_no)) "
				+ "where rnum between ? and ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%"+keyword+"%");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Member member = new Member();
				
				// 컬럼 값 꺼내서 필드에 옮겨 기록하기 : 결과 매핑
				member.setUserNo(rset.getInt("user_no"));
				member.setSubUserNo(rset.getInt("sub_user_no"));
				member.setUserId(rset.getString("user_id"));
				member.setUserPw(rset.getString("user_pw"));
				member.setUserName(rset.getString("user_name"));
				member.setUserRn(rset.getString("user_rn"));
				member.setUserEmail(rset.getString("user_email"));
				member.setUserPhone(rset.getString("user_phone"));
				member.setUserAddress(rset.getString("user_address"));
				member.setUserGrade(rset.getString("user_grade"));
				member.setSmsAgr(rset.getString("sms_agr"));
				member.setInoCnt(rset.getInt("ino_cnt"));
								
				list.add(member);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public ArrayList<Member> selectSearchGender(Connection conn, int startRow, int endRow, String keyword) {
		ArrayList<Member> list = new ArrayList<Member>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from  "
				+ "(select rownum rnum, user_no, sub_user_no, user_id, user_pw, user_name, user_rn, user_email, user_phone, user_address, user_grade, sms_agr, ino_cnt "
				+ "from "
				+ "(select * from members "
				+ "where mod(substr(user_rn, 8, 1), 2) = ?)) "
				+ "where rnum between ? and ?";
		int gender =0;
		if(keyword.equals("M")) {
			gender = 1;
		}else if(keyword.equals("F")) {
			gender = 0;
		}
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, gender);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Member member = new Member();
				
				member.setUserNo(rset.getInt("user_no"));
				member.setSubUserNo(rset.getInt("sub_user_no"));
				member.setUserId(rset.getString("user_id"));
				member.setUserPw(rset.getString("user_pw"));
				member.setUserName(rset.getString("user_name"));
				member.setUserRn(rset.getString("user_rn"));
				member.setUserEmail(rset.getString("user_email"));
				member.setUserPhone(rset.getString("user_phone"));
				member.setUserAddress(rset.getString("user_address"));
				member.setUserGrade(rset.getString("user_grade"));
				member.setSmsAgr(rset.getString("sms_agr"));
				member.setInoCnt(rset.getInt("ino_cnt"));
								
				list.add(member);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public ArrayList<Member> selectSearchAge(Connection conn, int startRow, int endRow, int keyword) {
		ArrayList<Member> list = new ArrayList<Member>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from "
				+ "(select  rownum rnum , 나이, user_no, sub_user_no, user_id, user_pw, user_name, user_rn, user_email, user_phone, user_address, user_grade, sms_agr, ino_cnt "
				+ "from "
				+ "(select extract(year from sysdate) - extract(year from to_date(substr(user_rn, 1, 2), 'RR')) 나이, "
				+ "user_no, sub_user_no, user_id, user_pw, user_name, user_rn, user_email, user_phone, user_address, user_grade, sms_agr, ino_cnt "
				+ "from members "
				+ "order by 1 desc) ";
		System.out.println("keyword in dao : "+keyword);
		if(keyword == 60) {
			query +="where 나이 >= ? ) "
					+ "where rnum between ? and ?";
		}else {
			query +="where 나이 between ? and ?) "
					+ "where rnum between ? and ?";
		}
		try {
			pstmt = conn.prepareStatement(query);
			if(keyword == 60) {
				pstmt.setInt(1, keyword);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
			}else {
				pstmt.setInt(1, keyword);
				pstmt.setInt(2, keyword+9);
				pstmt.setInt(3, startRow);
				pstmt.setInt(4, endRow);
			}

			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Member member = new Member();
				
				member.setUserNo(rset.getInt("user_no"));
				member.setSubUserNo(rset.getInt("sub_user_no"));
				member.setUserId(rset.getString("user_id"));
				member.setUserPw(rset.getString("user_pw"));
				member.setUserName(rset.getString("user_name"));
				member.setUserRn(rset.getString("user_rn"));
				member.setUserEmail(rset.getString("user_email"));
				member.setUserPhone(rset.getString("user_phone"));
				member.setUserAddress(rset.getString("user_address"));
				member.setUserGrade(rset.getString("user_grade"));
				member.setSmsAgr(rset.getString("sms_agr"));
				member.setInoCnt(rset.getInt("ino_cnt"));
								
				list.add(member);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}


	public ArrayList<Member> selectSearchLoginType(Connection conn, int startRow, int endRow, String keyword) {
		ArrayList<Member> list = new ArrayList<Member>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from "
				+ "(select rownum rnum, user_no, sub_user_no, user_id, user_pw, user_name, user_rn, user_email, user_phone, user_address, user_grade, sms_agr, ino_cnt "
				+ "from "
				+ "(select * from members "
				+ "start with sub_user_no is null "
				+ "connect by sub_user_no = prior user_no) "
				+ "where user_grade= ?) "
				+ "where rnum between ? and ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, keyword);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Member member = new Member();
				
				member.setUserNo(rset.getInt("user_no"));
				member.setSubUserNo(rset.getInt("sub_user_no"));
				member.setUserId(rset.getString("user_id"));
				member.setUserPw(rset.getString("user_pw"));
				member.setUserName(rset.getString("user_name"));
				member.setUserRn(rset.getString("user_rn"));
				member.setUserEmail(rset.getString("user_email"));
				member.setUserPhone(rset.getString("user_phone"));
				member.setUserAddress(rset.getString("user_address"));
				member.setUserGrade(rset.getString("user_grade"));
				member.setSmsAgr(rset.getString("sms_agr"));
				member.setInoCnt(rset.getInt("ino_cnt"));
								
				list.add(member);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int getSearchListCount(Connection conn, String action, String keyword) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		int uno = 0; 
		String query = "";
		
		switch (action) {
		case "no":
			query = "select count(*) from members "
					+ "start with user_no like ? "
					+ "connect by sub_user_no = prior user_no";
			uno = Integer.parseInt(keyword);
			break;
		case "name":
			query = "select count(*) from members "
					+ "start with user_name like ? "
					+ "connect by sub_user_no = prior user_no";
			break;
		case "gender":
			query = "select count(*) from members  "
					+ "where mod(substr(user_rn, 8, 1), 2) = ?";
			if(keyword.equals("M")) {
				uno = 1;
			}else if(keyword.equals("F")){
				uno = 0;
			}		
			System.out.println("uno : "+uno);
			break;
		case "age":
			query = "select count(*) from  "
					+ "(select extract(year from sysdate) - extract(year from to_date(substr(user_rn, 1, 2), 'RR')) 나이, "
					+ "user_no, sub_user_no, user_id, user_pw, user_name, rpad(substr(user_rn, 1, 8), 14, '*') user_rn, user_email, user_phone, user_address, user_grade, sms_agr, ino_cnt "
					+ "from members) "
					+ "where 나이 between ? and ?";
			break;

		case "logintype":
			query = "select count(*) from members "
					+ "where user_grade like ?";
			break;
		}
		

		try {
			pstmt = conn.prepareStatement(query);
			if(action.equals("age")) {
				pstmt.setInt(1, Integer.parseInt(keyword));
				pstmt.setInt(2, Integer.parseInt(keyword)+9);
				System.out.println(1);
			}else if(!(action.equals("no") || action.equals("gender"))) {
				pstmt.setString(1, "%"+keyword+"%");
				System.out.println(2);
			}else {
				pstmt.setInt(1, uno);
				System.out.println(3);
			}
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				listCount = rset.getInt(1); // select 절의 첫번째 항목 : count(*)
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return listCount;
	}



	

		public Member searchUserPwPhone(Connection conn, String userid, String phone) {
		Member member = null;
		PreparedStatement pstmt = null;
		ResultSet rset =null;
		
		String query = "select * from members where user_id = ? and user_phone = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, userid);
			pstmt.setString(2, phone);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				member = new Member();
				
				member.setUserId(userid);
				member.setUserPw(phone);
					   
		return member;
	}


	public int updateTempPwp(Connection conn, String cryptoUserpw, String userid, String phone) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "update members set user_pw = ? where user_id = ? and user_phone = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, cryptoUserpw);
			pstmt.setString(2, userid);
			pstmt.setString(3, phone);
		
			result= pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
	 
		return result;
	}

	public Member searchpwdp(Connection conn, String userphone, String userid) {
		Member member = null;
		PreparedStatement pstmt = null;
		ResultSet rset =null;
		
		String query = "select * from members where user_id = ? and user_phone = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, userid);
			pstmt.setString(2, userphone);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				member = new Member();
				
				member.setUserId(userid);
				member.setUserPw(userphone);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		   
		return member;
	}

	public ArrayList<Profile> subSelectList(Connection conn, int user_no) {
		ArrayList<Profile> list = new ArrayList<Profile>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from members join reservation using(user_rn) join vaccine using(serial_num) join hospital using(reg_bus_no) where user_rn IN (select S.user_rn  from members U join members S on ( U.user_no = S.sub_user_no) where  u.user_no = ?)";
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, user_no);
		
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Profile profile = new Profile();
				profile.setUserNo(user_no);
				profile.setUserName(rset.getString("user_name"));
				profile.setUserRn(rset.getString("user_rn"));
				profile.setUserAddress(rset.getString("user_address"));
				profile.setUserEmail(rset.getString("user_email"));
				profile.setUserPhone(rset.getString("user_phone"));
			    profile.setHp_name(rset.getString("hp_name"));
			    profile.setRev_date(rset.getTimestamp("rev_date"));
			    profile.setVac_name(rset.getString("vac_name"));
				list.add(profile);
			
			
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		   
		return list;
	}

	public Profile profile(Connection conn, String userid) {
		Profile profile = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from members left join reservation on members.user_rn = reservation.user_rn left join vaccine on vaccine.serial_num = reservation.serial_num left join hospital on hospital.reg_bus_no = reservation.reg_bus_no where user_id = ? ";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userid);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				profile = new Profile();
				
				
				profile.setUserName(rset.getString("user_name"));
				profile.setUserRn(rset.getString("user_rn"));
				profile.setUserAddress(rset.getString("user_address"));
				profile.setUserEmail(rset.getString("user_email"));
				profile.setUserGrade(rset.getString("user_grade"));
				profile.setUserNo(rset.getInt("user_no"));
				profile.setUserPhone(rset.getString("user_phone"));
				profile.setSubUserNo(rset.getInt("sub_user_no"));
				
				profile.setRev_date(rset.getTimestamp("rev_date"));
				profile.setVac_name(rset.getString("vac_name"));
				profile.setHp_name(rset.getString("hp_name"));
			 
			    
				
			}
			  
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		   
		return profile;
	}

	public int snum(Connection conn, int user_no) {
        int result= 0 ;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select count(S.sub_user_no) from members U join members S on (U.user_no = S.sub_user_no) where U.user_no=? ";
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, user_no);
		
			
			rset = pstmt.executeQuery();
		      if(rset.next()) {
				
		    	  result = rset.getInt(1);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		   
		return result;
	}

	

}
