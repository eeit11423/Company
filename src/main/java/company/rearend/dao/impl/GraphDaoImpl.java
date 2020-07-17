package company.rearend.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import company.member.model.MemberBean;
import company.rearend.dao.GraphDao;

@Repository
public class GraphDaoImpl implements GraphDao {
	@Autowired
	SessionFactory factory;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<MemberBean> getAllSalary() {
		String hql="FROM MemberBean";
		
		Session session=factory.getCurrentSession();
		List<MemberBean> list=session.createQuery(hql)
								.getResultList();

		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<MemberBean> getMemberBySalary(String Salary) {
		String hql = "SELECT M.memberDepartment,SUM(M.memberSalary) FROM MemberBean M GROUP BY M.memberDepartment";
		Session session = factory.getCurrentSession();
		List<MemberBean> list = session.createQuery(hql).getResultList();
		
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<MemberBean> getMemberBypeople(String people) {
		//String hq2 = "SELECT M.memberGender,count(memberGender) FROM MemberBean M GROUP BY M.memberDepartment,M.memberGender";
		String hql = "SELECT M.memberDepartment,count(memberId),SUM(case when memberGender='男' then 1 else 0 end),SUM(case when memberGender='女' then 1 else 0 end)"
				+ "  FROM MemberBean M GROUP BY M.memberDepartment";
		//String hql = "SELECT count() FROM MemberBean ";
		Session session = factory.getCurrentSession();
		List<MemberBean> list = session.createQuery(hql).getResultList();
		
		return list;
	}

}
