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
import company.member.model.ResignBean;

@Repository
public class MemberDaoImpl implements MemberDao {
	@Autowired
	SessionFactory factory;
	
	@Override
	public List<MemberBean> getAllMember() {
		String hql = "FROM MemberBean order by memberId desc";
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
			bean.setMemberRegisterDate(new java.sql.Timestamp(System.currentTimeMillis()));
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

	@Override
	public List<String> seachMemberaccount() {
		String hql = "SELECT DISTINCT m.memberEmail From MemberBean m ";
		List<String> list = new ArrayList<String>();
		Session session = factory.getCurrentSession();
		list = session.createQuery(hql)
					  .getResultList();
		System.out.println("da05"+list);
		return list;
	}

	@Override
	public void updatePasswd(String email) {
		String passwd = "@8M75K";
		String hql = "UPDATE MemberBean mb SET mb.memberPassword = :mpwd " +
					"Where mb.memberEmail = :memail";
		Session session = factory.getCurrentSession();
		System.out.println("密碼更新中0000000000000");
		session.createQuery(hql)
				.setParameter("mpwd", passwd)
				.setParameter("memail", email)
				.executeUpdate();
		System.out.println("密碼已更新");
		
	}

	@Override
	public List<MemberBean> getOneMember(String account) {
		String hql = "From MemberBean m Where m.memberNumber = :number";
		Session session = factory.getCurrentSession();
		List<MemberBean> list = new ArrayList<MemberBean>();
		list = session.createQuery(hql)
					.setParameter("number", account)
					.getResultList();
		return list;
	}

	@Override
	public boolean idExists(String id) {
		boolean exist = false;
		String hql = "FROM MemberBean m WHERE m.memberNumber = :maccount" ; 
		Session session = factory.getCurrentSession();
		List<MemberBean> beans = session.createQuery(hql)
										.setParameter("maccount",id)
										.getResultList();
		if (beans.size() > 0) {
			exist = true;
		}
		return exist;
	}

	@Override
	public boolean CheckPassword(String oldpwd, String newpwd,Integer  id) {
		boolean check = false;
		System.out.println(" DAO check1      "+ check);
		String hql = "FROM MemberBean m WHERE m.memberPassword = :mold";
		String hql2 = "UPDATE MemberBean mb SET mb.memberPassword = :mpwd " 
		+ "Where mb.memberPassword = :mold and mb.memberId = :mid"; 
		Session session = factory.getCurrentSession();
		List<MemberBean> beans = session.createQuery(hql)
										.setParameter("mold", oldpwd)
										.getResultList();
		System.out.println(beans);
		if (beans.size() == 0) {
			check = false;
			System.out.println(" DAO check2      "+ check);
			return check;
		}else {
			session.createQuery(hql2)
					.setParameter("mpwd", newpwd)
					.setParameter("mold", oldpwd)
					.setParameter("mid", id)
					.executeUpdate();
			check = true;
			System.out.println(" DAO check3      "+ check);
			return check;
		}
	}

	@Override
	public List<MemberBean> getOneMemberID(Integer id) {
		String hql = "From MemberBean m Where m.memberId = :mid";
		Session session = factory.getCurrentSession();
		return  session.createQuery(hql)
					.setParameter("mid", id)
					.getResultList();
		
	}

	@Override
	public MemberBean saveId(List<ResignBean> rb) {
		Session session = factory.getCurrentSession();
		MemberBean mb = new MemberBean();
		for (ResignBean resignBean : rb) {
			mb.MemberResig(resignBean);
			session.save(mb);
		}
		return mb;
	}

//	@Override
//	public ResignBean saveId(List<MemberBean> mb) {
//		Session session = factory.getCurrentSession();
//		ResignBean rb = new ResignBean();
//		for (MemberBean memberBean : mb) {
//			rb.ResigMember(memberBean);
//			session.save(rb);
//		}
//		return rb;
//	}
//
//	@Override
//	public List<ResignBean> getAllResignMember() {
//		String hql = "FROM ResignBean";
//		Session session = null;
//		List<ResignBean> list = new ArrayList<ResignBean>();
//		session = factory.getCurrentSession();
//		list = session.createQuery(hql)
//				   	  .getResultList();
//		return list;
//		
//	}
//
//	@Override
//	public ResignBean getProduct1ById(int memberId) {
//		Session session = factory.getCurrentSession();
//		return session.get(ResignBean.class, memberId);
//		
//	}


	
	


}
