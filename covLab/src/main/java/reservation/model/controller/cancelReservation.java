package reservation.model.controller;

import java.io.IOException;
import java.sql.Timestamp;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import reservation.model.service.reservationService;
import reservation.model.vo.Reservation;

/**
 * Servlet implementation class cancelReservation
 */
@WebServlet("/cancelres")
public class cancelReservation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public cancelReservation() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		
		request.setCharacterEncoding("utf-8");
		System.out.println("c res");
		Reservation res = new Reservation();
		reservationService rservice = new reservationService();
		
		String date = request.getParameter("rev_date");
		Timestamp rev_date = Timestamp.valueOf(date);
		
		res.setSerial_num(request.getParameter("serial_num"));
		res.setReg_bus_no(request.getParameter("reg_bus_no"));
		res.setRev_date(rev_date);
		res.setUser_rn(request.getParameter("user_rn"));
		System.out.println("user_rn"+res.getUser_rn());
		int result = rservice.deleteReservation(res.getUser_rn());
		
		System.out.println("삭제 결과 : "+result);
		RequestDispatcher view = null;
		
		if(result == 1) {
			view = request.getRequestDispatcher(
					"views/reservation/complete.jsp");
			
			view.forward(request, response);
		}else {
			view = request.getRequestDispatcher(
					"views/reservation/complete.jsp");
			request.setAttribute("message", 
					res.getUser_rn() + "예약 취소 실패!");
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
