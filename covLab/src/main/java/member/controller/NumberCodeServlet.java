package member.controller;

import java.io.IOException;
import java.io.PrintWriter;
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

import org.json.simple.JSONObject;


import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;


/**
 * Servlet implementation class NumberCodeServlet
 */
@WebServlet("/ncode")
public class NumberCodeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NumberCodeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userphone = request.getParameter("userphone");
	
		
		String api_key = "NCSY6G9GW44ERFNT";
	    String api_secret = "YGY9MZDGFPPES8DQDQHCL9N8IQHWXYGS";
	    Message coolsms = new Message(api_key, api_secret);
   
	  
	    
	    int authNo = (int)(Math.random() * (9999 - 1000 + 1)) + 1000;
		
	    //임시비밀번호
			
			//핸드폰 전송
	    // 4 params(to, from, type, text) are mandatory. must be filled
	    HashMap<String, String> params = new HashMap<String, String>();
	    params.put("to", userphone);	// 수신전화번호
	    params.put("from", "010-9403-6242");	// 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
	    params.put("type", "SMS");
	    params.put("text", "인증번호는 " + authNo + "입니다.");
	    params.put("app_version",  "JAVA SDK v1.2"); // application name and version
	    
	   
	    response.setContentType("application/jsono; charset=utf-8");
		PrintWriter out = response.getWriter();
		response.getWriter().print(authNo);
  	   out.flush();
	  out.close();
	    
	    try {
		      JSONObject obj = (JSONObject) coolsms.send(params);
		      System.out.println(obj.toString());
		    
		    } catch (CoolsmsException e) {
		      System.out.println(e.getMessage());
		      System.out.println(e.getCode());
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
