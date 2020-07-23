package company.rearend.service.impl;

import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import company.activity.model.Join;
import company.member.model.MemberBean;
import company.rearend.dao.GraphDao;
import company.rearend.model.JoinEX;
import company.rearend.service.GraphService;
import company.shopping.model.OrderCount;
import company.shopping.model.OrderItemBean;
import company.shopping.model.ShoppingBean;

@Service
@Transactional
public class GraphServiceImpl implements GraphService {
	@Autowired
	GraphDao graphDao;

	@Override
	public List<MemberBean> getAllSalary() {
		
		return graphDao.getAllSalary();
	}

	@Override
	public List<MemberBean> getMemberBySalary(String Salary) {
		return graphDao.getMemberBySalary(Salary);
		
	}

	@Override
	public List<MemberBean> getMemberBypeople(String people) {
		return graphDao.getMemberBypeople(people);
	}

	@Override
	public List<ShoppingBean> getShoppingNumber(String Number) {
		
		 return graphDao.getShoppingNumber(Number);
	}

	@Override
	public List<MemberBean> getMemberNumberpeople(String people) {
		 return graphDao.getMemberNumberpeople(people);

	}

	@Override
	public List<OrderItemBean> getOrderprice(String price) {
		return graphDao.getOrderprice(price);
		
	}

	@Override
	public List<MemberBean> getSalary(String sal) {
		return graphDao.getSalary(sal);
	}

	@Override
	public Map<Integer,ShoppingBean> getShoppingType(String Type) {
		return graphDao.getShoppingType(Type);

	}

	@Override
	public Map<Integer, OrderCount> getshopping(String sho) {
		return graphDao.getshopping(sho);
	}

	@Override
	public List<Join> getActity(String Actity) {
		return graphDao.getActity(Actity);
	}
	
}
