package javawebapplication.bean;

public class CartBean extends ProductBean {

	private int quantity;

	public CartBean() {
		
	}
	
	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
}
