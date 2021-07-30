package reservation.model.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import reservation.model.service.reservationService;
import reservation.model.vo.Hospital;
import reservation.model.vo.VaccineData;

/**
 * Servlet implementation class indexReservation
 */
@WebServlet("/indexres")
public class indexReservation extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public indexReservation() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		/*
		 * response.getWriter().append("Served at: ").append(request.getContextPath());
		 */
		//병원용 서비스 객체 생성
		reservationService rservice = new reservationService();
		
		List<Hospital> hps = rservice.selectAllHps();
		List <VaccineData> vds=rservice.selectAllVds();
		
		RequestDispatcher view = null;
		if (hps.size() > 0 && vds.size()>0) {
			view = request.getRequestDispatcher("views/reservation/index_reservation1.jsp");

			request.setAttribute("hps", hps);
			request.setAttribute("vds", vds);
//			request.setAttribute("hp_name", hp_name);

			view.forward(request, response);
		} else {
			view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message",  " 페이지에 대한 병원 조회 실패..");
			view.forward(request, response);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
