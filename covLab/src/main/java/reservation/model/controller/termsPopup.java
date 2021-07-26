package reservation.model.controller;

import java.io.IOException;
import java.sql.Timestamp;

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
@WebServlet("/tpop")
public class termsPopup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public termsPopup() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("utf-8");
		System.out.println("------약관 팝업 서블릿------");
		//서비스 생성
		reservationService rservice = new reservationService();
		Members mb = new Members();
		
		//테스트용 세션 받아오기
		HttpSession session = request.getSession(true);
		String user_id = (String) session.getAttribute("user_id");
		
		// 테스트용 시리얼 넘버 받아오기
		String serial_num = request.getParameter("serial_num");
		System.out.println("serial_num : "+serial_num);
		
		//테스트용 reg_bus_no 받아오기
		String reg_bus_no = request.getParameter("reg_bus_no");
		System.out.println("reg_bus_no : "+reg_bus_no);
//		
		int sub_user_no = Integer.parseInt(request.getParameter("sub_user_no").toString());
		System.out.println("sub_user_no : "+sub_user_no);
		//테스트용 날짜 데이터 받아오기
		String ioc_date = request.getParameter("ioc_date");
		
		mb = rservice.selectOneMember(user_id);
		Members sub_mb = rservice.selectOneSubMember(sub_user_no);
		
		//vac 객체에 백신 정보 담기
		System.out.println("serial_num2 : "+serial_num);
		Vaccine vac = rservice.selectOneVac(serial_num);
		
		//hp 객체에 기관 정보 담기
		System.out.println("reg2 : "+reg_bus_no);
		Hospital hp = rservice.selectOneHp(reg_bus_no);
		
		System.out.println("user_id2 : "+user_id);
		
		RequestDispatcher view = null;
		
		
		if(!request.getParameter("sub_user_name").equals("null")) {
			String user_name = request.getParameter("sub_user_name");
			String user_rn = request.getParameter("sub_user_rn");	
			String user_address = request.getParameter("sub_user_address");
			String user_phone = request.getParameter("sub_user_phone");
			
			
			System.out.println("user_name : "+mb.getUserName().getClass().getName());
			System.out.println("user_rn : "+mb.getUserRn());
			System.out.println("user_address : "+mb.getUserAddress());
			System.out.println("user_phone : "+mb.getUserPhone());
			
			int result = rservice.insertSubMember(sub_user_no, mb);
			
			if(result >0) {
				request.setAttribute("sub_user_no", sub_user_no);
				
			}else {
				view = request.getRequestDispatcher(
						"views/common/error.jsp");
				request.setAttribute("message", 
						sub_user_no + "대리유저 회원가입 실패!");
				view.forward(request, response);
			}
		}else {
			mb = rservice.selectOneMember(user_id);
			
			request.setAttribute("hp", hp);
			request.setAttribute("vac", vac);
			request.setAttribute("ioc_date", ioc_date);
			request.setAttribute("mb", mb);
			request.setAttribute("sub_user_no", sub_user_no);
			
			
			if(mb!=null) {
				
				view = request.getRequestDispatcher(
						"views/reservation/termsPopupPage.jsp");
				view.forward(request, response);
			}else {
				view = request.getRequestDispatcher(
						"views/common/error.jsp");
				request.setAttribute("message", 
						user_id + "유저 데이터 불러오기 실패!");
				view.forward(request, response);
			}
		}
		int checkRes = rservice.checkReservation(mb.getUserRn());
		int checkSubRes = rservice.checkSubReservation(sub_mb.getUserRn());
		
			
//			mb.setUserName(request.getParameter("user_name").toString());
//			mb.setUserRn(request.getParameter("user_rn").toString());
//			mb.setUserAddress(request.getParameter("user_address").toString());
//			mb.setUserPhone(request.getParameter("user_phone").toString());
			
			
			
			
				
			
//		String date = request.getParameter("rev_date"); 
//		Timestamp rev_date =Timestamp.valueOf(date);
				
	}
		
		

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
