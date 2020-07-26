package company.train.model;

import java.util.LinkedHashMap;
import java.util.Map;

import company.shopping.model.OrderItemBean;

public class CourseCart {
	private Map<Integer, RosterBean> cart = new LinkedHashMap< >();
	
	public Map<Integer, RosterBean>  getContent() { // ${ShoppingCart.content}
		return cart;
	}
	
	public void addToCart(int trainingId, RosterBean  oib) {
		
		// 如果客戶在伺服器端沒有此項商品的資料，則客戶第一次購買此項商品
		if ( cart.get(trainingId) == null ) {
		    cart.put(trainingId, oib);
		}
	}
}	
