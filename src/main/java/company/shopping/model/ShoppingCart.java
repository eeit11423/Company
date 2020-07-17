package company.shopping.model;

import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;
public class ShoppingCart {   
	
	private Map<Integer, OrderItemBean> cart = new LinkedHashMap< >();
	
	public ShoppingCart() {
	}
	
	public Map<Integer, OrderItemBean>  getContent() { // ${ShoppingCart.content}
		return cart;
	}
	public void addToCart(int shoppingId, OrderItemBean  oib) {
		if (oib.getOrderItemsNumber() <= 0 ) {
			return;
		}
		// 如果客戶在伺服器端沒有此項商品的資料，則客戶第一次購買此項商品
		if ( cart.get(shoppingId) == null ) {
		    cart.put(shoppingId, oib);
		} else {
	        // 如果客戶在伺服器端已有此項商品的資料，則客戶『加購』此項商品
			OrderItemBean oiBean = cart.get(shoppingId);
			// 加購的數量：bean.getQuantity()
			// 原有的數量：oBean.getQuantity()			
			oiBean.setOrderItemsNumber(oib.getOrderItemsNumber() + oiBean.getOrderItemsNumber());
		}
	}

	public boolean modifyQty(int shoppingId, int OrderItemsNumber) {
		if ( cart.get(shoppingId) != null ) {
		   OrderItemBean  bean = cart.get(shoppingId);
		   bean.setOrderItemsNumber(OrderItemsNumber);
	       return true;
		} else {
		   return false;
		}
	}
	// 刪除某項商品
	public int deleteBook(int shoppingId) {
		if ( cart.get(shoppingId) != null ) {
	       cart.remove(shoppingId);  // Map介面的remove()方法
	       return 1;
		} else {
		   return 0;
		}
	}
	public int getItemNumber(){   // ShoppingCart.itemNumber
		return cart.size();
	}
	//計算購物車內所有商品的合計金額(每項商品的單價*數量的總和)
	public double getSubtotal(){
		double subTotal = 0 ;
		Set<Integer> set = cart.keySet();
		for(int n : set){
			OrderItemBean oib = cart.get(n);
			double price    = oib.getShoppingProductPrice();
			double discount = oib.getShoppingProductDiscount();
			int qty      = oib.getOrderItemsNumber();
			subTotal +=  price * discount * qty;
		}
		return subTotal;
	}
}
