package hospital.model.service;

import static common.JDBCTemp.close;
import static common.JDBCTemp.commit;
import static common.JDBCTemp.getConnection;
import static common.JDBCTemp.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import hospital.model.dao.HospitalDao;
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



}
