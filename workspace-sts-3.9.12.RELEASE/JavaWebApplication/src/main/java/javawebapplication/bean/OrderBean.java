package javawebapplication.bean;

public class OrderBean extends ProductBean{
	private long orderId;
	private long uid;
	private int qunatity;
	private String date;
	
	public OrderBean() {
	}
	
	public OrderBean(int orderId, int uid, int qunatity, String date) {
		super();
		this.orderId = orderId;
		this.uid = uid;
		this.qunatity = qunatity;
		this.date = date;
	}

	public OrderBean(int uid, int qunatity, String date) {
		super();
		this.uid = uid;
		this.qunatity = qunatity;
		this.date = date;
	}

	public long getOrderId() {
		return orderId;
	}
	public void setOrderId(long l) {
		this.orderId = l;
	}
	
	public long getUid() {
		return uid;
	}

	public void setUid(Long userSession2) {
		this.uid = userSession2;
	}

	public int getQunatity() {
		return qunatity;
	}
	public void setQunatity(int qunatity) {
		this.qunatity = qunatity;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
}