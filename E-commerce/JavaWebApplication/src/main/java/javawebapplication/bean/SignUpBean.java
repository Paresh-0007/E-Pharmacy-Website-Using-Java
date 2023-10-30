package javawebapplication.bean;

public class SignUpBean {

	  private String fullname;
	  private String email;
	  private String password;
	  private String cpassword;
	  private String mobileNo;
	  private long id;
	  
	  
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
}