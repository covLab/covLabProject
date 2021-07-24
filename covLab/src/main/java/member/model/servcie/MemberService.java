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

<<<<<<< Updated upstream
=======
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

	public int searchEmail(String useremail) {
		Connection conn =getConnection();
		int idCount =mdao.searchEmail(conn, useremail);
		close(conn);
		return idCount;
	}
	}

>>>>>>> Stashed changes
	

}

