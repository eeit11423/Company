package company.train.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import company.shopping.model.OrderBean;
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
	public List<RosterBean> getAllCourse() {
		String hql = "FROM RosterBean";
		Session session = factory.getCurrentSession();
		List<RosterBean> bean2 = session.createQuery(hql)
									  .getResultList();
		return bean2;
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
		List<TrainingBean> list = new ArrayList<>();
		Session session = factory.getCurrentSession();
		list = session.createQuery(hql)
				   .setParameter("cate", category)
				   .getResultList();
		return list;
		
//		Session session = factory.getCurrentSession();
//		return session.createQuery(hql)
//				   .setParameter("cate", category)
//				   .getResultList();
	}
	@Override
	public void saveTraining(TrainingBean Tb) {
		Session session = factory.getCurrentSession();
		session.save(Tb);
	}
	@Override
	public void updateTraining(TrainingBean bean) {
		if (bean != null && bean.getTrainingId() != null) {
			Session session = factory.getCurrentSession();
			session.saveOrUpdate(bean);
		}
	}
	@Override
	public TrainingBean getProductById(int productId) {
		Session session = factory.getCurrentSession();
		TrainingBean trainingBean = session.get(TrainingBean.class, productId);
		
		return trainingBean;
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
	@Override
	public void deleteCourse(int key2) {
		Session session2 = factory.getCurrentSession();
		RosterBean training2 = new RosterBean();
		training2.setRosterId(key2);
		session2.delete(training2);
	}

	
//	@Override
//	public void addscore(RosterBean rosterBean) {
//		Session session = factory.getCurrentSession();
//		session.save(rosterBean);
//	}
	@Override
	public void addscore(int totalstar,int id, int starsumtrainingId) {
//		System.out.println("====================================");
//		System.out.println(totalstar);
//		System.out.println(id);
//		System.out.println(starsumtrainingId);
		String hqlString = "UPDATE RosterBean rb SET rb.starSum = :star1" 
				+" Where rb.trainingId = :trainingId and rb.memberNumber = :memberNumber";
		Session session = factory.getCurrentSession();
		String num = Integer.toString(id);//把id轉型成字串
		session.createQuery(hqlString)
		.setParameter("star1", totalstar)
		.setParameter("trainingId", starsumtrainingId)
		.setParameter("memberNumber", num)
		.executeUpdate();		
	}

	@SuppressWarnings("unchecked")//用memberId為依據去RosterBean裡找所有的此Id的資料。
	@Override
	public List<RosterBean> listRosterBean(String memberId) {
		Session session = factory.getCurrentSession();
		String hqlRoster = "FROM RosterBean b WHERE b.memberNumber = :id";
		List<RosterBean> RosterList= session.createQuery(hqlRoster)
		.setParameter("id", memberId)
		.getResultList();
		return RosterList;
	}
	
	public void insertCourseDao(RosterBean rb) {
		Session session = factory.getCurrentSession();
        session.save(rb);
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<String> getStrings(String number) {				
//		String hql = "From RosterBean r WHERE r.memberNumber = :number";
		String hql = "Select Distinct r.trainingId From RosterBean r WHERE r.memberNumber = :number";
		Session session = factory.getCurrentSession();
		List<String> list = new ArrayList<String>();
		//ArrayList<String> list1 = (ArrayList<String>) session.createQuery(hql).setParameter("number", number).getResultList();
		List<Object[]> list1 = session.createQuery(hql).setParameter("number", number).getResultList();
		for (Object objects : list1) {
			list.add(objects.toString());
		}
		
//		RosterBean rb = new  RosterBean();
//		MemberBean memberBean = (MemberBean) model.getAttribute("memberBean");
		return list;
		}

	@Override
	public List<TrainingBean> getonetrain(Integer trainingId) {
		String hql = "From TrainingBean t where t.trainingId = :tid";
		Session session = factory.getCurrentSession();
		List<TrainingBean> tb = session.createQuery(hql)
										.setParameter("tid", trainingId)
										.getResultList();
		return tb;
	}
	@Override
	public List<String> getAllCategories123() {
//		String hql = "FROM TrainingBean b WHERE b.category = :cate";
		String hql = " Select Distinct category From TrainingBean "  ;
		List<String> list = new ArrayList<>();
		Session session = factory.getCurrentSession();
//		System.out.println("9999999999999999999999999999999999999999999");
//		System.out.println("1123123"+test);
		list = session.createQuery(hql)
//				   .setParameter("cate", test)
				   .getResultList();
//		System.out.println("DAO55555555555555"+list);
		return list;
	}
}
