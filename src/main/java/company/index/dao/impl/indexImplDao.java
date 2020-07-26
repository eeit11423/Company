package company.index.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import company.index.dao.indexIDao;
import company.index.model.indexBean;

@Repository
public class indexImplDao implements indexIDao {
	@Autowired
	SessionFactory factory;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<indexBean> getAllProducts() {
		String hql="FROM indexBean";
		Session session=factory.getCurrentSession();
		List<indexBean> list=session.createQuery(hql)
								.getResultList();	
		return list;
	}

	
	public indexImplDao() {
		super();
	}


	@Override
	public void addindexpicture(indexBean product) {
		Session session = factory.getCurrentSession();
		session.save(product);
	}

	@Override
	public indexBean getindexId(Integer indexId) {
		Session session = factory.getCurrentSession();
		return session.get(indexBean.class, indexId);
	}

	@Override
	public void update(indexBean indexBean) {
		  Session session=factory.getCurrentSession();
		  session.update (indexBean);

	}

	@Override
	public void delete(Integer indexId) {
		Session session = factory.getCurrentSession();
		indexBean tb=getindexId(indexId);
		session.delete(tb);

	}

}
