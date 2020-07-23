package company.activity.repository.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import company.activity.model.Join;
import company.activity.repository.JoinRepository;

@Repository
public class JoinRepositoryimpl implements JoinRepository {

	@Autowired
	SessionFactory factory;

	@Override
	public void save(Join join) {
		Session session = getSession();
		session.save(join);
	}


	@Override
	public void delete(Integer id) {
		Session session = getSession();
		Join join = get(id);
		if (join != null) {
			session.delete(join);
		}
	}
	
	@Override
	public Join get(Integer id) {
		return factory.getCurrentSession().get(Join.class, id);
	}

	@Override
	public void update(Join join) {
		if (join != null && join.getId() != null) 	{
			Session session = getSession();
			session.saveOrUpdate(join);
		}
	}

	public Session getSession() {
        return factory.getCurrentSession();			
	}


	@SuppressWarnings("unchecked")
	@Override
	public List<Join> getJoinsByActivityIdAndJoinMemberId(Integer activityId, Integer joinMemberId) {
		String hql = "FROM Join j WHERE j.activityId = :activityId AND j.joinMemberId = :joinMemberId";
		List<Join> list = new ArrayList<>();
		Session session = factory.getCurrentSession();
		list = session.createQuery(hql).setParameter("activityId",activityId).setParameter("joinMemberId",joinMemberId).getResultList();
		return list;
	}

	//新增有關參加人數的方法

	@Override
	public Long getJoinCountsByActivityId(Integer activityId) {
		String hql = "select count(*) from Join j where j.activityId = :activityId";
		Long num = null;
		Session session = factory.getCurrentSession();
		num = (Long)session.createQuery(hql).setParameter("activityId",activityId).getSingleResult();
		return num;
	}


	@SuppressWarnings("unchecked")
	@Override
	public List<Join> getJoinsByActivityId(Integer activityId) {
		String hql = "FROM Join jj WHERE jj.activityId = :activityId";
		List<Join> list = new ArrayList<>();
		Session session = factory.getCurrentSession();
		list = session.createQuery(hql).setParameter("activityId",activityId).getResultList();
		return list;
	}


	@SuppressWarnings("unchecked")
	@Override
	public List<Join> getJoinsByJoinMemberId(Integer joinMemberId) {
		String hql = "FROM Join jp WHERE jp.joinMemberId = :joinMemberId order by joinTime desc";
		List<Join> list = new ArrayList<>();
		Session session = factory.getCurrentSession();
		list = session.createQuery(hql).setParameter("joinMemberId",joinMemberId).getResultList();
		return list;
	}


	
}
