package news.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import news.model.service.NewsService;
import news.model.vo.News;

/**
 * Servlet implementation class indexReservation
 */
@WebServlet("/newslet")
public class newsListServlet extends HttpServlet {
	private static final long serialVersionUID = 128L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public newsListServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//
		NewsService nservice = new NewsService();

		ArrayList<News> news = nservice.selectAllNews();

		System.out.println(news.get(1).getTitle());
		
		// return result;
		int currentPage = 1;

		// 전송 온 페이지 값이 있다면 추출
		if (request.getParameter("page") != null) {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}

		// 한 페이지당 출력할 목록 갯수 지정
		int limit = 4;

		// 요청한 페이지의 출력될 목록의 행번호를 계산
		// 한 페이지에 출력할 목록 개수가 4개인 경우
		// 3page 가 요청되었다면 행번호는 9~12행.
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;

		// 뷰 페이지로 같이 내보낼 페이지 관련 숫자 계산 처리
		// 총 페이지 수 : 총 목록이 22개인 경우
		// 한 페이지에 출력할 목록이 10개이면, 페이지는 3임
		int maxPage = (int) ((double) news.size() / limit + 0.9);

		// 뷰에 출력할 페이지그룹의 시작 페이지 지정
		// 뷰 목록 아래쪽에 페이지 숫자를 10개를 출력한다면..
		// 현재 페이지가 3페이지이면, 페이지 그룹은 1~10 이 됨
		// 현재 페이지가 15페이지이면, 페이지 그룹은 11~20이 됨
		int startPage = (((int) ((double) currentPage / limit + 0.9)) - 1) * limit + 1;
		int endPage = startPage + limit - 1;
		// 병원 목록 정렬 옵션
		String orderopt = request.getParameter("list_order");
		System.out.println("정렬" + orderopt);

		// 뷰 지정해서 내보내기
		RequestDispatcher view = null;
		if (news.size() > 0) {
			view = request.getRequestDispatcher("views/information/information.jsp");

			request.setAttribute("news", news);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("maxPage", maxPage);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("listCount", news.size());
			request.setAttribute("startRow", startRow);
			request.setAttribute("endRow", endRow);

			view.forward(request, response);
		} else {
			view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", " 페이지에 대한 뉴스 조회 실패..");
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
/*
 * hp.setRemain(vd.getRemain());// } } }
 * 
 * result.append("["); for(int i=0;i<hps.size();i++) {
 * result.append("{reg_bus_no:\""+hps.get(i).getReg_bus_no()+"\", hp_name:\""
 * +hps.get(i).getHp_name()+"\", hp_address:\""+hps.get(i).getHp_address()
 * +"\", hp_phone:\""+hps.get(i).getHp_phone()+"\", hp_latitude:\""+hps.get(i).
 * getHp_latitude()+"\", hp_longitude:\""+hps.get(i).getHp_longitude()
 * +"\", remain:\""+hps.get(i).getHp_latitude() ); } return result; } }
 */
