package company.member.dao.Impl;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.NoResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import company.member.dao.MemberDao;
import company.member.model.MemberBean;



@Repository
public class MemberDaoImpl implements MemberDao {
	@Autowired
	SessionFactory factory;
	
	@Override
	public List<MemberBean> getAllMember() {
		String hql = "FROM MemberBean";
		Session session = null;
		List<MemberBean> list = new ArrayList<MemberBean>();
		session = factory.getCurrentSession();
		list = session.createQuery(hql)
				   	  .getResultList();
		return list;
	}

	@Override
	public void saveMember(MemberBean mb) {
		Session session = factory.getCurrentSession();
		session.save(mb);
	}

	@Override
	public MemberBean getProductById(int memberId) {
		Session session = factory.getCurrentSession();
		return session.get(MemberBean.class, memberId);
	}

	@Override
	public void deleted(Integer id) {
		Session session = factory.getCurrentSession();
		MemberBean mb = getProductById(id);
		System.out.println(mb);
		if (mb != null) {
			session.delete(mb);
		}
		
	}

	@Override
	public void updateMember(MemberBean bean) {
		if (bean != null && bean.getMemberNumber() != null) {
			Session session = factory.getCurrentSession();
			session.saveOrUpdate(bean);
		}
		
	}

	@Override
	public MemberBean login(String account, String passwd) {
		MemberBean mb = null;
		Session session = factory.getCurrentSession();
		String hql = "From MemberBean m WHERE m.memberNumber = :acc and m.memberPassword = :pwd";
		try {
			mb = (MemberBean)session.createQuery(hql)
									.setParameter("acc", account)
									.setParameter("pwd",passwd)
									.getSingleResult();
			System.out.println(mb.getMemberId());
			System.out.println("登入成功");
		} catch (NoResultException e) {
			System.out.println("登入失敗");
		}

		return mb;
	}

	@Override
	public List<MemberBean> getMember(String depart) {
		String hql = "From MemberBean m Where m.memberDepartment = :depart";
		Session session = factory.getCurrentSession();

		return session.createQuery(hql)
				.setParameter("depart", depart)
				.getResultList();
	}

	@Override
	public List<String> getAllMembers() {
		String hql = "SELECT DISTINCT b.memberDepartment From MemberBean b";
		List<String> list = new ArrayList<String>();
		Session session = factory.getCurrentSession();
		list = session.createQuery(hql)
						.getResultList();
		return list;
	}
	
	


}
