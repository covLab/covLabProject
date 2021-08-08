package board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;

/**
 * Servlet implementation class BoardRecommendServlet
 */
@WebServlet("/brecommend")
public class BoardRecommendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardRecommendServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 게시글 추천 처리용 컨트롤러
		int boardNo = Integer.parseInt(request.getParameter("bno"));
		int currentPage = Integer.parseInt(request.getParameter("page"));
		
		BoardService bservice = new BoardService();
		int result = 0;
		
		Cookie[] cookies = request.getCookies();
		int recommended =0;
		
		for (Cookie cookie : cookies) {
			System.out.println(cookie.getName());
			if(cookie.getName().equals("recommend")) {
				recommended = 1;
		
				if(cookie.getValue().contains(request.getParameter("bno"))) {
				}else {
					cookie.setValue(cookie.getValue()+"_"+request.getParameter("bno"));
					response.addCookie(cookie);
					result = bservice.updateRecommend(boardNo);
				}
			}
		}
		if(recommended ==0 ) {
			Cookie cookie1 = new Cookie("recommend", request.getParameter("bno"));
			response.addCookie(cookie1);
			result = bservice.updateRecommend(boardNo);
		}
		if(result > 0) {
			response.sendRedirect("/semi/bdetail?bno="+boardNo+"&page="+currentPage);
		}else {
			RequestDispatcher view = request.getRequestDispatcher("views/board/boardError.jsp");
			request.setAttribute("message", "추천은 한번만 가능합니다.");
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
