package company.rearend.dao;

import java.util.List;
import java.util.Map;

import company.activity.model.Join;
import company.member.model.MemberBean;
import company.rearend.model.JoinEX;
import company.shopping.model.OrderCount;
import company.shopping.model.OrderItemBean;
import company.shopping.model.ShoppingBean;


public interface GraphDao {
	List<MemberBean> getAllSalary();
	List<MemberBean>  getMemberBySalary(String Salary);
	
	List<MemberBean>  getMemberBypeople(String people);
	List<ShoppingBean> getShoppingNumber(String Number);

	List<MemberBean>  getMemberNumberpeople(String people);
	List<OrderItemBean>  getOrderprice(String price);
	List<MemberBean>  getSalary(String sal);
	//熱門產品
	Map<Integer,ShoppingBean> getShoppingType(String Type);
	Map<Integer, OrderCount> getshopping(String sho );
	
	List<Join> getActity(String Actity);
	
	//訊息
	
	//List<Map<ShoppingBean,MemberBean>>  getShoppingNumbera(String Number);
}
