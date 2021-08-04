package member.model.servcie;

import static common.JDBCTemp.close;
import static common.JDBCTemp.commit;
import static common.JDBCTemp.getConnection;
import static common.JDBCTemp.rollback;

import java.sql.Connection;

import java.sql.Date;

import java.util.ArrayList;

import board.model.vo.Board;
import member.model.dao.MemberDao;
import member.model.vo.Member;
import member.model.vo.Profile;


public class MemberService {
           MemberDao mdao = new MemberDao(); 
	
	public int searchUser(String username, String userrn){
		Connection conn =getConnection();
	    int idCount =mdao.searchUser(conn, username, userrn);
		close(conn);
       return idCount;
		}

	public Member selectLogin(String userid, String userpw) {
		Connection conn =getConnection();
		Member member=mdao.selectLogin(conn, userid, userpw);
		close(conn);
		return member; 
	}

	public int insertMember(Member member) {
		Connection conn = getConnection();
		int result = mdao.insertMember(conn, member);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int selectCheckId(String userid) {
		Connection conn = getConnection();
		int count = mdao.selectCheckId(conn, userid);
		close(conn);
		return count;
	}

	public int selectCheckId2(String username, String userrn) {
		Connection conn =getConnection();
		int idCount =mdao.selectCheckId2(conn, username, userrn);
		close(conn);
		return idCount;
	}

	public String searchUserIdEmail(String useremail, String username) {
		Connection conn =getConnection();
		String userid =mdao.searchUserIdEmail(conn, useremail, username);
		close(conn);
		return userid;
	}

	public String searchUserIdPhone(String userphone, String username) {
		Connection conn =getConnection();
		String userid =mdao.searchUserIdPhone(conn, userphone, username);
		close(conn);
		return userid;
	}

	public Member searchpwd(String userid, String useremail) {
		Connection conn =getConnection();
		Member member =mdao.searchpwd(conn, userid, useremail);
		close(conn);
		return member;
	}

	public int updatePw(String cryptoUserpw, String userid) {
		Connection conn = getConnection();
		int result = mdao.updatePw(conn, cryptoUserpw, userid);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		 
		return result;
	}

	public int updateTempPw(String cryptoUserpw, String userid, String useremail) {
		Connection conn = getConnection();
		int result = mdao.updateTempPw(conn, cryptoUserpw, userid, useremail);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		 
		return result;
	}

//	public int selectCheckpd(String curpd) {
//		Connection conn =getConnection();
//		int reuslt =mdao.selectCheckpd(conn, curpd);
//		close(conn);
//		return reuslt;
//	}

	public int updateMember(Member member) {
		Connection conn = getConnection();
		int result = mdao.updateMember(conn, member);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}


	public int deleteMember(String userid, String cryptoUserpwd) {
		Connection conn = getConnection();
		int result = mdao.deleteMember(conn, userid, cryptoUserpwd);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		System.out.println("result : " + result);
		close(conn);
		return result;
	}


	public ArrayList<Member> selectList(int startRow, int endRow) {
		Connection conn = getConnection();
		ArrayList<Member> list = mdao.selectList(conn, startRow, endRow);
		close(conn);
		return list;
	}

	public int getListCount() {
		Connection conn = getConnection();
		int listCount = mdao.getListCount(conn);
		close(conn);
		return listCount;
	}

	public ArrayList<Member> selectSearchUserNo(int startRow, int endRow, String keyword) {
		Connection conn = getConnection();
		ArrayList<Member> list = mdao.selectSearchUserNo(conn, startRow, endRow, keyword);
		close(conn);
		return list;
	}
	
	public ArrayList<Member> selectSearchUserName(int startRow, int endRow, String keyword) {
		Connection conn = getConnection();
		ArrayList<Member> list = mdao.selectSearchUserName(conn, startRow, endRow, keyword);
		close(conn);
		return list;
	}

	public ArrayList<Member> selectSearchGender(int startRow, int endRow, String keyword) {
		Connection conn = getConnection();
		ArrayList<Member> list = mdao.selectSearchGender(conn, startRow, endRow, keyword);
		close(conn);
		return list;
	}

	public ArrayList<Member> selectSearchAge(int startRow, int endRow, int keyword) {
		Connection conn = getConnection();
		ArrayList<Member> list = mdao.selectSearchAge(conn, startRow, endRow, keyword);

		close(conn);
		return list;
	}


	/*
	 * public ArrayList<Member> selectSearchRegDate(int startRow, int endRow, Date
	 * begin, Date end) { Connection conn = getConnection(); ArrayList<Member> list
	 * = mdao.selectSearchRegDate(conn, startRow, endRow, begin, end); close(conn);
	 * return list; }
	 */

	public ArrayList<Member> selectSearchLoginType(int startRow, int endRow, String keyword) {
		Connection conn = getConnection();
		ArrayList<Member> list = mdao.selectSearchLoginType(conn, startRow, endRow, keyword);
		close(conn);
		return list;
	}

	// 검색한 결과 카운트
	public int getSearchListCount(String action, String keyword) {
		Connection conn = getConnection();
		int listCount = mdao.getSearchListCount(conn, action, keyword);
		close(conn);
		return listCount;
	}

	/*
	 * public int getSearchListCount(String action, String keyword, String
	 * beginDate, String endDate) { Connection conn = getConnection(); int listCount
	 * = mdao.getSearchListCount(conn, action, keyword, beginDate, endDate);
	 * close(conn); return listCount; }
	 */



  	public Member searchUserPwPhone(String userid, String phone) {
		Connection conn =getConnection();
		Member member =mdao.searchUserPwPhone(conn, userid, phone);
		close(conn);
		return member;
	}

	public int updateTempPwp(String cryptoUserpw, String userid, String phone) {
		Connection conn = getConnection();
		int result = mdao.updateTempPwp(conn, cryptoUserpw, userid, phone);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		 
		return result;
	}

	public Member searchpwdp(String userid, String userphone) {
		Connection conn =getConnection();
		Member member =mdao.searchpwdp(conn, userphone, userid);
		close(conn);
		return member;
	}

  public ArrayList<Profile> subSelectList(int user_no) {
      Connection conn = getConnection();
      ArrayList<Profile> list= mdao.subSelectList(conn, user_no);
      close(conn);
      return list;
   }  
    
	public Profile profile(String userid ) {
		Connection conn = getConnection();
		Profile profile = mdao.profile(conn, userid);
		close(conn);
		return profile;
	}

	public int snum(int user_no) {
		Connection conn = getConnection();
		int result = mdao.snum(conn, user_no);
		close(conn);
		return result;
	}



}
	



