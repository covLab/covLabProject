package board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.Board;

/**
 * Servlet implementation class BoardUpdateServlet
 */
@WebServlet("/bupdate")
public class BoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		request.setCharacterEncoding("utf-8");
		

		Board board = new Board();

		board.setBoardNo(Integer.parseInt(request.getParameter("bno")));
		board.setBoardTitle(request.getParameter("title"));
		board.setBoardWriter(request.getParameter("writer"));
		board.setBoardContent(request.getParameter("content"));
		
		int currentPage = Integer.parseInt(request.getParameter("page"));

		System.out.println(board);
		
		int result = new BoardService().updateBoard(board);

		
		if (result > 0) {
			
			//response.sendRedirect("blist?page="+currentPage);
			
			
			response.sendRedirect("bdetail?bno=" + board.getBoardNo() +"&page="+currentPage);
			
		} else {
			RequestDispatcher view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", board.getBoardNo() + "번 글 수정 실패..");
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