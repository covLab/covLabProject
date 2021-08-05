package reservation.model.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import reservation.model.service.reservationService;
import reservation.model.vo.Hospital;
import reservation.model.vo.Members;
import reservation.model.vo.Reservation;
import reservation.model.vo.Vaccine_Data;


/**
 * Servlet implementation class detailReservation
 */
@WebServlet("/detailhp")
public class detailReservation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public detailReservation() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		request.setCharacterEncoding("utf-8");
		
		reservationService rservice = new reservationService();
		
		
		System.out.println("-----------------------디테일 서블릿----------------------------");
		String reg_bus_no = request.getParameter("reg_bus_no");
		System.out.println("reg_bus_no : " + reg_bus_no);
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.append(reg_bus_no);
		out.flush();
		out.close();
//		String reg_bus_no = "252-12-62156";
		
		HttpSession session = request.getSession(true);
		
		/*테스트용 세션 생성*/
		session.setAttribute("user_id", "user18");
		
		//세션 아이디 설정
		String user_id = (String) session.getAttribute("user_id");
		
		Members mb = rservice.selectOneMember(user_id);
		String user_rn = mb.getUserRn();
		
		System.out.println("user_rn : "+user_rn);
		
		
		//병원 정보 가져오기
		Hospital hp = rservice.selectOneHp(reg_bus_no);
		
		
		// 대리예약 정보 가져오기 위한 대리유저 정보
		ArrayList<Members> sub_list = rservice.selectOneSubUserRn(mb.getUserNo());
		
		int checkRes = rservice.checkReservation(user_rn);
		int checkSubRes = 0;
		
		System.out.println("sub_list.size() : " + sub_list.size());
		
		if(sub_list.size() > 0) {
			for(Members sub_mb : sub_list) {
				System.out.println("sub_mb.getUserRn() : "+sub_mb.getUserRn());
				checkSubRes = rservice.checkSubReservation(sub_mb.getUserRn());
				
				int user_no = sub_mb.getSubUserNo();
				request.setAttribute("user_no", user_no);
				
				if(checkSubRes >0) {
					break;
				}
			}
		}
		
		ArrayList<Reservation> list_resTime = rservice.selectTimeRes(reg_bus_no);
		
		System.out.println("list_resTime :" + list_resTime.size());
		
		for(Reservation rdate : list_resTime) {
			System.out.println("rdate : "+rdate.getIoc_date());
		}
		
//		String serialNumVac = rservice.selectSericalNumVaccineData(reg_bus_no);
		ArrayList<Object> joinvacVacData = rservice.joinvacVacName(reg_bus_no);
		
		/*
		 * for(int i =0 ; i< joinvacVacData.size() ; i++) { ArrayList<String> list = new
		 * ArrayList<String>(); for(int j =0 ; j < ((ArrayList<String>)
		 * joinvacVacData.get(i)).size() ; j++) {
		 * 
		 * System.out.println("join_list : "+ ((ArrayList<String>)
		 * joinvacVacData.get(i)).get(j)); list.add(((ArrayList<String>)
		 * joinvacVacData.get(i)).get(j));
		 * 
		 * } }
		 */
		
		for(Object obj : joinvacVacData) {
			System.out.println( "! : "+((ArrayList<String>) obj).get(1));
			
			for(String st :(ArrayList<String>) obj) {
				System.out.println(st);
			}
		}
		
		System.out.println("checkRes : "+checkRes);
		System.out.println("checkSubRes : "+checkSubRes);
		
		RequestDispatcher view = null;
		if(hp != null) {
			view = request.getRequestDispatcher(
					"views/reservation/detail_reservation.jsp");
			
			request.setAttribute("hp", hp);
			request.setAttribute("checkRes", checkRes);
			request.setAttribute("mb", mb);
			request.setAttribute("checkSubRes", checkSubRes);
			request.setAttribute("list_resTime", list_resTime);
			request.setAttribute("joinvacVacData", joinvacVacData);
			
			view.forward(request, response);
		}else {
			view = request.getRequestDispatcher(
					"views/common/error.jsp");
			request.setAttribute("message", 
					reg_bus_no + "번 병원 조회 실패!");
			view.forward(request, response);
		}
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
	}

}
