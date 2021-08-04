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
 * Servlet implementation class insertSubMemInfo
 */
@WebServlet("/insertsub")
public class insertSubMemInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public insertSubMemInfo() {
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
		System.out.println("인서트 서브밋");
		HttpSession session = request.getSession(true);
		String user_id = (String) session.getAttribute("user_id");
		
		String vac_name = request.getParameter("vac_name");
		System.out.println("vac_name : "+vac_name);
		
		//테스트용 reg_bus_no 받아오기
		String reg_bus_no = request.getParameter("reg_bus_no");
		System.out.println("reg_bus_no : "+reg_bus_no);
		
		//테스트용 날짜 데이터 받아오기
		String ioc_date = request.getParameter("ioc_date");
		
		//테스트용 서브유저 no
		String sub_user_no = request.getParameter("sub_user_no");
		System.out.println("sub_user_no : "+sub_user_no);

//		String date = request.getParameter("rev_date"); 
//		Timestamp rev_date =Timestamp.valueOf(date);
		
		String serial_num = rservice.selectSerialNum(vac_name, reg_bus_no);
		
		//mb 객체에 유저 정보 담기
		Members mb = rservice.selectOneMember(user_id);
		
		//vac 객체에 백신 정보 담기
		System.out.println("serial_num2 : "+serial_num);
		Vaccine vac = rservice.selectOneVac(serial_num);
		
		//hp 객체에 기관 정보 담기
		System.out.println("reg2 : "+reg_bus_no);
		Hospital hp = rservice.selectOneHp(reg_bus_no);
		
		System.out.println("-------hp 객체 확인(인서트)------");
		
		request.setAttribute("hp", hp);
		request.setAttribute("mb", mb);
		request.setAttribute("vac", vac);
		request.setAttribute("ioc_date", ioc_date);
		
		RequestDispatcher view = null;
		view = request.getRequestDispatcher(
				"views/reservation/termsPopupPage.jsp");
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
