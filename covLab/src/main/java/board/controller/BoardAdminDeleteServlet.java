package board.controller;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;

/**
 * Servlet implementation class BoardAdminListServlet
 */
@WebServlet("/bdeleteadmin")
public class BoardAdminDeleteServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;

   /**
    * @see HttpServlet#HttpServlet()
    */
   public BoardAdminDeleteServlet() {
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

      String[] checkedList = request.getParameterValues("chk");
      for(int i = 0 ; i<checkedList.length; i++) {
      System.out.println("checkedList at servlet : "+checkedList[i]);  
      }
//      System.out.println(Arrays.toString(checkedList));
//      System.out.println("checkedList.length : "+ checkedList.length);

  
      // 출력할 페이지 작성
      int currentPage = 1;
      // 전송온 페이지 값이 있다면 추출
      if (request.getParameter("page") != null) {
         currentPage = Integer.parseInt(request.getParameter("page"));
      }
      

      int result = new BoardService().deleteBoard(checkedList);

      if (result > 0) {
         response.sendRedirect("/semi/blistadmin?page="+currentPage);
      } else {
         RequestDispatcher view = request.getRequestDispatcher("views/common/error.jsp");
         request.setAttribute("message", Arrays.toString(checkedList)+"번 공지글 삭제 실패");
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