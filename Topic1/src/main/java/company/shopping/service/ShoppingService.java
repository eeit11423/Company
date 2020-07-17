package company.shopping.service;

import java.util.List;

import company.shopping.model.ShoppingBean;


public interface ShoppingService {
	List<ShoppingBean> getAllProducts(); //全部商品
	void  addProduct(ShoppingBean product); //新增商品
	
	
	void delete(Integer shoppingId); //刪除商品
	void update(ShoppingBean product); //更新商品
	ShoppingBean getshoppingId(int shoppingId); //找商品
	public List<ShoppingBean> getshoppingType(String shoppingType); //找想要的分類
	public List<ShoppingBean> getALLShoppingType();//不同的分類全部顯示

}
