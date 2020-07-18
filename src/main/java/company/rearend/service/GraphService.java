package company.rearend.service;

import java.util.List;

import company.member.model.MemberBean;
import company.shopping.model.ShoppingBean;

public interface GraphService {
	List<MemberBean> getAllSalary();
	List<MemberBean>  getMemberBySalary(String Salary);
	List<MemberBean>  getMemberBypeople(String people);
	List<ShoppingBean> getShoppingNumber(String Number);
	List<MemberBean>  getMemberNumberpeople(String people);
}
