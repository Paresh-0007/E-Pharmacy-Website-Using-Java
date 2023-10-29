package javawebapplication.utility;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 * This class provides utility operation for Servlet container like forward,
 * redirect, handle generic exception=same time exception, manage success and
 * error message, manage default Bean and List, manage pagination parameters
 */
public class ServletUtility {
	
  static String Error = "Invalid data";
  static String SucessMessage = "Done";

  //Forward the request....
  public static void forward(String page, HttpServletRequest request, HttpServletResponse response)
      throws IOException, ServletException {

    RequestDispatcher rd = request.getRequestDispatcher(page);
    System.out.println(page);
    rd.forward(request, response);
  }
  
  //Redirect the request
  public static void redirect(String page, HttpServletRequest request, HttpServletResponse response)
      throws IOException, ServletException {
    response.sendRedirect(page);
  }

  //Handle Exception
  public static void handleException(Exception e, HttpServletRequest request, HttpServletResponse response)
      throws IOException, ServletException {
    request.setAttribute("exception", e);
    ServletUtility.forward("Error Message", request, response);
    e.printStackTrace();
  }

  public static String getErrorMessage(String property, HttpServletRequest request) {
    String val = (String) request.getAttribute(property);
    if (val == null) {
      return "";
    } else {
      return val;
    }
  }

  public static String getMessage(String property, HttpServletRequest request) {
    String val = (String) request.getAttribute(property);
    if (val == null) {
      return "";
    } else {
      return val;
    }
  }

  public static void setErrorMessage(String msg, HttpServletRequest request) {
    request.setAttribute(Error, msg);
  }

  public static String getErrorMessage(HttpServletRequest request) {
    String val = (String) request.getAttribute(Error);
    if (val == null) {
      return "";
    } else {
      return val;
    }
  }

  public static void setSuccessMessage(String msg, HttpServletRequest request) {
    request.setAttribute(SucessMessage, msg);
  }

  public static String getSuccessMessage(HttpServletRequest request) {
    String val = (String) request.getAttribute(SucessMessage);
    if (val == null) {
      return "";
    } else {
      return val;
    }
  }


  public static String getParameter(String property, HttpServletRequest request) {
    String val = (String) request.getParameter(property);
    if (val == null) {
      return "";
    } else {
      return val;
    }
  }

  public static void setList(List list, HttpServletRequest request) {
    request.setAttribute("list", list);
  }

  public static List getList(HttpServletRequest request) {
    return (List) request.getAttribute("list");
  }

  public static void setOpration(String msg, HttpServletRequest request) {
    request.setAttribute("Opration", msg);
  }

  public static String getOpration(HttpServletRequest request) {
    String val = (String) request.getAttribute("Opration");
    if (val == null) {
      return "";
    } else {
      return val;
    }
  }

}