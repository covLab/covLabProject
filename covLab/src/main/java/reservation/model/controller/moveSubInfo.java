package reservation.model.controller;

import java.io.IOException;

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
import reservation.model.vo.Vaccine;

/**
 * Servlet implementation class moveSubInfo
 */
@WebServlet("/movesub")
public class moveSubInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public moveSubInfo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//서비스 생성
		request.setCharacterEncoding("utf-8");
		//서비스 생성
		reservationService rservice = new reservationService();
		System.out.println("------------movesub 서블릿-------------");
		
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
		System.out.println("ioc_Date : "+ioc_date);
//		String date = request.getParameter("rev_date"); 
//		Timestamp rev_date =Timestamp.valueOf(date);
		
		// resType 받기
		String resType = request.getParameter("resType");
		
		//mb 객체에 유저 정보 담기
		System.out.println("user_id2 : "+user_id);
		Members mb = rservice.selectOneMember(user_id);
		
		//vac 객체에 백신 정보 담기
		System.out.println("serial_num2 : "+serial_num);
		Vaccine vac = rservice.selectOneVac(serial_num);
		
		//hp 객체에 기관 정보 담기
		System.out.println("reg2 : "+reg_bus_no);
		Hospital hp = rservice.selectOneHp(reg_bus_no);
		
			
		
		RequestDispatcher view = null;

		view = request.getRequestDispatcher(
				"views/reservation/insertSubMemInfo.jsp");
		
		request.setAttribute("hp", hp);
		request.setAttribute("mb", mb);
		request.setAttribute("vac", vac);
		request.setAttribute("ioc_date", ioc_date);
		request.setAttribute("resType", resType);
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
