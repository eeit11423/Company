package company.shopping.model;

public class OrderCount {
	private String shoppingProductName;
	private String countTest;
	private String shoppingProductPrice;
	public OrderCount() {
		super();
	}
	
	public OrderCount(String shoppingProductName, String countTest, String shoppingProductPrice) {
		super();
		this.shoppingProductName = shoppingProductName;
		this.countTest = countTest;
		this.shoppingProductPrice = shoppingProductPrice;
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
	public String getShoppingProductPrice() {
		return shoppingProductPrice;
	}
	public void setShoppingProductPrice(String shoppingProductPrice) {
		this.shoppingProductPrice = shoppingProductPrice;
	}
	
}