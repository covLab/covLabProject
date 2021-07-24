@@ -1,76 +0,0 @@
package board.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import board.model.service.BoardService;
import board.model.vo.Board;

/**
 * Servlet implementation class BoardInsertServlet
 */
@WebServlet("/binsert")
public class BoardInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BoardInsertServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// �Խñ� ���

		request.setCharacterEncoding("utf-8");
		
		Board board = new Board();

		board.setBoardTitle(request.getParameter("title"));
		board.setBoardWriter(request.getParameter("writer"));
		board.setBoardContent(request.getParameter("content"));

		
		// 6. ���� �޼ҵ�� �����ϰ� ����ޱ�
		int result = new BoardService().insertBoard(board);

		// 7. ���� ����� ����/���� ������ ��������
		if (result > 0) {
			response.sendRedirect("blist?page=1");
		} else {
			RequestDispatcher view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", "�ı� ��� ����...");
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