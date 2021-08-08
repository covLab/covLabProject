package reservation.model.dao;
import static common.JDBCTemp.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import member.model.vo.Member;
import reservation.model.vo.Hospital;
import reservation.model.vo.Members;
import reservation.model.vo.Reservation;
import reservation.model.vo.Vaccine;
import reservation.model.vo.VaccineData;

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
	
	public ArrayList<Hospital> selectAllHps(Connection conn) {
		ArrayList<Hospital> list= new ArrayList<Hospital>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
	
		String query = "SELECT * FROM HOSPITAL";
		
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {		
				Hospital hp = new Hospital();
				
				hp.setReg_bus_no(rset.getString("reg_bus_no"));
				hp.setHp_name(rset.getString("hp_name"));
				hp.setHp_address(rset.getString("hp_address"));
				hp.setHp_phone(rset.getString("hp_phone"));
				hp.setHp_latitude(rset.getFloat("hp_latitude"));
				hp.setHp_longitude(rset.getFloat("hp_longitude"));

				list.add(hp);
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
	
	public ArrayList<VaccineData> selectAllVds(Connection conn) {
		ArrayList<VaccineData> list= new ArrayList<VaccineData>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
	
		String query = "SELECT REG_BUS_NO,SUM(REMAIN) REMAIN FROM VACCINE_DATA where reg_bus_no is not null GROUP BY reg_bus_no";
		
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {		
				VaccineData vd = new VaccineData();

				vd.setReg_bus_no(rset.getString("reg_bus_no"));
				vd.setRemain(rset.getInt("remain"));

				list.add(vd);
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
	
	public Members selectOneMember(Connection conn, String user_id) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Members mb = null;
		
		String query = "select * from members where user_id = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, user_id);			
			
			rset = pstmt.executeQuery();
			
			if(rset.next() ) {
				mb = new Members();
				
				mb.setUserId(user_id);
				mb.setUserPw(rset.getString("user_pw"));
				mb.setUserName(rset.getString("user_name"));
				mb.setUserRn(rset.getString("user_rn"));
				mb.setUserAddress(rset.getString("user_address"));
				mb.setUserEmail(rset.getString("user_email"));
				mb.setUserGrade(rset.getString("user_grade"));
				mb.setUserNo(rset.getInt("user_no"));
				mb.setUserPhone(rset.getString("user_phone"));
				mb.setSubUserNo(rset.getInt("sub_user_no"));
				mb.setInoCnt(rset.getInt("ino_cnt"));
				mb.setSmsAgr(rset.getString("sms_agr"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return mb;
	}
	
	public int insertReservation(Connection conn, Reservation res) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "insert into reservation values (?,?,?,?,systimestamp,?,null,default)";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, res.getSerial_num());	
			pstmt.setString(2, res.getSub_ok());	
			pstmt.setString(3, res.getUser_rn());	
			pstmt.setString(4, res.getReg_bus_no());	
			pstmt.setTimestamp(5, res.getIoc_date());	
			
			result = pstmt.executeUpdate();
			System.out.println("result: " + result);
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	public Vaccine selectOneVac(Connection conn, String serial_num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Vaccine vac = null;
		
		String query = "select * from vaccine where serial_num = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, serial_num);			
			
			rset = pstmt.executeQuery();
			
			if(rset.next() ) {
				vac = new Vaccine();
				
				vac.setSerial_num(serial_num);
				vac.setVac_name(rset.getString("vac_name"));
				vac.setProduct_date(rset.getDate("product_date"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return vac;
	}
	
	public int checkReservation(Connection conn, String user_rn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int check = 0;
		String query = "select count(*) from reservation where user_rn = ? and state = 'W' and sub_ok = 'N'";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, user_rn);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				check = rset.getInt(1);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return check;
	}
	
	
	public int deleteReservation(Connection conn, String user_rn) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "update reservation set state ='C' ,can_date = systimestamp where user_rn =? and state = 'W'";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, user_rn);	
			
			result = pstmt.executeUpdate();
			System.out.println("result: " + result);
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int insertSubMember(Connection conn,int sub_user_no, Members mb) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String query ="insert into members values (board_seq.nextval, ?, default, default, ?, ?,default,?, ?, default, default, default)";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, sub_user_no);
			pstmt.setString(2, mb.getUserName());
			pstmt.setString(3, mb.getUserRn());
			pstmt.setString(4, mb.getUserPhone());
			pstmt.setString(5, mb.getUserAddress());
			
			result=pstmt.executeUpdate();
			System.out.println("DAO 리저트 "+result);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public Members selectOneSubMember(Connection conn, String user_rn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Members mb = null;
		
		String query = "select * from members where user_rn = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, user_rn);			
			
			rset = pstmt.executeQuery();
			
			if(rset.next() ) {
				mb = new Members();
				
				mb.setUserId(rset.getString("user_id"));
				mb.setUserPw(rset.getString("user_pw"));
				mb.setUserName(rset.getString("user_name"));
				mb.setUserRn(user_rn);
				mb.setUserAddress(rset.getString("user_address"));
				mb.setUserEmail(rset.getString("user_email"));
				mb.setUserGrade(rset.getString("user_grade"));
				mb.setUserNo(rset.getInt("user_no"));
				mb.setUserPhone(rset.getString("user_phone"));
				mb.setSubUserNo(rset.getInt("sub_user_no"));
				mb.setInoCnt(rset.getInt("ino_cnt"));
				mb.setSmsAgr(rset.getString("sms_agr"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return mb;
	}
	
	public int checkSubReservation(Connection conn, String user_rn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int check = 0;
		
		String query = "select count(*) from reservation where user_rn = ? and state = 'W' and sub_ok = 'Y' ";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, user_rn);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				check = rset.getInt(1);
				System.out.println("check : " + check);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return check;
	}
	
	
	public ArrayList<Members> selectOneSubUserRn(Connection conn, int user_no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Members> sub_list = new ArrayList<Members>();
		
		String query = "select * from members where sub_user_no = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, user_no);			
			
			rset = pstmt.executeQuery();
			
			
			while(rset.next()) {
				Members sub_mb = new Members();
				
				sub_mb.setUserId(rset.getString("user_id"));
				sub_mb.setUserPw(rset.getString("user_pw"));
				sub_mb.setUserName(rset.getString("user_name"));
				sub_mb.setUserRn(rset.getString("user_rn"));
				sub_mb.setUserAddress(rset.getString("user_address"));
				sub_mb.setUserEmail(rset.getString("user_email"));
				sub_mb.setUserGrade(rset.getString("user_grade"));
				sub_mb.setUserNo(rset.getInt("user_no"));
				sub_mb.setUserPhone(rset.getString("user_phone"));
				sub_mb.setSubUserNo(rset.getInt("sub_user_no"));
				sub_mb.setInoCnt(rset.getInt("ino_cnt"));
				sub_mb.setSmsAgr(rset.getString("sms_agr"));
				
				sub_list.add(sub_mb);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return sub_list;
	}
	
	
	/*
	 * public ArrayList<Hospital> selectAllHps(Connection conn) {
	 * ArrayList<Hospital> hps = new ArrayList<Hospital>(); PreparedStatement pstmt
	 * = null; ResultSet rset = null;
	 * 
	 * String query = "select * from hospital;";
	 * 
	 * try { pstmt = conn.prepareStatement(query);
	 * 
	 * rset = pstmt.executeQuery();
	 * 
	 * while (rset.next()) { Hospital hp = new Hospital();
	 * 
	 * hp.setHp_name(rset.getString("hp_name"));
	 * hp.setHp_address(rset.getString("hp_address"));
	 * hp.setHp_phone(rset.getString("hp_phone"));
	 * 
	 * hps.add(hp); } } catch (SQLException e) { // TODO Auto-generated catch block
	 * e.printStackTrace(); } finally { close(rset); close(pstmt); } return hps; }
	 */
	
	
	
	public ArrayList<Reservation> selectTimeRes(Connection conn, String reg_bus_no) {
		ArrayList<Reservation> list_resTime = new ArrayList<Reservation>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = "select ioc_date from reservation where reg_bus_no =? AND STATE ='W'";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, reg_bus_no);			
			
			rset = pstmt.executeQuery();

			while (rset.next()) {
				Reservation res = new Reservation();

				res.setIoc_date(rset.getTimestamp("ioc_date"));

				list_resTime.add(res);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list_resTime;
	}
	
	
	public HashMap<String,Integer> countVaccineData(Connection conn) {
		 HashMap<String,Integer> cntVac = new  HashMap<String,Integer>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = "select reg_bus_no,count(vaccine_data.serial_num) from vaccine_data , vaccine where vaccine_data.serial_num = vaccine.serial_num(+) group by reg_bus_no";

		try {
			pstmt = conn.prepareStatement(query);
			
			rset = pstmt.executeQuery();

			while (rset.next()) {
				cntVac.put(rset.getString("reg_bus_no"), rset.getInt(2));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return cntVac;
	}
	
//	
//	public String selectSericalNumVaccineData(Connection conn, String reg_bus_no) {
//		Hospital hp = null;
//		PreparedStatement pstmt = null;
//		ResultSet rset = null;
//		
//		String query = "select * from hospital where reg_bus_no = ?";
//		
//		try {
//			pstmt = conn.prepareStatement(query);
//			pstmt.setString(1, reg_bus_no);			
//			
//			rset = pstmt.executeQuery();
//			
//			if(rset.next()) {
//				hp = new Hospital();
//				
//				hp.setReg_bus_no(reg_bus_no);
//				hp.setHp_name(rset.getString("hp_name"));
//				hp.setHp_address(rset.getString("hp_address"));
//				hp.setHp_phone(rset.getString("hp_phone"));
//				
//			}
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}finally {
//			close(rset);
//			close(pstmt);
//		}
//		
//		return hp;
//	}
	
	
	public ArrayList<Object> joinvacVacData(Connection conn, String reg_bus_no) {
		ArrayList<Object> join_list = new ArrayList<Object>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = "select count(vaccine_data.serial_num), reg_bus_no, vaccine.vac_name "+
						"from vaccine_data, vaccine where vaccine_data.serial_num = vaccine.serial_num(+) "+
						"and reg_bus_no = ?"+
						"group by (reg_bus_no,vaccine.vac_name)";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, reg_bus_no);			
			
			rset = pstmt.executeQuery();

			while (rset.next()) {
				ArrayList<String> list = new ArrayList<String>();
				
				list.add(rset.getString(1));
				list.add(rset.getString(2));
				list.add(rset.getString(3));
				
				join_list.add(list);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return join_list;
	}


	public ArrayList<Reservation> selectList(Connection conn) {
		ArrayList<Reservation> list = new ArrayList<Reservation>();
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select * from reservation";
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				Reservation reserv = new Reservation();
				
				// 컬럼 값 꺼내서 필드에 옮겨 기록하기 : 결과 매핑
				reserv.setSerial_num(rset.getString("serial_num"));
				reserv.setSub_ok(rset.getString("sub_ok"));
				reserv.setUser_rn(rset.getString("user_rn"));
				reserv.setReg_bus_no(rset.getString("reg_bus_no"));
				reserv.setRev_date(rset.getTimestamp("rev_date"));
				reserv.setIoc_date(rset.getTimestamp("ioc_date"));
				reserv.setCan_date(rset.getTimestamp("can_date"));
				reserv.setState(rset.getString("state"));
				
				list.add(reserv);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return list;
	}

	
	
	public String selectSerialNum(Connection conn, String vac_name, String reg_bus_no) {
		String serial_num = "";
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select vaccine.serial_num "
				+ "from vaccine_data, vaccine "
				+ "where vaccine_data.serial_num = vaccine.serial_num(+) "
				+ "and vac_name = ? "
				+ "and reg_bus_no= ? "
				+ "and rownum=1";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, vac_name);
			pstmt.setString(2, reg_bus_no);
			
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				serial_num = rset.getString(1);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return serial_num;
	}
	
	
	public Reservation selectOneResByUserRn(Connection conn, String user_rn, String sub_ok, String reg_bus_no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Reservation res = null;
		
		String query = "select * from reservation where user_rn = ? and reg_bus_no = ? and sub_ok =? and state = 'W'";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, user_rn);	
			pstmt.setString(2, reg_bus_no);
			pstmt.setString(3, sub_ok);
			
			rset = pstmt.executeQuery();
			
			if(rset.next() ) {
				res = new Reservation();

				res.setSerial_num(rset.getString("serial_num"));
				res.setSub_ok(rset.getString("sub_ok"));
				res.setUser_rn(rset.getString("user_rn"));
				res.setReg_bus_no(rset.getString("reg_bus_no"));
				res.setRev_date(rset.getTimestamp("rev_date"));
				res.setIoc_date(rset.getTimestamp("ioc_date"));
				res.setCan_date(rset.getTimestamp("can_date"));
				res.setState(rset.getString("state"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return res;
	}
	
//	public ArrayList<Notice> selectSetialNumOfNotice(Connection conn, String user_id) {
//		ArrayList<Notice> list = new ArrayList<Notice>();
//		PreparedStatement pstmt = null;
//		ResultSet rset = null;
//		
//		String query = "select * from notice where user_id = ?";
//		
//		try {
//			pstmt = conn.prepareStatement(query);
//			
//			pstmt.setString(1, user_id);
//			
//			rset = pstmt.executeQuery();
//			
//			while(rset.next()) {
//				Notice no = new Notice();
//				
//				// 컬럼 값 꺼내서 필드에 옮겨 기록하기 : 결과 매핑
//				no.setReg_bus_no(rset.getString("reg_bus_no"));
//				
//				list.add(no);
//			}
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			close(rset);
//			close(pstmt);
//		}
//		
//		return list;
//	}

	
public int checkNotice(Connection conn,String reg_bus_no) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query ="select count(*) from vaccine_data where reg_bus_no = ?";

		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, reg_bus_no);
			
			rset = pstmt.executeQuery();
			
			while (rset.next()) {
				result = rset.getInt(1);
				System.out.println(result);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}

	public int cehckOneResByUserRn(Connection conn, String user_rn, String reg_bus_no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int check = 0;
		String query = "select count(*) from reservation where user_rn = ? and reg_bus_no = ? and state = 'W' and sub_ok = 'N'";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, user_rn);
			pstmt.setString(2, reg_bus_no);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				check = rset.getInt(1);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return check;
	}
	
	public int cehckOneResBySubUserRn(Connection conn, String user_rn, String reg_bus_no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int check = 0;
		String query = "select count(*) from reservation where user_rn = ? and reg_bus_no = ? and state = 'W' and sub_ok = 'Y'";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, user_rn);
			pstmt.setString(2, reg_bus_no);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				check = rset.getInt(1);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return check;
	}
	
}
