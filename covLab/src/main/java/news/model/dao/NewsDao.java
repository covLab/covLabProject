package news.model.dao;

import static common.JDBCTemp.close;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import java.util.ArrayList;

import board.model.vo.Board;
import member.model.vo.Member;
import member.model.vo.Profile;
import news.model.vo.News;
import reservation.model.vo.Hospital;
import reservation.model.vo.Reservation;
import reservation.model.vo.Vaccine;
public class NewsDao {

	public ArrayList<News> selectAllNews(Connection conn) {
        ArrayList<News> list = new ArrayList<News>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "SELECT * FROM NEWSDATA";
		
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {		
				News ns = new News();
				
				ns.setTitle(rset.getString("title"));
				ns.setUrl(rset.getString("url"));
				list.add(ns);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}	
		return list;
	}

}
