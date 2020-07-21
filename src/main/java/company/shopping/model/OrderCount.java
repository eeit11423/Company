package company.shopping.model;

public class OrderCount {
	private String shoppingProductName;
	private String countTest;
	
	public OrderCount() {
		super();
	}
	public OrderCount(String shoppingProductName, String countTest) {
		super();
		this.shoppingProductName = shoppingProductName;
		this.countTest = countTest;
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
	
}