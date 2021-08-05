package hospital.model.dao;

import static common.JDBCTemp.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import hospital.model.vo.ReservationInfo;
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

	public int deleteBoard(Connection conn, String vname) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "delete from vaccine_info where VAC_NAME = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, vname);
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int getReservationListCount(Connection conn) {
		int listCount = 0;
		Statement stmt = null;
		ResultSet rset = null;

		String query = "select count(*) "
				+ "from reservation "
				+ "left join vaccine using(serial_num) "
				+ "left join members using(user_rn) "
				+ "left join hospital using(reg_bus_no)";

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

	public ArrayList<ReservationInfo> selectReservationList(Connection conn, int startRow, int endRow) {
		ArrayList<ReservationInfo> list = new ArrayList<ReservationInfo>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = "select * from "
				+ "(select rownum rnum, serial_num, sub_ok, user_rn, reg_bus_no, rev_date, ioc_date, can_date, state, "
				+ "        user_no, user_name, user_grade, ino_cnt, hp_name, vac_name "
				+ "from  "
				+ "(select * "
				+ "from reservation  "
				+ "left join vaccine using(serial_num) "
				+ "left join members using(user_rn) "
				+ "left join hospital using(reg_bus_no) "
				+ "order by hp_name)) "
				+ "where rnum between ? and ?";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				ReservationInfo ri = new ReservationInfo();
				
				ri.setUserNo(rset.getInt("user_no"));
				ri.setUserName(rset.getString("user_name"));
				ri.setUserRn(rset.getString("user_rn"));
				ri.setUserGrade(rset.getString("user_grade"));
				ri.setInoCnt(rset.getInt("ino_cnt"));
				ri.setSerialNum(rset.getString("serial_num"));
				ri.setSubOk(rset.getString("sub_ok"));
				ri.setRevDate(rset.getTimestamp("rev_date"));
				ri.setIocDate(rset.getTimestamp("ioc_date"));
				ri.setCanDate(rset.getTimestamp("can_date"));
				ri.setState(rset.getString("state"));
				ri.setRegBusNo(rset.getString("reg_bus_no"));
				ri.setVacName(rset.getString("vac_name"));
				ri.setHpName(rset.getString("hp_name"));

				list.add(ri);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}

	public int updateRInoCntInfo(Connection conn, ReservationInfo ri) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "update members " 
						+ "set ino_cnt = ? " 
						+ "where user_no = ?";
		try {
			pstmt = conn.prepareStatement(query);
			if (ri.getInoCnt() == 0) {
				pstmt.setInt(1, 1);
			} else {
				System.out.println("~~~");
				pstmt.setInt(1, 2);
			}
			pstmt.setInt(2, ri.getUserNo());

			result = pstmt.executeUpdate();

			System.out.println("result : " + result);
			System.out.println("ri : " + ri);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int updateRStateInfo(Connection conn, ReservationInfo ri) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "update reservation "
				+ "set state = ? , ioc_date = sysdate "
				+ "where user_rn = (select user_rn "
				+ "                                from members "
				+ "                                where user_no = ?)";
				
		System.out.println("inocnt : "+ri.getInoCnt());
		try {
			pstmt = conn.prepareStatement(query);
			if(ri.getInoCnt() != 2) {
				System.out.println("www");
				pstmt.setString(1, "W");
			}else {
				System.out.println("fff");
				pstmt.setString(1, "F");
			}
			pstmt.setInt(2, ri.getUserNo());
			
			result = pstmt.executeUpdate();
			
		System.out.println("result : "+result);	
		System.out.println("ri : "+ri);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	



}