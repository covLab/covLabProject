package reservation.model.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;

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
import reservation.model.vo.Vaccine;

/**
 * Servlet implementation class termsPopup
 */
@WebServlet("/cpop")
public class cancelPopup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public cancelPopup() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("utf-8");
		//서비스 생성
		reservationService rservice = new reservationService();
		System.out.println("------------예약 취소 서블릿-------------");
		System.out.println("유저번호 :"+request.getParameter("user_no"));
		//테스트용 세션 받아오기
		HttpSession session = request.getSession(true);
		String user_id = (String) session.getAttribute("user_id");
		
		// 테스트용 시리얼 넘버 받아오기
		String serial_num = request.getParameter("serial_num");
		System.out.println("serial_num : "+serial_num);
		
		//테스트용 reg_bus_no 받아오기
		String reg_bus_no = request.getParameter("reg_bus_no");
		System.out.println("reg_bus_no : "+reg_bus_no);
		
		//테스트용 날짜 데이터 받아오기
		String ioc_date = request.getParameter("ioc_date");
		

//		String date = request.getParameter("rev_date"); 
//		Timestamp rev_date =Timestamp.valueOf(date);
		
		
		Members mb = new Members();
		Vaccine vac = rservice.selectOneVac(serial_num);
		Hospital hp = rservice.selectOneHp(reg_bus_no);
		
		RequestDispatcher view = null;
		
		String resType =request.getParameter("resType");
		System.out.println("cPop resType : "+resType);
		if(resType.equals("self")) {
			
			mb = rservice.selectOneMember(user_id);
		}else {
			int user_no = Integer.parseInt(request.getParameter("user_no").toString());
			ArrayList<Members> mb_list = rservice.selectOneSubUserRn(user_no);
			
			for(Members sub_mb : mb_list) {
				
				System.out.println("sub_mb.getUserRn() : "+sub_mb.getUserRn());
				
				int subResCheck = rservice.checkSubReservation(sub_mb.getUserRn());
				System.out.println("subResCheck :"+subResCheck);
				
				if(subResCheck > 0) {
					mb = rservice.selectOneSubMember(sub_mb.getUserRn());
					break;
					
				} /*
					 * else { view = request.getRequestDispatcher( "views/common/error.jsp");
					 * request.setAttribute("message", "예약중인 대리 유저 없음!"); view.forward(request,
					 * response); }
					 */
			}
		}

		view = request.getRequestDispatcher(
				"views/reservation/cancelPopupPage.jsp");
		
		request.setAttribute("mb", mb);
		request.setAttribute("vac", vac);
		request.setAttribute("hp", hp);
		request.setAttribute("ioc_date", ioc_date);
		
		view.forward(request, response);
		
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
