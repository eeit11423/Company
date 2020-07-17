package company.shopping.service.impl;

import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import company.member.dao.MemberDao;
import company.shopping.dao.OrderDao;
import company.shopping.dao.OrderItemDao;
import company.shopping.model.OrderBean;
import company.shopping.model.OrderItemBean;
import company.shopping.service.OrderService;





@Service
public class OrderServiceImpl implements OrderService {
//	private SessionFactory factory;
	@Autowired
	private OrderItemDao oidao;
	@Autowired
	private OrderDao odao;
	@Autowired
	private MemberDao mdao;

	public OrderServiceImpl() {
//		factory = HibernateUtils.getSessionFactory();
//		oidao = new OrderItemDaoImpl_Hibernate();
//		odao = new OrderDaoImpl_Hibernate();
//		mdao = new MemberDaoImpl_Hibernate();
	}

	@Transactional
	@Override
	// 這是一個交易
	public void persistOrder(OrderBean ob) {

//		mdao.updateUnpaidOrderAmount(ob);
		// 檢查每筆訂單明細所訂購之商品的庫存數量是否足夠
		checkStock(ob);
		// 儲存該筆訂單
		odao.insertOrder(ob);

	}

	public void checkStock(OrderBean ob) {
		Set<OrderItemBean> items = ob.getItems();
		for (OrderItemBean oib : items) {
			oidao.updateProductStock(oib);
		}
	}

	public OrderDao getOdao() {
		return odao;
	}

	public void setOdao(OrderDao odao) {
		this.odao = odao;
	}

//	@Override
//	// 本方法為過渡版本
//	public OrderBean getOrder(int orderNo) {
//		OrderBean bean = null;
//		Session session = factory.getCurrentSession();
//		Transaction tx = null;
//		try {
//			tx = session.beginTransaction();
//			bean = odao.getOrder(orderNo);
//			tx.commit();
//		} catch (Exception e) {
//			if (tx != null)
//				tx.rollback();
//			throw new RuntimeException(e);
//		}
//		return bean;
//	}
	@Transactional
	@Override
	// 本方法將由控制 Lazy Loading 的過濾器之doFilter()方法間接呼叫，所以不可以在此方法內執行與交易
	// 有關的方法
	public OrderBean getOrder(int orderNo) {
		OrderBean bean = null;
		bean = odao.getOrder(orderNo);

		return bean;
	}

	@Transactional
	@Override
	public List<OrderBean> getAllOrders() {
		List<OrderBean> list = null;
		list = odao.getAllOrders();

		return list;
	}

	@Transactional
	@Override
	public List<OrderBean> getMemberOrders(String memberNumber) {
		List<OrderBean> list = null;
		list = odao.getMemberOrders(memberNumber);
		return list;
	}
	@Transactional
	@Override
	public List<OrderItemBean> getmemberitems(int orderNo) {
		List<OrderItemBean> list = null;
		list = oidao.getmemberitems(orderNo);
		return list;
	}
}
