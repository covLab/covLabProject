package reservation.model.dao;

import static common.JDBCTemp.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import reservation.model.vo.Hospital;
import reservation.model.vo.Members;
import reservation.model.vo.Reservation;
import reservation.model.vo.Vaccine;

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

			if (rset.next()) {
				hp = new Hospital();

				hp.setReg_bus_no(reg_bus_no);
				hp.setHp_name(rset.getString("hp_name"));
				hp.setHp_address(rset.getString("hp_address"));
				hp.setHp_phone(rset.getString("hp_phone"));

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return hp;
	}

	public ArrayList<Hospital> selectAllHps(Connection conn) {
		ArrayList<Hospital> hps = new ArrayList<Hospital>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = "select * from hospital;";

		try {
			pstmt = conn.prepareStatement(query);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				Hospital hp = new Hospital();

				hp.setHp_name(rset.getString("hp_name"));
				hp.setHp_address(rset.getString("hp_address"));
				hp.setHp_phone(rset.getString("hp_phone"));

				hps.add(hp);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return hps;
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

			if (rset.next()) {
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
		} finally {
			close(rset);
			close(pstmt);
		}

		return mb;
	}

	public int insertReservation(Connection conn, Reservation res) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = "insert into reservation values (?,default,?,?,systimestamp,?,null,default)";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, res.getSerial_num());
			pstmt.setString(2, res.getUser_no());
			pstmt.setString(3, res.getReg_bus_no());
			pstmt.setTimestamp(4, res.getIoc_date());

			result = pstmt.executeUpdate();
			System.out.println("result: " + result);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
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

			if (rset.next()) {
				vac = new Vaccine();

				vac.setSerial_num(serial_num);
				vac.setVac_name(rset.getString("vac_name"));
				vac.setProduct_date(rset.getDate("product_date"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return vac;
	}

	public int checkReservation(Connection conn, String user_rn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int check = 0;

		String query = "select count(*) from reservation where user_no = ? and state = 'W' ";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, user_rn);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				check = rset.getInt(1);
				System.out.println("check : " + check);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return check;
	}

	public int deleteReservation(Connection conn, Reservation res) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = "update reservation set state ='C' where user_no =? and state = 'W'";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, res.getUser_no());

			result = pstmt.executeUpdate();
			System.out.println("result: " + result);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

}
