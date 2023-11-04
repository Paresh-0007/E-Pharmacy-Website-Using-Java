package javawebapplication.bean;

public class ProductBean{

	private int id;
	private String name;
	private String category;
	private double price;
	private String image;
	private double dprice;
	private String description;
	private String discount;
	private int quantity;
	
	
	public int getQuantity() {
		return quantity;
	}


	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}


	public ProductBean(int id,String name,String category,double price,String image) {
		this.id = id;
		this.name = name;
		this.category = category;
		this.price = price;
		this.image = image;
	}


	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public double getDprice() {
		return dprice;
	}

	public void setDprice(double dprice) {
		this.dprice = dprice;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getDiscount() {
		return discount;
	}

	public void setDiscount(String discount) {
		this.discount = discount;
	}

	public ProductBean() {
	
	}
	
	@Override
	public String toString() {
		return "ProductModel [id=" + id + ", name=" + name + ", category=" + category + ", price=" + price + ", image="
				+ image + "]";
	}
	
	
}
