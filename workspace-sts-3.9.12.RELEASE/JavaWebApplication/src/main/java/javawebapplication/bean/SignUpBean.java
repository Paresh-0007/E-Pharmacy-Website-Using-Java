package javawebapplication.bean;

public class SignUpBean {

	  
	  public SignUpBean() {
			super();
		}
	  


	  private String fullname;
	  public SignUpBean(String fullname, String email, String password, String cpassword, String mobileNo, long id) {
		super();
		this.fullname = fullname;
		this.email = email;
		this.password = password;
		this.cpassword = cpassword;
		this.mobileNo = mobileNo;
		this.id = id;
	}



	private String email;
	  private String password;
	  private String cpassword;
	  private String mobileNo;
	  private long id;
	  private String usertype;
	  
	public String getUsertype() {
		return usertype;
	}
	public void setUsertype(String usertype) {
		this.usertype = usertype;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getCpassword() {
		return cpassword;
	}
	public void setCpassword(String cpassword) {
		this.cpassword = cpassword;
	}
	public String getMobileNo() {
		return mobileNo;
	}
	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}  
	

	  
	  @Override
	public String toString() {
		return "SignUpBean [fullname=" + fullname + ", email=" + email + ", password=" + password + ", cpassword="
				+ cpassword + ", mobileNo=" + mobileNo + ", id=" + id + "]";
	}
	  
}