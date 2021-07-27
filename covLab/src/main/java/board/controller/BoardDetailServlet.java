package board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.comments.model.service.CommentsService;
import board.comments.model.vo.Comments;
import board.model.service.BoardService;
import board.model.vo.Board;

/**
 * Servlet implementation class BoardDetailServlet
 */
@WebServlet("/bdetail")
public class BoardDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BoardDetailServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		int boardNo = Integer.parseInt(request.getParameter("bno"));
		
		int currentPage = 1;
		if (request.getParameter("page") != null) {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}


		BoardService bservice = new BoardService();

		bservice.addReadCount(boardNo);

		Board board = bservice.selectBoard(boardNo);
		//System.out.println(board);
		
		CommentsService cservice = new CommentsService();
		ArrayList<Comments> clist = cservice.selectComments(boardNo);

		Comments comments = cservice.selectRef(boardNo);
		//System.out.println(comments);
		System.out.println("clist : "+clist);
		System.out.println("commnts : "+comments);
		
		RequestDispatcher view = null;
		if (board != null) {
			view = request.getRequestDispatcher("views/board/boardDetailView.jsp");
			request.setAttribute("board", board);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("clist", clist);
			if(comments!=null) {
			request.setAttribute("comments", comments);
			}
			view.forward(request, response);
		} else {
			view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", boardNo + "번 글 상세조회 실패..");
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