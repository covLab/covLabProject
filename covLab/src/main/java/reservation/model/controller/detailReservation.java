package reservation.model.controller;

import java.io.Console;
import java.io.IOException;
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
		reservationService rservice = new reservationService();
		
//		String reg_bus_no = request.getParameter("reg_bus_no");
		String reg_bus_no = "252-12-62156";
		HttpSession session = request.getSession(true);
		
		/*테스트용 세션 생성*/
		session.setAttribute("user_id", "user18");
		
		//세션 아이디 설정
		String user_id = (String) session.getAttribute("user_id");
		Members mb = rservice.selectOneMember(user_id);
		String user_rn = mb.getUserRn();
		
		ArrayList<Members> sub_list = rservice.selectOneSubUserRn(mb.getUserNo());
		//병원 정보 가져오기
		Hospital hp = rservice.selectOneHp(reg_bus_no);
		int checkRes = rservice.checkReservation(user_rn);
		
		int checkSubRes = 0;
		
		System.out.println("sub_list.size() : " + sub_list.size());
		
		if(sub_list.size() > 0) {
			for(Members sub_mb : sub_list) {
				System.out.println("sub_mb.getUserRn() : "+sub_mb.getUserRn());
				checkSubRes = rservice.checkSubReservation(sub_mb.getUserRn());
				
				int sub_user_no = sub_mb.getSubUserNo();
				request.setAttribute("sub_user_no", sub_user_no);
				
				if(checkSubRes >0) {
					break;
				}
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
