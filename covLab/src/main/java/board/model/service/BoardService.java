package board.model.service;

import static common.JDBCTemp.*;
import java.sql.Connection;
import java.util.ArrayList;

import board.model.dao.BoardDao;
import board.model.vo.Board;


public class BoardService {
	
	private BoardDao bdao = new BoardDao();

	public int getListCount() {
		Connection conn = getConnection();
		int listCount = bdao.getListCount(conn);
		close(conn);
		return listCount;
	}

	public ArrayList<Board> selectList(int startRow, int endRow) {
		Connection conn = getConnection();
		ArrayList<Board> list = bdao.selectList(conn, startRow, endRow);
		close(conn);
		return list;
	}

	public int deleteBoard(int boardNo) {
		Connection conn = getConnection();
		int result = bdao.deleteBoard(conn, boardNo);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	public int insertBoard(Board board) {
		Connection conn = getConnection();
		int result = bdao.insertBoard(conn, board);
		if(result >0 ) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public void addReadCount(int boardNo) {
		Connection conn = getConnection();
		int result = bdao.updateReadCount(conn, boardNo);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
	}

	public Board selectBoard(int boardNo) {
		Connection conn = getConnection();
		Board board = bdao.selectBoard(conn, boardNo);
		close(conn);
		return board;
	}

	public int updateBoard(Board board) {
		Connection conn = getConnection();
		int result = bdao.updateBoard(conn, board);
		if(result >0 ) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int getSearchListCount(String sCondition, String sKeyword) {
		Connection conn = getConnection();
		int listCount = bdao.getSearchListCount(conn, sCondition, sKeyword);
		close(conn);
		return listCount;
	}

	public ArrayList<Board> selectSearchList(int startRow, int endRow, String sCondition, String sKeyword) {
		Connection conn = getConnection();
		ArrayList<Board> list = bdao.selectSearchList(conn, startRow, endRow, sCondition, sKeyword);
		close(conn);
		return list;
	}

	public int deleteBoard(String[] checkedList) {
		Connection conn = getConnection();
		int result = bdao.deleteBoard(conn, checkedList);
		if(result==checkedList.length) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	



	
	

}
