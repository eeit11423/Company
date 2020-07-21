package company.shopping.dao;

import java.util.List;

import company.member.model.MemberBean;
import company.shopping.model.ShoppingBean;




public interface ShoppingDao {
	List<ShoppingBean> getAllProducts();    //全部商品
	
	List<ShoppingBean> getAllProductsNewtoOld();    //全部商品由新到舊
	List<ShoppingBean> getAllProductsPriceHightoLow();    //全部商品價格由高到低
	List<ShoppingBean> getAllProductsPriceLowtoHigh();    //全部商品價格由低到高
	
	void  addProduct(ShoppingBean product );//新增新產品
	
	
	ShoppingBean getshoppingId(int shoppingId);//取出某一個商品
	void update(ShoppingBean product);//更新商品資料
	void delete(Integer shoppingId);//刪除商品資料
	public List<ShoppingBean> getshoppingType(String shoppingType); //取出單項商品產品種類
	public List<ShoppingBean> getALLShoppingType(); //取出全部商品商品種類
	public List<ShoppingBean> getSearchShoppingNameProductrelatio(String searchWord); //模糊搜尋商品名稱和敘述
	
	
	
	
	

}
