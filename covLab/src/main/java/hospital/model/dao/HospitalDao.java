package hospital.model.dao;

import static common.JDBCTemp.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import hospital.model.vo.VaccineInfo;


public class HospitalDao {

	public ArrayList<VaccineInfo> selectList(Connection conn) {
		ArrayList<VaccineInfo> list = new ArrayList<VaccineInfo>();
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select * from vaccine_info";
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				VaccineInfo vi = new VaccineInfo();
				
				vi.setVacName(rset.getString("vac_name"));
				vi.setMadeByCompany(rset.getString("made_by_company"));
				vi.setMadeInCountry(rset.getString("made_in_country"));
				vi.setMaxIocCount(rset.getInt("max_ioc_count"));
				vi.setExpDur(rset.getString("exp_dur"));

				list.add(vi);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return list;
	}

	public int insertVaccineInfo(Connection conn, VaccineInfo vi) {
		int result=0;
		PreparedStatement pstmt = null;
		String query = "insert into vaccine_info values "
				+ "(?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, vi.getVacName());
			pstmt.setString(2, vi.getMadeByCompany());
			pstmt.setString(3, vi.getMadeInCountry());
			pstmt.setInt(4, vi.getMaxIocCount());
			pstmt.setString(5, vi.getExpDur());
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}



}
