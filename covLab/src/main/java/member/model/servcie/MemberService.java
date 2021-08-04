package member.model.servcie;

import static common.JDBCTemp.close;
import static common.JDBCTemp.commit;
import static common.JDBCTemp.getConnection;
import static common.JDBCTemp.rollback;

import java.sql.Connection;
import java.util.ArrayList;

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

	public int searchUseri(String userid, String userpwd) {
		Connection conn =getConnection();
		int idCount =mdao.searchUseri(conn, userid, userpwd);
		close(conn);
		return idCount;
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
	



