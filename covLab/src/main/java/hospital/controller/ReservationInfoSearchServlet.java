package hospital.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hospital.model.service.HospitalService;
import hospital.model.vo.ReservationInfo;

/**
 * Servlet implementation class ReservationInfoSearchServlet
 */
@WebServlet("/risearch")
public class ReservationInfoSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationInfoSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 병원에서 확인하는 예약내역 검색 처리용 컨트롤러
		request.setCharacterEncoding("utf-8");
		
		String sCondition = request.getParameter("searchCondition");
		String sKeyword = request.getParameter("searchKeyword");
		System.out.println("searchCondition : "+sCondition);
		System.out.println("searchKeyword : "+sKeyword);
		
		int currentPage = 1;
		if (request.getParameter("page") != null) {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}

		int limit = 10;

		HospitalService hservice = new HospitalService();
		int listCount = hservice.getSearchListCount(sCondition, sKeyword);
		System.out.println("총 목록개수 : "+listCount);
		
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;

		ArrayList<ReservationInfo> list = hservice.selectSearchList(startRow, endRow, sCondition, sKeyword);
		
		int maxPage = (int) ((double) listCount / limit + 0.9);

		int startPage = (((int) ((double) currentPage / limit + 0.9)) - 1) * limit + 1;
		int endPage = startPage + limit - 1;

		if (maxPage < endPage) {
			endPage = maxPage;
		}

		// 뷰 지정해서 내보내기
		RequestDispatcher view = null;
		if (list.size() > 0) {
			view = request.getRequestDispatcher("views/hospital/reservationSearchListView.jsp");

			request.setAttribute("list", list);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("maxPage", maxPage);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("listCount", listCount);
			request.setAttribute("sCondition", sCondition);
			request.setAttribute("sKeyword", sKeyword);

			view.forward(request, response);
		} else {
			view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", currentPage + " 페이지에 대한 검색 목록 조회 실패..");
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
