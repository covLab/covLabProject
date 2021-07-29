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
 * Servlet implementation class CommentWriteServlet
 */
@WebServlet("/cwrite")
public class CommentWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentWriteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//ajax 를 통해 전송온 값 꺼내기 : post
		//1. 전송온 값에 한글이 있으며 인코딩 처리함
		request.setCharacterEncoding("utf-8");
		
		//2. 전송온 값 꺼내서 변수 | 객체에 기록 저장
		int boardNo = Integer.parseInt(request.getParameter("bno"));
		int currentPage = Integer.parseInt(request.getParameter("page"));
		
		CommentsService cservice = new CommentsService();
		Comments comments = new Comments();
		
		comments.setComWriter(request.getParameter("writer"));
		comments.setComContent(request.getParameter("content"));
		comments.setBoardRef(boardNo);
		//댓글 레벨을 어쩌죠..
		//comments.setComLevel()
		
		int result = cservice.insertComments(comments);
		
		
		if(result > 0 ) {
			response.sendRedirect("/semi/bdetail?bno="+boardNo+"&page="+currentPage);
		}else {
			RequestDispatcher view = request.getRequestDispatcher("views/common/error.jsp");
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
