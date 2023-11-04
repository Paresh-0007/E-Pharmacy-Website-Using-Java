package javaapplication.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javawebapplication.bean.SignUpBean;
import javawebapplication.model.SignUpModel;
import javawebapplication.utility.ServletUtility;

/**
 * Servlet implementation class SignUpCTL
 */
public class SignUpCTL extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUpCTL() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//RequestDispatcher rd = request.getRequestDispatcher(JWAView.SignUpView);
		//rd.forward(request, response);
		ServletUtility.forward(JWAView.SignUpView, request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		SignUpBean user = new SignUpBean();
	    user.setFullname(request.getParameter("fullname"));
	    user.setEmail(request.getParameter("email"));
	    user.setPassword(request.getParameter("password"));
	    user.setCpassword(request.getParameter("cpassword"));
	    user.setMobileNo(request.getParameter("mobileNo"));
	    
	    long i = SignUpModel.addUser(user);
	    if(i>0) {
	      ServletUtility.setSuccessMessage("User register sucessfully", request);
	      
	    }else {
	      ServletUtility.setErrorMessage("Not insterted", request);
	    }
	    request.getRequestDispatcher(JWAView.SignUpView).forward(request, response);
	}

}
