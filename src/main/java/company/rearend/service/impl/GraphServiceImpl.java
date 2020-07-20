package company.rearend.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import company.member.model.MemberBean;
import company.rearend.dao.GraphDao;
import company.rearend.service.GraphService;
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
	
}
