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

	

}
