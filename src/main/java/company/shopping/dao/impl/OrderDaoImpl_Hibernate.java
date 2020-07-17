package company.shopping.dao.impl;

import java.sql.Connection;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import company.shopping.dao.OrderDao;
import company.shopping.model.OrderBean;


// 本類別
//   1.新增一筆訂單到orders表格
//   2.查詢orders表格內的單筆訂單
//   3.查詢orders表格內的所有訂單
@Repository
public class OrderDaoImpl_Hibernate implements OrderDao {
	
	private String memberNumber = null;
	@Autowired
	private SessionFactory factory;
	int orderNo = 0;

	public OrderDaoImpl_Hibernate() {
	}
	
	
	public void insertOrder(OrderBean ob) {
		Session session = factory.getCurrentSession();
        session.save(ob);
	}

	public OrderBean getOrder(int orderNo) {
		OrderBean ob = null;
        Session session = factory.getCurrentSession();
        ob = session.get(OrderBean.class, orderNo);
        return ob;
	}



	public String getMemberNumber() {
		return memberNumber;
	}


	public void setMemberNumber(String memberNumber) {
		this.memberNumber = memberNumber;
	}


	public void setConnection(Connection con) {
	}

	@SuppressWarnings("unchecked")
	public List<OrderBean> getAllOrders() {
		List<OrderBean> list = null;
		String hql = "FROM OrderBean";
		Session session = factory.getCurrentSession();

		list = session.createQuery(hql).getResultList();
		return list;
	}

	@SuppressWarnings("unchecked")
	public List<OrderBean> getMemberOrders(String memberNumber) {
		List<OrderBean> list = null;
        Session session = factory.getCurrentSession();
        String hql = "FROM OrderBean ob WHERE ob.memberNumber = :mid";
        list = session.createQuery(hql)
        			  .setParameter("mid", memberNumber)
        			  .getResultList();
        return list;
	}
	
}