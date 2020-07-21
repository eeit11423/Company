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
	List<ShoppingBean> getAllProductsNewtoOld();    //全部商品由新到舊
	List<ShoppingBean> getAllProductsPriceHightoLow();    //全部商品價格由高到低
	List<ShoppingBean> getAllProductsPriceLowtoHigh();  //全部商品價格由低到高
	public List<ShoppingBean> getSearchShoppingNameProductrelatio(String searchWord); //模糊搜尋商品名稱和敘述
}
