package hospital.model.service;

import static common.JDBCTemp.close;
import static common.JDBCTemp.commit;
import static common.JDBCTemp.getConnection;
import static common.JDBCTemp.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import board.model.vo.Board;
import hospital.model.dao.HospitalDao;
import hospital.model.vo.ReservationInfo;
import hospital.model.vo.VaccineInfo;

public class HospitalService {
	HospitalDao hdao = new HospitalDao();

	public ArrayList<VaccineInfo> selectList() {
		Connection conn = getConnection();
		ArrayList<VaccineInfo> list = hdao.selectList(conn);
		close(conn);
		return list;
	}

	public int insertVaccineInfo(VaccineInfo vi) {
		Connection conn = getConnection();
		int result = hdao.insertVaccineInfo(conn, vi);
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
			close(conn);		
		}
		return result;
	}

	public int deleteVaccineInfo(String vname) {
		Connection conn = getConnection();
		int result = hdao.deleteBoard(conn, vname);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int getReservationListCount() {
		Connection conn = getConnection();
		int listCount = hdao.getReservationListCount(conn);
		close(conn);
		return listCount;
	}

	public ArrayList<ReservationInfo> selectReservationList(int startRow, int endRow) {
		Connection conn = getConnection();
		ArrayList<ReservationInfo> list = hdao.selectReservationList(conn, startRow, endRow);
		close(conn);
		return list;
	}

	public int updateReservationInfo(ReservationInfo ri) {
		Connection conn = getConnection();
		int result = hdao.updateRInoCntInfo(conn, ri);
		if(result >0 ) {
			commit(conn);
		}else {
			rollback(conn);
		}close(conn);
			  
		conn = getConnection(); 
		result = hdao.updateRStateInfo(conn, ri);	
		if(result >0 ) {
			commit(conn);
		}else {
			rollback(conn);
		}close(conn);
		return result;
	}

	public int getSearchListCount(String sCondition, String sKeyword) {
		Connection conn = getConnection();
		int listCount = hdao.getSearchListCount(conn, sCondition, sKeyword);
		close(conn);
		return listCount;
	}

	public ArrayList<ReservationInfo> selectSearchList(int startRow, int endRow, String sCondition, String sKeyword) {
		Connection conn = getConnection();
		ArrayList<ReservationInfo> list = hdao.selectSearchList(conn, startRow, endRow, sCondition, sKeyword);
		close(conn);
		return list;
	}





}
