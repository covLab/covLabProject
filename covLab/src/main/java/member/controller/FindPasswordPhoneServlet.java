package member.controller;

import java.io.IOException;
import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;
import java.util.HashMap;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import member.model.servcie.MemberService;
import member.model.vo.Member;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

/**
 * Servlet implementation class FindPasswordPhoneServlet
 */
@WebServlet("/findpwphone")
public class FindPasswordPhoneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindPasswordPhoneServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userid = request.getParameter("userid");
		String phone = request.getParameter("userphone");
		
		 Member member = new MemberService().searchUserPwPhone(userid,phone); 
		
		String api_key = "NCSY6G9GW44ERFNT";
	    String api_secret = "YGY9MZDGFPPES8DQDQHCL9N8IQHWXYGS";
	    Message coolsms = new Message(api_key, api_secret);
   
	  
	    
//	    int authNo = (int)(Math.random() * (9999 - 1000 + 1)) + 1000;
//		System.out.println(authNo);
	    //임시비밀번호
	    StringBuffer temp = new StringBuffer();
		Random rnd = new Random();
		for (int i = 0; i < 10; i++) {
			int rIndex = rnd.nextInt(3);
			switch (rIndex) {
			case 0:
				// a-z
				temp.append((char) ((int) (rnd.nextInt(26)) + 97));
				break;
			case 1:
				// A-Z
				temp.append((char) ((int) (rnd.nextInt(26)) + 65));
				break;
			case 2:
				// 0-9
				temp.append((rnd.nextInt(10)));
				break;
			}
		}
		String Key = temp.toString();

//암호화
		  String cryptoUserpw = null;
			try {
				MessageDigest md = 
						MessageDigest.getInstance("SHA-512");
			
				byte[] pwValues = 
						Key.getBytes(Charset.forName("UTF-8"));
				
				md.update(pwValues);
				
				cryptoUserpw = Base64.getEncoder()
								.encodeToString(pwValues);
			
				System.out.println(cryptoUserpw);
				System.out.println(cryptoUserpw.length());
			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
			}
		
	
			
			
			int result = new MemberService().updateTempPwp(cryptoUserpw, userid, phone);
			System.out.println("서블릿"+cryptoUserpw);
			
			
			//핸드폰 전송
	    // 4 params(to, from, type, text) are mandatory. must be filled
	    HashMap<String, String> params = new HashMap<String, String>();
	    params.put("to", phone);	// 수신전화번호
	    params.put("from", "010-9403-6242");	// 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
	    params.put("type", "SMS");
	    params.put("text", "임시비밀번호는 " + Key + "입니다.");
	    params.put("app_version",  "JAVA SDK v1.2"); // application name and version

	    try {
	      JSONObject obj = (JSONObject) coolsms.send(params);
	      System.out.println(obj.toString());
	    } catch (CoolsmsException e) {
	      System.out.println(e.getMessage());
	      System.out.println(e.getCode());
	    }
	    System.out.println(Key);
	    
	    System.out.println(result);
	    if(result > 0  && member !=null) {
	    	member.setUserPw(cryptoUserpw);
			RequestDispatcher view =request.getRequestDispatcher("views/member/loginOrChange.jsp");
			request.setAttribute("userid", userid);
			  request.setAttribute("AuthenticationKey", Key);
			  view.forward(request, response);
		
		}else {
			
			RequestDispatcher view = request.getRequestDispatcher("views/common/error.jsp");
					request.setAttribute("message", 
							"회원 정보가 잘못 입력되었거나, 없습니다.");
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
