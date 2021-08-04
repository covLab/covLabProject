package member.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.servcie.MemberService;
import member.model.vo.Member;
import reservation.model.service.reservationService;
import reservation.model.vo.Reservation;

/**
 * Servlet implementation class MemberSearchServlet
 */
@WebServlet("/msearch")
public class MemberSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MemberSearchServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		String action = request.getParameter("action");
		String keyword = request.getParameter("keyword");
		String beginDate = null, endDate = null;
		int listCount =0;

		System.out.println("action : " + action);
		System.out.println("keyword : " + keyword);
		
		MemberService mservice = new MemberService();
		
		// 페이징처리
		int currentPage = 1;
		if (request.getParameter("page") != null) {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}

		int limit = 10;
		if(action.equals("reg_date")) {
			beginDate = request.getParameter("begin");
			endDate = request.getParameter("end");
//			listCount = mservice.getSearchListCount(action, keyword, beginDate, endDate);
		}else {
		listCount = mservice.getSearchListCount(action, keyword);
		}
		System.out.println("listCount : "+listCount);
		
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		
		ArrayList<Member> list = null;

		
		int maxPage = (int) ((double) listCount / limit + 0.9);
		int startPage = (((int) ((double) currentPage / limit + 0.9)) - 1) * limit + 1;
		int endPage = startPage + limit - 1;

		if (maxPage < endPage) {
			endPage = maxPage;
		}
		System.out.println(startRow + ", " + endRow + ", " + maxPage + ", " + startPage + ", " + endPage);
		System.out.println(action+", "+keyword);

		switch (action) {
		case "no":
			list = mservice.selectSearchUserNo(startRow, endRow, keyword);
			break;
		case "name":
			list = mservice.selectSearchUserName(startRow, endRow, keyword);
			break;
		case "gender":
			list = mservice.selectSearchGender(startRow, endRow, keyword);
			break;
		case "age":
			list = mservice.selectSearchAge(startRow, endRow, Integer.parseInt(keyword));
			break;
		case "reg_date":
//			list = mservice.selectSearchRegDate(startRow, endRow, Date.valueOf(beginDate), Date.valueOf(endDate));
			break;
		case "logintype":
			list = mservice.selectSearchLoginType(startRow, endRow, keyword);
			break;
		}

		
		
		ArrayList<Reservation> rlist = new reservationService().selectList();

		RequestDispatcher view = null;
		if (list.size() > 0) {
			view = request.getRequestDispatcher("views/member/memberListView.jsp");
			request.setAttribute("list", list);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("maxPage", maxPage);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("listCount", listCount);
			request.setAttribute("rlist", rlist);
			view.forward(request, response);
		} else {
			view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", action + " 검색에 대한 " + keyword + " 결과가 존재하지 않습니다...");
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
