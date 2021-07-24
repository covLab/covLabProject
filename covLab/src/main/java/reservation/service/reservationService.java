package reservation.service;

import static common.JDBCTemp.close;
import static common.JDBCTemp.getConnection;

import java.sql.Connection;

import reservation.dao.reservationDao;
import reservation.vo.Hospital;

public class reservationService {
	private reservationDao rdao = new reservationDao();
	
	public Hospital selectOneHp(String reg_bus_no) {
		Connection conn = getConnection();
		Hospital hp = rdao.selectOneHp(conn, reg_bus_no);
		close(conn);
		return hp;
	}
	
}
