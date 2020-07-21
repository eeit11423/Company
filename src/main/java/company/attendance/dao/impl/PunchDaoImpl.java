package company.attendance.dao.impl;

import java.sql.Time;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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

	//抓取所有員工punch資料
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
	
	//抓取'登入的員工'punch資料
	@SuppressWarnings("unchecked")
	@Override
	public List<Punch> getPunchTime(String memberName) {
		String hql = "FROM Punch WHERE memberName = :name";
		Session session = null;
		List<Punch> list = new ArrayList<>();
		session = factory.getCurrentSession();
		list = session.createQuery(hql)
					  .setParameter("name", memberName)
					  .getResultList();
		return list;
	}
	
	@Override
	@SuppressWarnings({ "unused", "unchecked", "deprecation" })
	public void punchWorkOn(Integer memberId) {
		Session session = factory.getCurrentSession();
		//取的登入者資料
		MemberBean memberBean = session.get(MemberBean.class, memberId);
		
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		//今日日期
		Date today = new Date();
		Date dateStart = new Date();
		dateStart.setHours(0);dateStart.setMinutes(0);dateStart.setSeconds(0);
		Date dateEnd = new Date();
		dateEnd.setHours(23);dateEnd.setMinutes(59);dateEnd.setSeconds(59);
		//上班時間
		Time timeToWork = new Time(9, 0, 0);
		//打卡時間
		Timestamp punchWorkOn = new Timestamp(System.currentTimeMillis());
		//判斷打卡時間是否遲到
		String punchLate = null;
		System.out.println("今天日期："+ today +"打卡時間："+ punchWorkOn + "，上班時間為：" + timeToWork);
		if (punchWorkOn.after(timeToWork)) {
			punchLate = "遲到";
			System.out.println("遲到");
		}
		System.out.println(memberBean.getMemberName());
		//判斷今日是否已打卡
		String hql = "FROM Punch Where memberName = :name and punchDate between :dateStart and :dateEnd";
		List<Punch> list = session.createQuery(hql)
								  .setParameter("name", memberBean.getMemberName())
								  .setParameter("dateStart", dateStart)
								  .setParameter("dateEnd", dateEnd)
								  .getResultList();
		System.out.println("取得的list:" + list);
		if (list.isEmpty()) {
			Punch punch = new Punch(null, memberBean.getMemberName(), memberBean.getMemberDepartment(), 
					memberBean.getMemberNumber(), today, punchWorkOn, punchLate);
			session.save(punch);			
			System.out.println("新增成功");
		}else {
			System.out.println("今日上班已打卡");
		}
		System.out.println("上班打卡結束");
	}

	@SuppressWarnings("deprecation")
	@Override
	public Timestamp getWorkOnTime() {
		//今日日期
		Date dateStart = new Date();
		dateStart.setHours(0);dateStart.setMinutes(0);dateStart.setSeconds(0);
		Date dateEnd = new Date();
		dateEnd.setHours(23);dateEnd.setMinutes(59);dateEnd.setSeconds(59);
		Session session = factory.getCurrentSession();
		String hql = "Select punchWorkOn From Punch WHERE punchDate Between :dateStart and :dateEnd";
		Timestamp timeWorkOn = (Timestamp) session.createQuery(hql)
												  .setParameter("dateStart", dateStart)
												  .setParameter("dateEnd", dateEnd)												  
												  .getSingleResult();
		return timeWorkOn;
	}
	
	@SuppressWarnings({ "unused", "deprecation", "unchecked"})
	@Override
	public void punchWorkOff(MemberBean memberBean, Timestamp punchWorkOn) {
		//今日日期
		Date today = new Date();
		Date dateStart = new Date();
		dateStart.setHours(0);dateStart.setMinutes(0);dateStart.setSeconds(0);
		Date dateEnd = new Date();
		dateEnd.setHours(23);dateEnd.setMinutes(59);dateEnd.setSeconds(59);
		//下班時間
		Time timeToWorkOff = new Time(19, 0, 0);
		//打卡時間
		Timestamp punchWorkOff = new Timestamp(System.currentTimeMillis());
		//判斷打卡時間是否遲到
		String punchEarly = null;
		System.out.println("今天日期："+ today +"punchWorkOff時間："+ punchWorkOff + "，timeToWorkOff為：" + timeToWorkOff);
		if (punchWorkOff.getHours() < 19 ) {
			punchEarly = "早退";
			System.out.println("早退");
		}

		Session session = factory.getCurrentSession();
		System.out.println("------下班打卡開始------");
		String hql1 = "SELECT punchWorkOff FROM Punch Where memberName = :name and punchDate between :dateStart and :dateEnd";
		List<Punch> list = session.createQuery(hql1)
								  .setParameter("name", memberBean.getMemberName())
								  .setParameter("dateStart", dateStart)
								  .setParameter("dateEnd", dateEnd)
								  .getResultList();
		System.out.println("下班打卡list：" + list);
		if (list.get(0) == null) {
			String hql2 = "UPDATE Punch SET punchWorkOff = :punchWorkOff, punchEarly = :punchEarly WHERE punchWorkOn = :punchWorkOn";
			int n = session.createQuery(hql2)
						   .setParameter("punchWorkOff", punchWorkOff)
						   .setParameter("punchEarly", punchEarly)
						   .setParameter("punchWorkOn", punchWorkOn)
						   .executeUpdate();
			System.out.println("------新增下班打卡------");
		}
		System.out.println("------下班打卡結束------");
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
	public List<Punch> queryPunchTime(String memberNumber, String selectdate) {
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
