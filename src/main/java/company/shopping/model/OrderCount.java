package company.shopping.model;

public class OrderCount {
	private String shoppingProductName;
	private String countTest;
	private String price;
	private String shoppingType;
	public OrderCount() {
		super();
	}
	


	public OrderCount(String shoppingProductName, String countTest, String price, String shoppingType) {
		super();
		this.shoppingProductName = shoppingProductName;
		this.countTest = countTest;
		this.price = price;
		this.shoppingType = shoppingType;
	}



	public String getShoppingProductName() {
		return shoppingProductName;
	}
	public void setShoppingProductName(String shoppingProductName) {
		this.shoppingProductName = shoppingProductName;
	}
	public String getCountTest() {
		return countTest;
	}
	public void setCountTest(String countTest) {
		this.countTest = countTest;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getShoppingType() {
		return shoppingType;
	}

	public void setShoppingType(String shoppingType) {
		this.shoppingType = shoppingType;
	}

	
}