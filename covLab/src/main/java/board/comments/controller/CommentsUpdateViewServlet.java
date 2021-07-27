package board.comments.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.comments.model.service.CommentsService;
import board.comments.model.vo.Comments;

/**
 * Servlet implementation class CommentsUpdateViewServlet
 */
@WebServlet("/cupview")
public class CommentsUpdateViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentsUpdateViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int boardRef = Integer.parseInt(request.getParameter("bno"));
		int currentPage = Integer.parseInt(request.getParameter("page"));
		int comNo = Integer.parseInt(request.getParameter("cno"));
		int comLevel = Integer.parseInt(request.getParameter("clevel"));
		
		Comments comments = new CommentsService().selectComment(comNo);
		
		RequestDispatcher view = null;
		if(comments != null) {
			view = request.getRequestDispatcher("views/board/commentsUpdateView.jsp");
			request.setAttribute("comments", comments);
			request.setAttribute("page", currentPage);
			request.setAttribute("comNo", comNo);
			request.setAttribute("comLevel", comLevel);
			
			view.forward(request, response);
		} else {
			view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", boardRef+"번째 글 댓글번호 "+comNo+"번 수정 실패...");
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
