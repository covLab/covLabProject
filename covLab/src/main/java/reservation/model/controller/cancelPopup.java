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

import member.model.vo.Member;
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
		
		//테스트용 세션 받아오기
		HttpSession session = request.getSession(true);
		
		/*테스트용 세션 생성*/
		Member mbs = (Member) session.getAttribute("loginMember");
		String user_id = mbs.getUserId();
		//기관 번호 받아오기
		String reg_bus_no = request.getParameter("reg_bus_no");
		System.out.println("reg_bus_no : "+reg_bus_no);
		
		//버튼 타입(대리인지 아닌지)
		String resType = request.getParameter("resType");
		
//		String date = request.getParameter("rev_date"); 
//		Timestamp rev_date =Timestamp.valueOf(date);
		
		
		Members mb = rservice.selectOneMember(user_id);
		
		RequestDispatcher view = null;
		
		String sub_ok = "N";
		if(resType.equals("sub")) {
			
			sub_ok = "Y";
			// 서브 유저 추출을 위한 부모 유저의 user_no 추출
			int user_no = mb.getUserNo();
			
			//해당 아이디의 대리 유저들 List 생성
			ArrayList<Members> mb_list = rservice.selectOneSubUserRn(user_no);
			
			for(Members sub_mb : mb_list) {
				
				//대리 유저의 예약 여부 확인
				int subResCheck = rservice.checkSubReservation(sub_mb.getUserRn());
				
				//대리 예약 내역이 있다면
				if(subResCheck > 0) {
					
					//첫번째 정보만 담아서 mb에 담는다
					mb = rservice.selectOneSubMember(sub_mb.getUserRn());
					break;
					
				} /*
					 * else { view = request.getRequestDispatcher( "views/common/error.jsp");
					 * request.setAttribute("message", "예약중인 대리 유저 없음!"); view.forward(request,
					 * response); }
					 */
			}
		}

		
		Reservation res = rservice.selectOneResByUserRn(mb.getUserRn(), sub_ok, reg_bus_no);
		
		Vaccine vac = rservice.selectOneVac(res.getSerial_num());
		Hospital hp = rservice.selectOneHp(reg_bus_no);
		
		
		request.setAttribute("mb", mb);
		request.setAttribute("vac", vac);
		request.setAttribute("hp", hp);
		request.setAttribute("res", res);
		
		
		view = request.getRequestDispatcher(
				"views/reservation/cancelPopupPage.jsp");
		
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
