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
		String query = null;
		
		query = "";
		System.out.println("답글달기 수정필요. 참조컬럼 추가해야 할듯");
		
		return result;
	}
	
	
	
	

}
