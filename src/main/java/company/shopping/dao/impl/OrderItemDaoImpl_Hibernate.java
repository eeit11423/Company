package company.shopping.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import company.shopping.dao.OrderItemDao;
import company.shopping.model.OrderItemBean;
import company.shopping.model.ShoppingBean;


/*
 * 一張合格的訂單必須經過下列檢查 
 * 
 * 	1.	檢查訂購之商品的數量是否足夠。
 *      此功能寫在本類別的updateProductStock()方法內，參考該方法的說明。
 */
@Repository
public class OrderItemDaoImpl_Hibernate implements OrderItemDao {
	@Autowired
	SessionFactory factory;

	public OrderItemDaoImpl_Hibernate() {
	}
	/*
	 * 計算客戶欲購買之某項商品(以OrderItemBean物件oib來表示)的小計金額(subtotal)， 計算公式為: 商品的數量 * 商品的單價 *
	 * 商品的折扣
	 */
	@Override
	public double findItemAmount(OrderItemBean oib) {
		double subtotal = oib.getOrderItemsNumber() * oib.getShoppingProductPrice() * oib.getShoppingProductDiscount();
		return subtotal;
	}
	@Override
	public int updateProductStock(OrderItemBean oib) {
		int n = 0;
		Integer stock = 0;
		Session session = factory.getCurrentSession();
		String hql0 = "SELECT shoppingProductTotal FROM ShoppingBean WHERE ShoppingId = :ShoppingId";
		String hql1 = "UPDATE ShoppingBean SET shoppingProductTotal = shoppingProductTotal - :orderItemsNumber WHERE ShoppingId = :ShoppingId";
		stock = (Integer) session.createQuery(hql0)
								 .setParameter("ShoppingId", oib.getShoppingId())
								 .getSingleResult();
		if (stock == null) {
			stock = 0;
		}
//		int stockLeft = stock - oib.getQuantity();
//		if (stockLeft < 0) {
//			throw new ProductStockException(
//					"庫存數量不足: BookId: " + oib.getBookId() + ", 在庫量: " 
//				    + stock + ", 訂購量: " + oib.getQuantity());
//		}
		n = session.createQuery(hql1)
				   .setParameter("ShoppingId", oib.getShoppingId())
				   .setParameter("orderItemsNumber", oib.getOrderItemsNumber())
				   .executeUpdate();
		return n;
	}

	@Override
	public List<OrderItemBean> getmemberitems(int orderNo) {
		String hql="FROM OrderItemBean where FK_OrderBean_orderNo= :orderNo";
//		
		Session session=factory.getCurrentSession();
		@SuppressWarnings("unchecked")
		List<OrderItemBean> listitem=session.createQuery(hql)
				                       .setParameter("orderNo",orderNo )
		                               .getResultList();
		return listitem;
	}
   

}
