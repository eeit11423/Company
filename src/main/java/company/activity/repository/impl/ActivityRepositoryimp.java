package company.activity.repository.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import company.activity.model.Activity;
import company.activity.repository.ActivityRepository;


@Repository
public class ActivityRepositoryimp implements ActivityRepository {
	
	@Autowired
	SessionFactory factory;
	
    @Override
	public void save(Activity activity) {
    	Session session = getSession();
		session.save(activity);
	}

	@Override
	public void delete(Integer id) {
		Session session = getSession();
		Activity activity = get(id);
		if (activity != null) {
			activity.setDepartment(null);
			session.delete(activity);
		}
	}

	@Override
	public Activity get(Integer id) {
		return factory.getCurrentSession().get(Activity.class, id);
	}

	@Override
	public void update(Activity activity) {
		if (activity != null && activity.getId() != null) 	{
			Session session = getSession();
			session.saveOrUpdate(activity);
		}
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Activity> getAll() {
		String hql = "FROM Activity order by id desc";
		Session session = getSession();
		List<Activity> list = session.createQuery(hql).getResultList();
		return list;
	}
	
	public Session getSession() {
        return factory.getCurrentSession();			
	}

	//新增依種類篩選方法
	
	@SuppressWarnings("unchecked")
	@Override
	public List<String> getAllActCategories() {
		String hql = "SELECT DISTINCT a.actCategory FROM Activity a";
		Session session = factory.getCurrentSession();
		return session.createQuery(hql).getResultList();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Activity> getActivitiesByActCategory(String actCategory) {
		String hql = "FROM Activity aa WHERE aa.actCategory = :actCategory order by id desc";
		List<Activity> list = new ArrayList<>();
		Session session = factory.getCurrentSession();
		list = session.createQuery(hql).setParameter("actCategory",actCategory).getResultList();
		return list;
		
	}
	
	//新增依日期篩選

	@SuppressWarnings("unchecked")
	@Override
	public List<Activity> getActivitiesByDate(Date begin, Date end) {
		String hql = "FROM Activity aad WHERE aad.endDate between :begin and :end order by id desc"; 
		List<Activity> list = new ArrayList<>();
		Session session = factory.getCurrentSession();
		list = session.createQuery(hql).setParameter("begin",begin).setParameter("end",end).getResultList();
		return list;
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Activity> getActivitiesByMemberId(Integer memberId) {
		String hql = "FROM Activity aai WHERE aai.organiserId = :memberId order by id desc";
		List<Activity> list = new ArrayList<>();
		Session session = factory.getCurrentSession();
		list = session.createQuery(hql).setParameter("memberId",memberId).getResultList();
		return list;
	}
	
	
}
