package reservation.dao;
import static common.JDBCTemp.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import reservation.vo.Hospital;

public class reservationDao {

	public Hospital selectOneHp(Connection conn, String reg_bus_no) {
		Hospital hp = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from hospital where reg_bus_no = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, reg_bus_no);			
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				hp = new Hospital();
				
				hp.setReg_bus_no(reg_bus_no);
				hp.setHp_name(rset.getString("hp_name"));
				hp.setHp_address(rset.getString("hp_address"));
				hp.setHp_phone(rset.getString("hp_phone"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return hp;
	}
}
