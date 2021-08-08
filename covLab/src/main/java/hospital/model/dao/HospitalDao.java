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
				+ "from reservation  "
				+ "left join vaccine using(serial_num) "
				+ "left join members using(user_rn)  "
				+ "left join hospital using(reg_bus_no) "
				+ "where can_date is null or rev_date > can_date";

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
				+ "where (can_date is null) or rev_date>can_date "
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
				pstmt.setInt(1, 2);
			}
			pstmt.setInt(2, ri.getUserNo());			
			result = pstmt.executeUpdate();

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
			if(ri.getInoCnt() ==1) {
				pstmt.setString(1, "F");
			}else {
				pstmt.setString(1, "W");
			}
			pstmt.setInt(2, ri.getUserNo());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int getSearchListCount(Connection conn, String sCondition, String sKeyword) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String field = "";
		
		switch (sCondition) {
		case "searchhpname":
			field = "hp_name";
			break;
		case "searchusername":
			field = "user_name";
			break;
		/*
		 * case "searchserialno": field = "serial_num"; break;
		 */
		}
		
		String query = "select count(*) "
				+ "from reservation  "
				+ "left join vaccine using(serial_num) "
				+ "left join members using(user_rn) "
				+ "left join hospital using(reg_bus_no) "
				+ "where "+field+" like ? "
				+ "order by hp_name";

		try {
			pstmt = conn.prepareStatement(query);
			if(!(sCondition.equals("searchserialno"))) {
				pstmt.setString(1, "%"+sKeyword+"%");
			} /*
				 * else { sKeyword.toUpperCase();
				 * System.out.println("skeyword listcount : "+sKeyword); pstmt.setString(1,
				 * "%"+sKeyword+"%"); }
				 */
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

	public ArrayList<ReservationInfo> selectSearchList(Connection conn, int startRow, int endRow, String sCondition,
			String sKeyword) {
		ArrayList<ReservationInfo> list = new ArrayList<ReservationInfo>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String field = "";
		
		switch (sCondition) {
		case "searchhpname":
			field = "hp_name";
			break;
		case "searchusername":
			field = "user_name";
			break;
//		case "searchserialno":
//			field = "serial_num";
//			break;
		}
		
		String query = "select * from "
				+ "(select rownum rnum, serial_num, sub_ok, user_rn, reg_bus_no, rev_date, ioc_date, can_date, state, \r\n"
				+ "user_no, user_name, user_grade, ino_cnt, hp_name, vac_name \r\n"
				+ "from (select * "
				+ "from reservation  "
				+ "left join vaccine using(serial_num) "
				+ "left join members using(user_rn) "
				+ "left join hospital using(reg_bus_no) "
				+ "where "+field+" like ?  "
				+ "order by hp_name)) "
				+ "where rnum between ? and ?";

		
		try {
			pstmt = conn.prepareStatement(query);
			if(!(sCondition.equals("searchserialno"))) {
				pstmt.setString(1, "%"+sKeyword+"%");
			} /*
				 * else { sKeyword.toUpperCase(); System.out.println("skeyword * : "+sKeyword);
				 * pstmt.setString(1, "%"+sKeyword+"%"); }
				 */
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

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

	public VaccineInfo selectVaccineInfo(Connection conn, String vname) {
		VaccineInfo vi = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from vaccine_info where vac_name = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, vname);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				vi = new VaccineInfo();
				vi.setVacName(vname);
				vi.setMadeByCompany(rset.getString("made_by_company"));
				vi.setMadeInCountry(rset.getString("made_in_country"));
				vi.setMaxIocCount(rset.getInt("max_ioc_count"));
				vi.setExpDur(rset.getString("exp_dur"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return vi;
	}

	public int updateVaccineInfo(Connection conn, VaccineInfo vi) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "update vaccine_info set "
				+ "MADE_BY_COMPANY = ?, "
				+ "MADE_IN_COUNTRY = ?, "
				+ "MAX_IOC_COUNT = ?, "
				+ "EXP_DUR = ? "
				+ "where VAC_NAME = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, vi.getMadeByCompany());
			pstmt.setString(2, vi.getMadeInCountry());
			pstmt.setInt(3, vi.getMaxIocCount());
			pstmt.setString(4, vi.getExpDur());
			pstmt.setString(5, vi.getVacName());
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}

	



}
