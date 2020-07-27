package company.member.dao.Impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import company.member.dao.ResignDao;
import company.member.model.MemberBean;
import company.member.model.ResignBean;

@Repository
public class ResignDaoImpl implements ResignDao {
	@Autowired
	SessionFactory factory;

	@Override
	public ResignBean saveId(List<MemberBean> mb) {
		Session session = factory.getCurrentSession();
		ResignBean rb = new ResignBean();
		for (MemberBean memberBean : mb) {
			rb.ResigMember(memberBean);
			session.save(rb);
		}
		return rb;
	}

	@Override
	public ResignBean getProduct1ById(int memberId) {
		Session session = factory.getCurrentSession();
		return session.get(ResignBean.class, memberId);
	}

	@Override
	public List<ResignBean> getAllResignMember() {
		String hql = "FROM ResignBean";
		Session session = null;
		List<ResignBean> list = new ArrayList<ResignBean>();
		session = factory.getCurrentSession();
		list = session.createQuery(hql)
				   	  .getResultList();
		return list;
	}

	@Override
	public List<ResignBean> getOneMemberID(Integer id) {
		String hql = "From ResignBean m Where m.memberId = :mid";
		Session session = factory.getCurrentSession();
		return  session.createQuery(hql)
					.setParameter("mid", id)
					.getResultList();
		
	}

	@Override
	public void deleted(Integer id) {
		Session session = factory.getCurrentSession();
		ResignBean rb = getProduct1ById(id);
		System.out.println(rb);
		if (rb != null) {
			session.delete(rb);
		}
	}

}
