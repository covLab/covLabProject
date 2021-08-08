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
 * Servlet implementation class CommentsReplyWriteServlet
 */
@WebServlet("/creplywrite")
public class CommentsReplyWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentsReplyWriteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//답글 등록
		
		//1. 전송온 값에 한글이 있으며 인코딩 처리함
		request.setCharacterEncoding("utf-8");
		
		//2. 전송온 값 꺼내서 변수 | 객체에 기록 저장
		int boardNo = Integer.parseInt(request.getParameter("bno"));
		int currentPage = Integer.parseInt(request.getParameter("page"));
		int comLevel =Integer.parseInt(request.getParameter("cno"));
		
		Comments comments = new Comments();
		
		comments.setComWriter(request.getParameter("writer"));
		comments.setComContent(request.getParameter("content"));
		comments.setBoardRef(boardNo);
		comments.setComLevel(comLevel);
		
		System.out.println("comment : "+comments);
		
		CommentsService cservice = new CommentsService();
		int result = cservice.insertReplyComments(comments);
		
		if(result > 0 ) {
			response.sendRedirect("/semi/bdetail?bno="+boardNo+"&page="+currentPage);
		}else {
			RequestDispatcher view = request.getRequestDispatcher("views/board/boardError.jsp");
			request.setAttribute("message", boardNo+"번 게시글 댓글 등록 실패...");
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
