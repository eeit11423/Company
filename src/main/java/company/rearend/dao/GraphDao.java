package company.rearend.dao;

import java.util.List;
import java.util.Map;

import company.activity.model.Join;
import company.member.model.MemberBean;
import company.rearend.model.JoinEX;
import company.rearend.model.MessageBean;
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
	List<OrderItemBean> getshoppinAjex(String productNO1);
	
	List<MessageBean> getAllMessage();
	//訊息
	void addmessages(MessageBean ms);
	void DeleteMessage(Integer messageId);
	void UpMessage(Integer messageId);
	
	List<OrderItemBean> getshoppinTypeAjex(String producttype);
	List<OrderItemBean> getshoppinTypeSAjex(String producSttype);
	//List<Map<ShoppingBean,MemberBean>>  getShoppingNumbera(String Number);
}
