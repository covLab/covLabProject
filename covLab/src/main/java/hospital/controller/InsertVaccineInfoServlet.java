package hospital.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hospital.model.service.HospitalService;
import hospital.model.vo.VaccineInfo;

/**
 * Servlet implementation class InsertVaccinInfoServlet
 */
@WebServlet("/insertvcinfo")
public class InsertVaccineInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertVaccineInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//백신 등록
		request.setCharacterEncoding("utf-8");
		
		VaccineInfo vi = new VaccineInfo();
		vi.setVacName(request.getParameter("vcname"));
		vi.setMadeByCompany(request.getParameter("vccomp"));
		vi.setMadeInCountry(request.getParameter("vccountry"));
		vi.setMaxIocCount(Integer.parseInt(request.getParameter("vccnt")));
		vi.setExpDur(request.getParameter("vcexp"));
		System.out.println("vaccineInfo : "+vi);
		
		HospitalService hservice = new HospitalService();
		int result = hservice.insertVaccineInfo(vi);
		
		if(result > 0) {
			response.sendRedirect("/semi/vcmanage");
		}else {
			RequestDispatcher view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", "백신등록 실패");
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
