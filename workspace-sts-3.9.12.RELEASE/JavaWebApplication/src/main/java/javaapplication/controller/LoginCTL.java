package javaapplication.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import javawebapplication.bean.SignUpBean;
import javawebapplication.model.SignUpModel;
import javawebapplication.utility.ServletUtility;
/**
 * Servlet implementation class LoginCTL
 */
@WebServlet(name= "LoginCTL", urlPatterns = {"/LoginCTL"})
public class LoginCTL extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginCTL() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//RequestDispatcher rd = request.getRequestDispatcher(JWAView.LoginView);
		//rd.forward(request, response);
		HttpSession session = request.getSession(false);
		String op = request.getParameter("operation");
		ServletUtility.forward(JWAView.LoginView, request, response);
		
		try {
			if(op.equals("logout")) {
				session.invalidate();
				ServletUtility.setSuccessMessage("Logout Successfully",request);
			}	
		}
		catch(Exception e) {
			System.out.println(e);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		SignUpBean user = new SignUpBean();
	       String email=request.getParameter("email");
	       String pwd=request.getParameter("password");
	      
	       user = SignUpModel.UserLogin(email,pwd);
	       HttpSession session=request.getSession(true);
	       if(user != null) {
	    	   
	      	 //ServletUtility.setSuccessMessage(request.getParameter("email")+ " is login successfully", request);
	    	   session.setAttribute("fullname", user.getFullname());
	    	   session.setAttribute("id", user.getId());
	    	   session.setAttribute("current-user", user);
	    	  if(user.getUsertype().equals("admin")) {
	    		response.sendRedirect("/JavaWebApplication/jsp/Admin.jsp");  
	    	   }
	    	   else {
	    	   ServletUtility.redirect(JWAView.HomeCTL, request, response);
	    	   }
	       }else {
	      	 ServletUtility.setErrorMessage("Invalid Login! Please Try Again.", request);
	      	 ServletUtility.forward(JWAView.LoginView , request, response);
	       }
	}

}
