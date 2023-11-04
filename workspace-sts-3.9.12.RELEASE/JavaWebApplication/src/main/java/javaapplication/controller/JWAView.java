package javaapplication.controller;

public interface JWAView {

	public String APP_CONTEXT = "/JavaWebApplication";
	public String PAGE_FOLDER = "/jsp";
	
	public static final String LoginView =PAGE_FOLDER + "/Login.jsp";
	public static final String SignUpView =PAGE_FOLDER + "/SignUp.jsp";
	public static final String HomeView =PAGE_FOLDER + "/Home.jsp";
	public static final String UserListView =PAGE_FOLDER + "/UsersList.jsp";
	
	
	public static final String LoginCTL = APP_CONTEXT+"/LoginCTL";
	public static final String SignUpCTL = APP_CONTEXT+"/SignUpCTL";
	public static final String HomeCTL = APP_CONTEXT+"/HomeCTL";
	public static final String UserListCTL =APP_CONTEXT + "/UserListCTL";
	
	
	public static final String Medicine =APP_CONTEXT + PAGE_FOLDER + "/Medicine.jsp";
}
