package company.shopping.model;

public class OrderCount {
	private String shoppingProductName;
	private String countTest;
	private String price;
	public OrderCount() {
		super();
	}
	
	public OrderCount(String shoppingProductName, String countTest, String price) {
		super();
		this.shoppingProductName = shoppingProductName;
		this.countTest = countTest;
		this.price = price;
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

	
}