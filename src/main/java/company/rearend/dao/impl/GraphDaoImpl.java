package company.rearend.dao.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import company.activity.model.Join;
import company.member.model.MemberBean;
import company.rearend.dao.GraphDao;
import company.rearend.model.JoinEX;
import company.rearend.model.MessageBean;
import company.shopping.model.OrderCount;
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
		String hql = "SELECT SUM(O.shoppingAmount) FROM OrderItemBean O ";
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
		String hql2 = "FROM OrderItemBean  ";
		
		Session session = factory.getCurrentSession();
		List<OrderItemBean> list = session.createQuery(hql2).setMaxResults(5).getResultList();
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
	public Map<Integer, OrderCount> getshopping(String sho) {
		Map<Integer, OrderCount> map=new HashMap();
		//判斷客戶的訂單資訊
		try {
			String hql = "SELECT  shoppingType,shoppingProductName ,SUM(orderItemsNumber) as countTest ,SUM(shoppingProductPrice) as price "
					+ "FROM OrderItemBean  GROUP BY shoppingProductName,shoppingType ORDER BY countTest DESC";
		//判斷客戶訂單並用GROUP BY分組抓取顯示最常購買的商品名稱及價錢、總數 ，並由高到低排序。
		Session session = factory.getCurrentSession();
		
		List<Object[]> listO = session.createQuery(hql).setMaxResults(5).getResultList();
		//抓取前5名的商品資訊
		
		//新增新的Map來抓對應資料庫欄位並設定↓↓
		int n = 0;
		for (Object[] object : listO) {
			n++;
			OrderCount order = new OrderCount();
			order.setShoppingType(object[0].toString());
			order.setShoppingProductName(object[1].toString());
			order.setCountTest(object[2].toString());
			order.setPrice(object[3].toString());
			
			System.out.println(object[3].toString());
			System.out.println(object[2].toString());
		
			map.put(n, order);
			
		}
		
		} catch (Exception e) {
			// TODO: handle exception
		}
		return map;
		
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Join> getActity(String Actity) {
		String hql = "SELECT  activityName,count(*) as countTest FROM Join  GROUP BY activityId,activityName ORDER BY countTest DESC";
		Session session = factory.getCurrentSession();
		List<Join> list2 = session.createQuery(hql).setMaxResults(5).getResultList();
	
		return list2;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<OrderItemBean> getshoppinAjex(String productNO1) {
		String hql = "SELECT  shoppingType,shoppingProductName ,SUM(orderItemsNumber) as countTest ,SUM(shoppingProductPrice) as price "
				+ "FROM OrderItemBean  GROUP BY shoppingProductName,shoppingType ORDER BY countTest DESC";
		Session session = factory.getCurrentSession();
		List<OrderItemBean> list2 = session.createQuery(hql).setMaxResults(5).getResultList();
	
		return list2;
	}
//	@SuppressWarnings("unchecked")
//	@Override
//	public Map<Integer, JoinEX> getActity(String Actity) {
//		String hql = "SELECT  activityName,count(*) as countTest FROM Join  GROUP BY activityId,activityName ORDER BY countTest DESC";
//	Session session = factory.getCurrentSession();
//	
//	List<Object[]> listO = session.createQuery(hql).setMaxResults(5).getResultList();
//	
//	Map<Integer, JoinEX> map = new HashMap();
//
//	int n = 0;
//	for (Object[] object : listO) {
//		n++;
//		JoinEX order = new JoinEX();
//		order.setActivityName(object[0].toString());
//		order.setCountTest(object[1].toString());
//		
//		
//		System.out.println(object[0].toString());
//		System.out.println(object[1].toString());
//	
//		map.put(n, order);
//		
//	}
//	return map;
//	} 普通版 熱門活動

	@SuppressWarnings("unchecked")
	@Override
	public List<MessageBean> getAllMessage() {
	String hql="FROM MessageBean";		
		Session session=factory.getCurrentSession();
		List<MessageBean> list=session.createQuery(hql)										
							          .getResultList();
		return list;
	}


	@Override
	public void addmessages(MessageBean ms) {
		Session session=factory.getCurrentSession();
		session.save(ms);		
	}

	@Override
	public void DeleteMessage(Integer messageId) {
		String hql="Delete MessageBean WHERE messageId = :messageId ";
		Session session=factory.getCurrentSession();
		session.createQuery(hql).setParameter("messageId",messageId).executeUpdate();
	}

	@SuppressWarnings("unchecked")
	@Override
	public void UpMessage(Integer messageId) {
		String hql="FROM MessageBean WHERE messageId = :messageId ";
		Session session=factory.getCurrentSession();
		List<MessageBean> list=  session.createQuery(hql).setParameter("messageId",messageId).getResultList();
		for (MessageBean messageBean : list) {
			if(messageBean.getMemberId()==0) {
				messageBean.setMemberId(messageBean.getMemberId()+1);		
			}else {
				messageBean.setMemberId(messageBean.getMemberId()-1);		
			}
			session.update(messageBean);
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<OrderItemBean> getshoppinTypeAjex(String producttype) {
		String hql = "SELECT SUM(O.shoppingAmount) FROM OrderItemBean O ";
		String hql2 = "SELECT shoppingType ,SUM(O.shoppingAmount) FROM OrderItemBean O  GROUP BY shoppingType ";
		Session session = factory.getCurrentSession();
		List<OrderItemBean> list = session.createQuery(hql).getResultList();
		List<OrderItemBean> list2 = session.createQuery(hql2).getResultList();
		
		
//		for (OrderItemBean orderItemBean : list2) {
//			System.out.println(orderItemBean.getShoppingType()+"...............................................");
//		}
		return list2;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<OrderItemBean> getshoppinTypeSAjex(String producSttype) {
		String hql = "SELECT shoppingType,(SUM(shoppingAmount)/(SELECT SUM(O.shoppingAmount) FROM OrderItemBean O )*100) as Snum FROM OrderItemBean GROUP BY shoppingType";
		Session session = factory.getCurrentSession();
		List<OrderItemBean> list = session.createQuery(hql).getResultList();

		return list;
	}

}
