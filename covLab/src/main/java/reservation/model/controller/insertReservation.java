package reservation.model.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import reservation.model.service.reservationService;
import reservation.model.vo.Reservation;

/**
 * Servlet implementation class insertReservation
 */
@WebServlet("/insertres")
public class insertReservation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public insertReservation() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		System.out.println("----------------------------------인서트-------------------------------");

		request.setCharacterEncoding("utf-8");
		
		Reservation res = new Reservation();
		reservationService rservice = new reservationService();
		
//		HttpSession session = request.getSession(true);
//		String user_id = (String) session.getAttribute("user_id");
		
		//날짜 받아오고 timestamp로 담기 위한 변환을 위해 가공
		System.out.println("ioc_date :"+request.getParameter("ioc_date"));
		String date = request.getParameter("ioc_date")+":00";
		System.out.println("date : "+ date);
		Timestamp ioc_date = Timestamp.valueOf(date);
		System.out.println("timestamp : " + ioc_date);
//		
//		SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd HH:mm:ss");
//		String d2 = sdf.format(date);

		/*
		 * endDate = (Timestamp)sdf.parse(date); res.setRev_date(endDate);
		 * System.out.println("날짜 : "+endDate);
		 */
			// TODO Auto-generated catch block
//		System.out.println("user_id"+user_id);
//		Members mb = rservice.selectOneMember(user_id);
		
		
		res.setSerial_num(request.getParameter("serial_num"));
		res.setReg_bus_no(request.getParameter("reg_bus_no"));
		res.setIoc_date(ioc_date);
		res.setUser_rn(request.getParameter("user_rn"));
		
		//등록 타입
		String resType = request.getParameter("resType");
		
		System.out.println("시리얼 넘버 : "+res.getSerial_num());
		System.out.println("사업자 번호 : "+res.getReg_bus_no());
		System.out.println("예약 날짜 : "+res.getIoc_date());
		System.out.println("등록자 주민번호 : "+request.getParameter("user_rn"));
		
		
		if(resType.equals("self")){
			res.setSub_ok("N");
			System.out.println("sub OK : "+res.getSub_ok());
			
		}else {
			res.setSub_ok("Y");
			System.out.println("sub OK : "+res.getSub_ok());
			
		}

		//int checkRes = rservice.checkReservation(res.getUser_rn());
		
		int result = rservice.insertReservation(res);
		
		System.out.println("결과 : "+result);
		
		RequestDispatcher view = null;
		
		if(result >0) {
			System.out.println("성공");
			view = request.getRequestDispatcher(
//					"views/reservation/index_reservation.jsp");
//			view.forward(request, response);
					"views/reservation/complete.jsp");
			String pageType = "insertSuccess";
			request.setAttribute("pageType", pageType);
			view.forward(request, response);
			
		}else {
			System.out.println("실패");
			view = request.getRequestDispatcher(
					"views/common/error.jsp");
			request.setAttribute("message", 
					"등록 실패!");
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
