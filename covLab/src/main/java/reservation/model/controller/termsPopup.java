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
		
//		mb = rservice.selectOneMember(user_id);
//		Members sub_mb = rservice.selectOneSubMember(sub_user_no);
			
		
		//vac 객체에 백신 정보 담기
		Vaccine vac = rservice.selectOneVac(serial_num);
		
		//hp 객체에 기관 정보 담기
		Hospital hp = rservice.selectOneHp(reg_bus_no);
		
		//mb 정보 객체 생성
		Members mb = new Members();
		
		//버튼 타입
		String resType = request.getParameter("resType");
		System.out.println("resType : "+resType);
		//user_no 받아오기
		int user_no = Integer.parseInt(request.getParameter("user_no").toString());
		
		RequestDispatcher view = null;
		
		if(resType.equals("self")) {
			mb = rservice.selectOneMember(user_id);
					
		}else {
				String user_name = request.getParameter("sub_user_name");
				String user_rn = request.getParameter("sub_user_rn");	
				String user_address = request.getParameter("sub_user_address");
				String user_phone = request.getParameter("sub_user_phone");
				
				mb.setUserName(user_name);
				mb.setUserRn(user_rn);
				mb.setUserAddress(user_address);
				mb.setUserPhone(user_phone);
				
				
				System.out.println("user_name : "+mb.getUserName());
				System.out.println("user_rn : "+mb.getUserRn());
				System.out.println("user_address : "+mb.getUserAddress());
				System.out.println("user_phone : "+mb.getUserPhone());
				
				//sub 유저 데이터 삽입
				int result = rservice.insertSubMember(user_no, mb);
				System.out.println("result : "+result);
				
				if(result > 0) {
					request.setAttribute("user_no", user_no);
					
					
				}
			
		}
		
		
		request.setAttribute("hp", hp);
		request.setAttribute("vac", vac);
		request.setAttribute("ioc_date", ioc_date);
		request.setAttribute("mb", mb);
		request.setAttribute("resType", resType);
		
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
