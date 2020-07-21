package company.rearend.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import company.member.model.MemberBean;
import company.rearend.dao.GraphDao;
import company.shopping.model.OrderItemBean;
import company.shopping.model.ShoppingBean;

@Repository
public class GraphDaoImpl implements GraphDao {
	@Autowired
	SessionFactory factory;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<MemberBean> getAllSalary() {
		String hql="FROM MemberBean";
		
		Session session=factory.getCurrentSession();
		List<MemberBean> list=session.createQuery(hql)
										
								.getResultList();

		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<MemberBean> getMemberBySalary(String Salary) {
		String hql = "SELECT M.memberDepartment,SUM(M.memberSalary) FROM MemberBean M GROUP BY M.memberDepartment";
		Session session = factory.getCurrentSession();
		List<MemberBean> list = session.createQuery(hql).getResultList();
		
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<MemberBean> getMemberBypeople(String people) {
		//String hq2 = "SELECT M.memberGender,count(memberGender) FROM MemberBean M GROUP BY M.memberDepartment,M.memberGender";
		String hql = "SELECT M.memberDepartment,count(memberId) as peopleNumber,SUM(case when memberGender='男' then 1 else 0 end) as boy,SUM(case when memberGender='女' then 1 else 0 end) as girl"
				+ "  FROM MemberBean M GROUP BY M.memberDepartment";
		
//		String hql = "SELECT M.memberDepartment,count(memberId)"
//				+ " FROM MemberBean M ";
		Session session = factory.getCurrentSession();
		List<MemberBean> list2 = session.createQuery(hql).getResultList();
		List list = session.createQuery(hql).getResultList();
		for (int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i).toString());
		}
		
		return list2;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ShoppingBean> getShoppingNumber(String Number) {
		String hql = "SELECT count(ShoppingId) FROM ShoppingBean S ";
		Session session = factory.getCurrentSession();
		List<ShoppingBean> list = session.createQuery(hql).getResultList();
	
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<MemberBean> getMemberNumberpeople(String people) {
		String hql = "SELECT count(memberId) FROM MemberBean  ";
		Session session = factory.getCurrentSession();
		List<MemberBean> list = session.createQuery(hql).getResultList();
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<OrderItemBean> getOrderprice(String price) {
		String hql = "SELECT SUM(O.shoppingProductPrice) FROM OrderItemBean O ";
		Session session = factory.getCurrentSession();
		List<OrderItemBean> list = session.createQuery(hql).getResultList();
		List<Double> list1 = session.createQuery(hql).getResultList();
		
		for (Double orderItemBean : list1) {
			System.out.println(orderItemBean);
		}
		return list;
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<MemberBean> getSalary(String sal) {
		String hql = "SELECT SUM(M.memberSalary) FROM MemberBean M ";
		Session session = factory.getCurrentSession();
		List<MemberBean> list = session.createQuery(hql).getResultList();
		
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public Map<Integer,ShoppingBean> getShoppingType(String Type) {
		String hql = "FROM ShoppingBean where shoppingId = :shoppingId";
		String hql2 = "FROM OrderItemBean";
		
		Session session = factory.getCurrentSession();
		List<OrderItemBean> list = session.createQuery(hql2).getResultList();
		Map<Integer,ShoppingBean> mapShop = new HashMap();
		List<ShoppingBean> list1=null;
		for (OrderItemBean shop : list) {
			 list1 = session.createQuery(hql).
					setParameter("shoppingId", shop.getShoppingId())
					.getResultList();
			 for (ShoppingBean shoppL : list1) {
					mapShop.put(shoppL.getShoppingId(), shoppL);
					System.out.println();
				}
			//mapShop.put(list1.get(shop.getShoppingId()).getShoppingId(),ShoppingBean);
//			shop.getShoppingId();
		}
		
		return mapShop;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<OrderItemBean> getshopping(String sho) {
		
		String hql = "SELECT shoppingProductName ,COUNT(*) as to FROM OrderItemBean GROUP BY shoppingProductName ";
		Session session = factory.getCurrentSession();
		List<OrderItemBean> list = session.createQuery(hql).getResultList();
		
		return list;
	}

}
