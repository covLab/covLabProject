package board.comments.model.dao;

import static common.JDBCTemp.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import board.comments.model.vo.Comments;

public class CommentsDao {

	public ArrayList<Comments> selectList(Connection conn, int boardRef) {
		ArrayList<Comments> list = new ArrayList<Comments>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = "select * from comments "
				+ "where board_ref = ? "
				+ "order by com_level, com_date";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, boardRef);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				Comments comments = new Comments();

				comments.setComNo(rset.getInt("com_no"));
				comments.setBoardRef(rset.getInt("board_ref"));
				comments.setComWriter(rset.getString("com_writer"));
				comments.setComDate(rset.getDate("com_date"));
				comments.setComContent(rset.getString("com_content"));
				comments.setComLevel(rset.getInt("com_level"));
				

				list.add(comments);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}

	public Comments selectRef(Connection conn, int boardNo) {
		Comments comments = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from comments where board_ref = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, boardNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				comments = new Comments();
				
				comments.setComNo(rset.getInt("com_no"));
				comments.setBoardRef(rset.getInt("board_ref"));
				comments.setComWriter(rset.getString("com_writer"));
				comments.setComDate(rset.getDate("com_date"));
				comments.setComContent(rset.getString("com_content"));
				comments.setComLevel(rset.getInt("com_level"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return comments;
	}

	public int insertComments(Connection conn, Comments comments) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "INSERT INTO COMMENTS VALUES "
				+ " ((select max(com_no) + 1 from comments), ?, ?, sysdate, ?, (select max(com_no) + 1 from comments))";
		System.out.println("3");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, comments.getBoardRef());
			pstmt.setString(2, comments.getComWriter());
			pstmt.setString(3, comments.getComContent());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int deleteComments(Connection conn, int comNo, int boardRef, int cLevel) {
		int result =0;
		PreparedStatement pstmt = null;
		
		String query = "delete from comments ";
		
		if(comNo == cLevel) {//게시글의 댓글
			query += "where com_no = ?";
		}else {//댓글의 대댓글
			query += "where "
		}
		
		
		return result;
	}
	
	
	
	

}
