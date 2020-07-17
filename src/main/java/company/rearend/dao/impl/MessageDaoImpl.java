package company.rearend.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import company.rearend.dao.MessageDao;
import company.rearend.model.MessageBean;

@Repository
public class MessageDaoImpl implements MessageDao {
	@Autowired
	SessionFactory factory;
	@SuppressWarnings("unchecked")
	@Override
	public List<MessageBean> getAllMessage() {
		String hql="FROM MessageBean";
//		String hq2="FROM ShoppingBean s WHERE productrelation ";
		Session session=factory.getCurrentSession();
		List<MessageBean> list=session.createQuery(hql)
								.getResultList();
	
		return list;

	}

}
