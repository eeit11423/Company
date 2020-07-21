package company.train.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import company.train.dao.ProductDao;
import company.train.model.TrainingBean;
import company.train.model.CompanyBean;
import company.train.model.RosterBean;
@Repository
public class ProductDaoImpl implements ProductDao {
	
	@Autowired
	SessionFactory  factory;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<TrainingBean> getAllProducts() {
		String hql = "FROM TrainingBean";
		Session session = factory.getCurrentSession();
		List<TrainingBean> beans = session.createQuery(hql)
									  .getResultList();
		return beans;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<String> getAllCategories() {
		String hql = "SELECT DISTINCT b.category FROM TrainingBean b";
		Session session = factory.getCurrentSession();
		return session.createQuery(hql).getResultList();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<TrainingBean> getProductsByCategory(String category) {
		String hql = "FROM TrainingBean b WHERE b.category = :cate";
		Session session = factory.getCurrentSession();
		return session.createQuery(hql)
				   .setParameter("cate", category)
				   .getResultList();
	}
	@Override
	public void saveTraining(TrainingBean Tb) {
		Session session = factory.getCurrentSession();
		session.save(Tb);
	}
	@Override
	public void updateTraining(TrainingBean bean) {
		if (bean != null && bean.getTrainingId() != null) {//範例是擷取memberNumber，這裡沒有，須注意。
			Session session = factory.getCurrentSession();
			session.saveOrUpdate(bean);
		}
	}
	@Override
	public TrainingBean getProductById(int productId) {
		Session session = factory.getCurrentSession();
		return session.get(TrainingBean.class, productId);
	}

	@Override
	public void addProduct(TrainingBean product) {
		Session session = factory.getCurrentSession();
		CompanyBean cb = getCompanyById(product.getCompanyId());
		product.setCompanyBean(cb);
		session.save(product);
	}

	@Override
	public CompanyBean getCompanyById(int companyId) {
		Session session = factory.getCurrentSession();
		return session.get(CompanyBean.class, companyId);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<CompanyBean> getCompanyList() {
		String hql = "FROM CompanyBean";
		Session session = factory.getCurrentSession();
		return session.createQuery(hql).getResultList();
	}
	
	@Override
	public void delete(int key) {
		Session session = factory.getCurrentSession();
		TrainingBean training = new TrainingBean();
		training.setTrainingId(key);
		session.delete(training);
	}
//	@Override
//	public void addscore(RosterBean rosterBean) {
//		Session session = factory.getCurrentSession();
//		session.save(rosterBean);
//	}
	@Override
	public void addscore(int totalstar,int id) {
		String hqlString = "UPDATE RosterBean rb SET rb.starSum = :star1" 
				+" Where rb.rosterId = :rid";
		Session session = factory.getCurrentSession();
		session.createQuery(hqlString)
		.setParameter("star1", totalstar)
		.setParameter("rid", id)
		.executeUpdate();
		
	}
	

}
