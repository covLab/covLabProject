package reservation.model.service;

import static common.JDBCTemp.close;
import static common.JDBCTemp.getConnection;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import reservation.model.dao.reservationDao;
import reservation.model.vo.Hospital;
import reservation.model.vo.Members;
import reservation.model.vo.Reservation;
import reservation.model.vo.Vaccine;
import reservation.model.vo.VaccineData;

public class reservationService {
	private reservationDao rdao = new reservationDao();

	public Hospital selectOneHp(String reg_bus_no) {
		Connection conn = getConnection();
		Hospital hp = rdao.selectOneHp(conn, reg_bus_no);
		close(conn);
		return hp;
	}

	public ArrayList<Hospital> selectAllHps() {
		Connection conn = getConnection();
		ArrayList<Hospital> hps = rdao.selectAllHps(conn);
		close(conn);
		return hps;
	}

	public ArrayList<VaccineData> selectAllVds() {

		Connection conn = getConnection();
		ArrayList<VaccineData> vds = rdao.selectAllVds(conn);
		close(conn);
		return vds;
	}

	public Members selectOneMember(String user_id) {
		Connection conn = getConnection();
		Members mb = rdao.selectOneMember(conn, user_id);
		close(conn);
		return mb;
	}

	public int insertReservation(Reservation res) {
		Connection conn = getConnection();
		int result = rdao.insertReservation(conn, res);
		close(conn);
		return result;
	}

	public Vaccine selectOneVac(String serial_num) {
		Connection conn = getConnection();
		Vaccine vac = rdao.selectOneVac(conn, serial_num);
		close(conn);
		return vac;
	}

	public int checkReservation(String user_rn) {
		Connection conn = getConnection();
		int check = rdao.checkReservation(conn, user_rn);
		close(conn);
		return check;
	}

	
	public int deleteReservation(String user_rn) {

		Connection conn = getConnection();
		int result = rdao.deleteReservation(conn, user_rn);
		close(conn);
		return result;
	}

	public int insertSubMember(int sub_user_no, Members mb) {
		Connection conn = getConnection();
		int result = rdao.insertSubMember(conn, sub_user_no, mb);
		close(conn);
		return result;
	}

	public Members selectOneSubMember(String user_rn) {

		Connection conn = getConnection();
		Members mb = rdao.selectOneSubMember(conn, user_rn);
		close(conn);
		return mb;
	}

	public int checkSubReservation(String user_rn) {
		Connection conn = getConnection();
		int check = rdao.checkSubReservation(conn, user_rn);
		close(conn);
		return check;
	}

	public ArrayList<Members> selectOneSubUserRn(int user_no) {
		Connection conn = getConnection();
		ArrayList<Members> sub_list = rdao.selectOneSubUserRn(conn, user_no);
		close(conn);
		return sub_list;
	}


	public ArrayList<Reservation> selectList() {
		Connection conn = getConnection();
		ArrayList <Reservation> list = rdao.selectList(conn);
		close(conn);
		return list;
	}

	
	public ArrayList<Reservation> selectTimeRes(String reg_bus_no) {
		Connection conn = getConnection();
		ArrayList<Reservation> list_resTime = rdao.selectTimeRes(conn, reg_bus_no);
		close(conn);
		return list_resTime;
	}
	
	
	public HashMap<String,Integer> countVaccineData() {
		Connection conn = getConnection();
		HashMap<String,Integer> cntVac = rdao.countVaccineData(conn);
		close(conn);
		return cntVac;
	}
	
//	public String selectSericalNumVaccineData(String reg_bus_no) {
//		Connection conn = getConnection();
//		String serialNumVac = rdao.selectSericalNumVaccineData(conn, reg_bus_no);
//		close(conn);
//		return serialNumVac;
//	}
	
	
	public ArrayList<Object> joinvacVacName(String reg_bus_no) {
		Connection conn = getConnection();
		ArrayList<Object> join_list = rdao.joinvacVacData(conn, reg_bus_no);
		close(conn);
		return join_list;
	}
	
	
	public String selectSerialNum(String vac_name, String reg_bus_no) {
		Connection conn = getConnection();
		String serial_num = rdao.selectSerialNum(conn, vac_name, reg_bus_no);
		close(conn);
		return serial_num;
	}
	
	public Reservation selectOneResByUserRn(String user_rn, String sub_ok, String reg_bus_no) {
		Connection conn = getConnection();
		Reservation resByUserRn= rdao.selectOneResByUserRn(conn, user_rn, sub_ok, reg_bus_no);
		close(conn);
		return resByUserRn;
	}
	
//	public ArrayList<Notice> selectSetialNumOfNotice(String user_id) {
//		Connection conn = getConnection();
//		ArrayList<Notice> reg_bus_no= rdao.selectSetialNumOfNotice(conn,user_id);
//		close(conn);
//		return reg_bus_no;
//	}
	

	public int checkNotice(String reg_bus_no) {
		Connection conn = getConnection();
		int result = rdao.checkNotice(conn, reg_bus_no);
		close(conn);
		return result;
	}

	public int cehckOneResByUserRn(String user_rn, String reg_bus_no) {
		Connection conn = getConnection();
		int check = rdao.cehckOneResByUserRn(conn, user_rn,reg_bus_no);
		close(conn);
		return check;
	}
	
	public int cehckOneResBySubUserRn(String user_rn, String reg_bus_no) {
		Connection conn = getConnection();
		int check = rdao.cehckOneResBySubUserRn(conn, user_rn,reg_bus_no);
		close(conn);
		return check;
	}
}
