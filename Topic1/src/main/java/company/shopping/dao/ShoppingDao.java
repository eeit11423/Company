package company.shopping.dao;

import java.util.List;

import company.member.model.MemberBean;
import company.shopping.model.ShoppingBean;




public interface ShoppingDao {
	List<ShoppingBean> getAllProducts();
	void  addProduct(ShoppingBean product );
	
	
	ShoppingBean getshoppingId(int shoppingId);
	void update(ShoppingBean product);
	void delete(Integer shoppingId);
	public List<ShoppingBean> getshoppingType(String shoppingType);
	public List<ShoppingBean> getALLShoppingType();

}
