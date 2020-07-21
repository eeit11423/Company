package company.rearend.dao;

import java.util.List;
import java.util.Map;

import company.member.model.MemberBean;
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
	Map<Integer,ShoppingBean> getShoppingType(String Type);
	//List<Map<ShoppingBean,MemberBean>>  getShoppingNumbera(String Number);
}
