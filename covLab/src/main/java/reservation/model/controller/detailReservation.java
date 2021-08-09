package reservation.model.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

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
import reservation.model.vo.Vaccine_Data;


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

		request.setCharacterEncoding("utf-8");
		
		reservationService rservice = new reservationService();
		
		
		System.out.println("-----------------------디테일 서블릿----------------------------");
		String reg_bus_no = request.getParameter("reg_bus_no");
		System.out.println("reg_bus_no : " + reg_bus_no);
		String lat = request.getParameter("lat");
		String lng = request.getParameter("lng");
		
		HttpSession session = request.getSession(true);
		
		/*테스트용 세션 생성*/
		Member mbs = (Member) session.getAttribute("loginMember");
		String user_id = mbs.getUserId();
		
		//session.setAttribute("user_id", "user00");
		
		//세션 아이디 설정
		//String user_id = (String) session.getAttribute("user_id");
		
		Members mb = rservice.selectOneMember(user_id);
		System.out.println("user_id : "+user_id);
		String user_rn = mb.getUserRn();
		
		System.out.println("user_rn : "+user_rn);
		
		
		//병원 정보 가져오기
		Hospital hp = rservice.selectOneHp(reg_bus_no);
		
		
		String sub_ok = "N";
		Reservation resByUserRn = rservice.selectOneResByUserRn(user_rn, sub_ok, reg_bus_no);
		request.setAttribute("resByUserRn", resByUserRn);
		int checkResByUserRn = rservice.cehckOneResByUserRn(user_rn,reg_bus_no);
		request.setAttribute("checkResByUserRn", checkResByUserRn);
		// 대리예약 정보 가져오기 위한 대리유저 정보
		ArrayList<Members> sub_list = rservice.selectOneSubUserRn(mb.getUserNo());
		
		int checkRes = rservice.checkReservation(user_rn);
		int checkSubRes = 0;
		int checkResBySubUserRn =0;
		int user_no = 0;
		Reservation resBySubUserRn = new Reservation();
		System.out.println("sub_list.size() : " + sub_list.size());
		
		if(sub_list.size() > 0) {
			for(Members sub_mb : sub_list) {
				System.out.println("sub_mb.getUserRn() : "+sub_mb.getUserRn());
				sub_ok = "Y";
				
				user_no = sub_mb.getSubUserNo();
				checkSubRes = rservice.checkSubReservation(sub_mb.getUserRn());
				resBySubUserRn = rservice.selectOneResByUserRn(sub_mb.getUserRn(), sub_ok, reg_bus_no);
				
				System.out.println("sub_mb.getUserRn() :"+sub_mb.getUserRn());
				checkResBySubUserRn = rservice.cehckOneResBySubUserRn(sub_mb.getUserRn(),reg_bus_no);
				
				if(checkSubRes >0) {
					break;
				}
			}
		}
		
		request.setAttribute("user_no", user_no);
		request.setAttribute("checkResBySubUserRn", checkResBySubUserRn);
		request.setAttribute("resBySubUserRn", resBySubUserRn);
		System.out.println("resBySubUserRn : "+resBySubUserRn);
		
		
		ArrayList<Reservation> list_resTime = rservice.selectTimeRes(reg_bus_no);
		
		System.out.println("list_resTime :" + list_resTime.size());
		
		for(Reservation rdate : list_resTime) {
			System.out.println("rdate : "+rdate.getIoc_date());
		}
		
//		String serialNumVac = rservice.selectSericalNumVaccineData(reg_bus_no);
		ArrayList<Object> joinvacVacData = rservice.joinvacVacName(reg_bus_no);
		
		for(Object obj : joinvacVacData) {
			System.out.println( "! : "+((ArrayList<String>) obj).get(1));
			
			for(String st :(ArrayList<String>) obj) {
				System.out.println(st);
			}
		}
		

		System.out.println("checkRes : "+checkRes);
		System.out.println("checkSubRes : "+checkSubRes);
		
		RequestDispatcher view = null;
		
		System.out.println("hp : "+hp);
		if(hp != null) {
			view = request.getRequestDispatcher(
					"views/reservation/detail_reservation.jsp");
			
			request.setAttribute("hp", hp);
			request.setAttribute("checkRes", checkRes);
			request.setAttribute("mb", mb);
			request.setAttribute("checkSubRes", checkSubRes);
			request.setAttribute("list_resTime", list_resTime);
			request.setAttribute("joinvacVacData", joinvacVacData);
			request.setAttribute("lat", lat);
			request.setAttribute("lng", lng);
			
			view.forward(request, response);
		}else {
			view = request.getRequestDispatcher(
					"views/reservation/error.jsp");
			String pageType = "hpInquireError";
			request.setAttribute("pageType", pageType);
			view.forward(request, response);
		}
		
		
	}

	/*
	 * public String regbusno(String reg_bus_no) { mo }
	 */
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
	}

}
