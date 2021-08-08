package board.model.dao;

import static common.JDBCTemp.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import board.model.vo.Board;


public class BoardDao {

	public int getListCount(Connection conn) {
		int listCount = 0;
		Statement stmt = null;
		ResultSet rset = null;

		String query = "select count(*) from board";

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

	public ArrayList<Board> selectList(Connection conn, int startRow, int endRow) {
		ArrayList<Board> list = new ArrayList<Board>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = "select * from "
				+ "(select rownum rnum, board_no, board_title, board_writer, board_content, board_date, view_cnt, recommend_cnt "
				+ "from "
				+ "(select * from board "
				+ "order by board_no desc)) "
				+ "where rnum between ? and ?";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				Board board = new Board();
				
				board.setBoardNo(rset.getInt("board_no"));
				board.setBoardTitle(rset.getString("board_title"));
				board.setBoardWriter(rset.getString("board_writer"));
				board.setBoardContent(rset.getString("board_content"));
				board.setBoardDate(rset.getDate("board_date"));
				board.setViewCnt(rset.getInt("view_cnt"));
				board.setRecommendCnt(rset.getInt("recommend_cnt"));

				list.add(board);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}

	public int deleteBoard(Connection conn, int boardNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "delete from board where board_no = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, boardNo);
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	
	public int insertBoard(Connection conn, Board board) {
		int result = 0;
		PreparedStatement pstmt = null;

		String query = "insert into board values "
				+ "((select max(board_no) + 1 from board), ?, ?, ?, sysdate, default, default)";

		try {
			pstmt = conn.prepareStatement(query);

			pstmt.setString(1, board.getBoardTitle());
			pstmt.setString(2, board.getBoardWriter());
			pstmt.setString(3, board.getBoardContent());

			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int updateReadCount(Connection conn, int boardNo) {
		int result = 0;
		PreparedStatement pstmt = null;

		String query = "update board set view_cnt = view_cnt + 1 " + "where board_no = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, boardNo);

			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public Board selectBoard(Connection conn, int boardNo) {
		Board board = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = "select * from board where board_no = ?";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, boardNo);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				board = new Board();

				board.setBoardNo(boardNo);
				board.setBoardTitle(rset.getString("board_title"));
				board.setBoardWriter(rset.getString("board_writer"));
				board.setBoardContent(rset.getString("board_content"));
				board.setBoardDate(rset.getDate("board_date"));
				board.setViewCnt(rset.getInt("view_cnt"));
				board.setRecommendCnt(rset.getInt("recommend_cnt"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return board;
	}

	public int updateBoard(Connection conn, Board board) {
		int result = 0;
		PreparedStatement pstmt = null;

		String query = "update board set board_title = ?, board_content = ? "
				+ "where board_no = ?";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, board.getBoardTitle());
			pstmt.setString(2, board.getBoardContent());
			pstmt.setInt(3, board.getBoardNo());

			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}


	public int getSearchListCount(Connection conn, String sCondition, String sKeyword) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String field = "";
		int bno = 0; 

		switch (sCondition) {
		case "searchboardno":
			field = "board_no";
			bno = Integer.parseInt(sKeyword);
			break;
		case "searchboardtitle":
			field = "board_title";
			break;
		case "searchboardwriter":
			field = "board_writer";
			break;
		}
		
		String query = "select count(*) from board where "+field+" like ? ";

		try {
			pstmt = conn.prepareStatement(query);
			if(bno == 0) {
				pstmt.setString(1, "%"+sKeyword+"%");
			}else {
				pstmt.setInt(1, bno);
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

	public ArrayList<Board> selectSearchList(Connection conn, int startRow, int endRow, String sCondition, String sKeyword) {
		ArrayList<Board> list = new ArrayList<Board>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "";
		switch (sCondition) {
		case "searchboardno":
			query = "select * from "
					+ "(select rownum rnum, board_no, board_title, board_writer, board_content, board_date, view_cnt, recommend_cnt "
					+ "from "
					+ "(select * from board "
					+ "where board_no = ? "
					+ "order by board_no desc)) "
					+ "where rnum between ? and ?";
			break;
		case "searchboardtitle":
			sCondition = "board_title";
			query = "select * from "
					+ "(select rownum rnum, board_no, board_title, board_writer, board_content, board_date, view_cnt, recommend_cnt "
					+ "from "
					+ "(select * from board "
					+ "where board_title like ? "
					+ "order by board_no desc)) "
					+ "where rnum between ? and ?";
			break;
		case "searchboardwriter":
			sCondition = "board_writer";
			query = "select * from "
					+ "(select rownum rnum, board_no, board_title, board_writer, board_content, board_date, view_cnt, recommend_cnt "
					+ "from "
					+ "(select * from board "
					+ "where board_writer like ? "
					+ "order by board_no desc)) "
					+ "where rnum between ? and ?";
			break;
		}
			
		System.out.println("sCondition : "+sCondition);
		System.out.println("sKeyword : "+sKeyword);
		
		try {
			pstmt = conn.prepareStatement(query);
			if(sCondition.equals("searchboardno")) {
				pstmt.setInt(1, Integer.parseInt(sKeyword));
			}else {
				pstmt.setString(1, "%"+sKeyword+"%");
			}
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				Board board = new Board();
				
				board.setBoardNo(rset.getInt("board_no"));
				board.setBoardTitle(rset.getString("board_title"));
				board.setBoardWriter(rset.getString("board_writer"));
				board.setBoardContent(rset.getString("board_content"));
				board.setBoardDate(rset.getDate("board_date"));
				board.setViewCnt(rset.getInt("view_cnt"));
				board.setRecommendCnt(rset.getInt("recommend_cnt"));

				list.add(board);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}

	// 관리자용 게시글 삭제
	public int deleteBoard(Connection conn, String[] checkedList) {
		int[] result = null;
		PreparedStatement pstmt = null;
		
		String query = "delete from board where board_no = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			for(int i =0; i<checkedList.length; i++) {
				pstmt.setString(1, checkedList[i]);
				//쿼리문 pstmt 에 모두 쌓아 한번에 처리
				pstmt.addBatch();
			}
			
			result = pstmt.executeBatch();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result.length;
	}

	public int updateRecommend(Connection conn, int boardNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "update board set RECOMMEND_CNT = RECOMMEND_CNT + 1 " + "where board_no = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, boardNo);

			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
}
