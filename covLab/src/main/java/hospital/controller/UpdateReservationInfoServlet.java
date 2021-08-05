package hospital.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hospital.model.service.HospitalService;
import hospital.model.vo.ReservationInfo;


/**
 * Servlet implementation class UpdateReservationInfoServlet
 */
@WebServlet("/uprinfo")
public class UpdateReservationInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateReservationInfoServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 관리자용 게시글 삭제 처리용 컨트롤러
		request.setCharacterEncoding("utf-8");

		int userNo = Integer.parseInt(request.getParameter("userno"));
		System.out.println("userno : "+userNo);
		
		// 출력할 페이지 작성
		int currentPage = 1;
		// 전송온 페이지 값이 있다면 추출
		if (request.getParameter("page") != null) {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}

		ReservationInfo ri = new ReservationInfo();
		ri.setUserNo(userNo);
		ri.setInoCnt(Integer.parseInt(request.getParameter("inocnt")));
		System.out.println("ri at servlet : "+ri);
		
		int result = new HospitalService().updateReservationInfo(ri);
		if (result > 0) {
			response.sendRedirect("/semi/rinfolist?page=" + currentPage);
		} else {
			RequestDispatcher view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", userNo + "번 회원 종종 상태 업데이트 실패..");
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
