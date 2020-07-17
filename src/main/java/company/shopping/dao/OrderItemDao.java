package company.shopping.dao;

import java.sql.Connection;
import java.util.List;

import company.shopping.model.OrderItemBean;
import company.shopping.model.ShoppingBean;



public interface OrderItemDao {
	
	// 由 OrderItemBean取得商品價格(eBook#Price)。
	List<OrderItemBean> getmemberitems(int orderNo);
		
	double findItemAmount(OrderItemBean oib);

	int updateProductStock(OrderItemBean ob);
	
    
}
