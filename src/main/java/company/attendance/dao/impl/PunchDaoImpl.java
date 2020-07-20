package company.attendance.dao.impl;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.NoResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import company.attendance.dao.PunchDao;
import company.member.model.MemberBean;
import company.attendance.model.Punch;

@Repository
public class PunchDaoImpl implements PunchDao {
	@Autowired
	SessionFactory factory;

	@SuppressWarnings("unchecked")
	@Override
	public List<Punch> getPunchTime() {
		String hql = "FROM Punch";
		Session session = null;
		List<Punch> list = new ArrayList<>();
		session = factory.getCurrentSession();
		list = session.createQuery(hql).getResultList();
		return list;
	}

	@SuppressWarnings("unused")
	@Override
	public void punchWorkOff(Timestamp punchWorkOn) {
		String hql = "UPDATE Punch p SET p.punchWorkOff = :punchWorkOff WHERE punchWorkOn = :punchWorkOn";
		Session session = factory.getCurrentSession();
		Timestamp ctime = new Timestamp(System.currentTimeMillis());
		int n = session.createQuery(hql).setParameter("punchWorkOff", ctime).setParameter("punchWorkOn", punchWorkOn)
				.executeUpdate();
	}

	@Override
	public Timestamp getWorkOnTime() {
//		String hql = "Select top 1 punchWorkOn From Punch order by punchWorkOn desc";
		String hql = "Select max(punchWorkOn) From Punch";
		Session session = null;
		Timestamp ts = null;
		session = factory.getCurrentSession();
		ts = (Timestamp) session.createQuery(hql).getSingleResult();
		return ts;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<MemberBean> getAllMember() {
		String hql = "FROM MemberBean";
		System.out.println(Thread.currentThread().getName());
		Session session = factory.getCurrentSession();
		List<MemberBean> list = new ArrayList<>();
		list = session.createQuery(hql).getResultList();
		System.out.println(list);
		return list;
	}

	@Override
	@SuppressWarnings("unused")
	public void punchWorkOn() {
		Session session = factory.getCurrentSession();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Timestamp ctime1 = new Timestamp(System.currentTimeMillis());
		System.out.println(ctime1);
		Punch punch = new Punch(null, "鋼鐵人", "資訊部", 1003, ctime1, ctime1, null);
		session.save(punch);
	}
//	@Override
//	@SuppressWarnings("unused")
//	public void punchWorkOff() {
//		Session session = factory.getCurrentSession();
//		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		Timestamp ctime2 = new Timestamp(System.currentTimeMillis());
//		System.out.println(ctime2);
//		Punch punch = new Punch(null, "STA", "營業部", 2, null, ctime2);
//		session.save(punch);
//	}

	@Override
	public int savePunchTime(Punch punch) {
		int n = 0;
		boolean exist = isMemberAndPunchDateExist(punch);
		if (exist) {
			return -1;
		}
		Session session = factory.getCurrentSession();
		try {
			session.save(punch);
			n = 1;
		} catch (Exception e) {
			n = -2;
		}
		return n;
	}
	
	@Override
	public boolean isMemberAndPunchDateExist(Punch punch) {
		boolean exist = false;
		Session session = factory.getCurrentSession();
		String hql = "FROM Punch WHERE punchDate=:punchDate and memberName=:memberName";
		try {
			Object list = session.createQuery(hql)
								  .setParameter("punchDate", punch.getPunchDate())
								  .setParameter("memberName", punch.getMemberName())
								  .getSingleResult();
			if (list != null) {
				exist = true;
			}
		} catch (NoResultException ex) {
			;
		}
		return exist;
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<Punch> queryPunchTime(int memberNumber, String selectdate) {
		System.out.println(selectdate);
		String timesplit[] = selectdate.split("-");
		if (timesplit.length == 1) {
			String hql = "FROM Punch WHERE memberNumber = :number Order By punchDate";
			Session session = factory.getCurrentSession();
			List<Punch> listTarget = session.createQuery(hql)
											.setParameter("number", memberNumber)
											.getResultList();
			return listTarget;
		} else {
			String hql = "FROM Punch WHERE memberNumber = :number and DATEPART(yyyy,punchDate) = :yyyy and DATEPART(mm,punchDate) = :mm Order By punchDate";
			Session session = factory.getCurrentSession();
			List<Punch> listTarget = session.createQuery(hql)
											.setParameter("number", memberNumber)
											.setParameter("yyyy", timesplit[0])
											.setParameter("mm", timesplit[1])
											.getResultList();
			return listTarget;
		}
	}

	@Override
	public Punch editPunchtimeFromPunchId(int punchId) {
		Session session = factory.getCurrentSession();
		Punch punchtime = session.get(Punch.class, punchId);
		return punchtime;
	}

	@Override
	public void updatePunchTime(Punch punch) {
		Session session = factory.getCurrentSession();
		session.update(punch);

	}

	@Override
	public void deletePunchTimeByPunchId(int key) {
		Session session = factory.getCurrentSession();
		Punch punch = new Punch();
		punch.setPunchId(key);
		session.delete(punch);
	}
}
