package member.model.servcie;

import static common.JDBCTemp.close;
import static common.JDBCTemp.commit;
import static common.JDBCTemp.getConnection;
import static common.JDBCTemp.rollback;

import java.sql.Connection;

import member.model.dao.MemberDao;
import member.model.vo.Member;

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

	public int selectCheckpd(String curpd) {
		Connection conn =getConnection();
		int reuslt =mdao.selectCheckpd(conn, curpd);
		close(conn);
		return reuslt;
	}
}
	



