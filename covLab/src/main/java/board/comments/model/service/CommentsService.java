package board.comments.model.service;

import static common.JDBCTemp.*;

import java.sql.Connection;
import java.util.ArrayList;

import board.comments.model.dao.CommentsDao;
import board.comments.model.vo.Comments;

public class CommentsService {
	
	CommentsDao cdao = new CommentsDao();

	public ArrayList<Comments> selectComments(int boardRef) {
		Connection conn = getConnection();
		ArrayList<Comments> list = cdao.selectList(conn, boardRef);
		close(conn);
		return list;
	}

	public Comments selectRef(int boardNo) {
		Connection conn = getConnection();
		Comments comments = cdao.selectRef(conn, boardNo);
		close(conn);
		return comments;
	}

	public int insertComments(Comments comments) {
		Connection conn = getConnection();
		int result = cdao.insertComments(conn, comments);
		if(result >0 ) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int deleteComments(int comNo) {
		Connection conn = getConnection();
		int result = cdao.deleteComments(conn, comNo);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public Comments selectComment(int comNo) {
		Connection conn = getConnection();
		Comments comments = cdao.selectComment(conn, comNo);
		close(conn);
		return comments;
	}

	public int updateComments(Comments comments) {
		Connection conn = getConnection();
		int result = cdao.updateComments(conn, comments);
		if(result >0 ) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int insertReplyComments(Comments comments) {
		Connection conn = getConnection();
		int result = cdao.insertReplyComments(conn, comments);
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
			close(conn);		
		}
		return result;
	}
	
}
