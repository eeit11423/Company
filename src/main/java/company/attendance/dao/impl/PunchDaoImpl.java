package company.attendance.dao.impl;

import java.sql.Time;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.persistence.NoResultException;

import org.apache.commons.collections4.map.HashedMap;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import company.attendance.dao.PunchDao;
import company.member.model.MemberBean;
import company.attendance.model.Leave;
import company.attendance.model.Punch;

@Repository
@SuppressWarnings("deprecation")
public class PunchDaoImpl implements PunchDao {
	@Autowired
	SessionFactory factory;
	
	//今日日期
	Date today = new Date();
	int todayMonth = today.getMonth()+1;
	int todayDate = today.getDate();
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
	@SuppressWarnings({ "unused", "unchecked" })
	public void punchWorkOn(Integer memberId) {
		Session session = factory.getCurrentSession();
		//取的登入者資料
		MemberBean memberBean = session.get(MemberBean.class, memberId);
		
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		//打卡時間
		Timestamp punchWorkOn = new Timestamp(System.currentTimeMillis());
		//判斷打卡時間是否遲到
		String punchLate = null;
		System.out.println("今天日期："+ new Date() +"打卡時間："+ punchWorkOn + "，上班時間為：09:00:00" );
		System.out.println(todayMonth);
		System.out.println(todayDate);
		if (punchWorkOn.getHours()>9) {
			punchLate = "遲到";
		}else if (punchWorkOn.getHours() == 9 && (punchWorkOn.getMinutes()>0 || punchWorkOn.getSeconds()>0)) {
			punchLate = "遲到";				
		}
		System.out.println(memberBean.getMemberName());
		//判斷今日是否已打卡
		String hql = "FROM Punch Where memberName = :name and DATEPART(mm,punchDate) = :month and DATEPART(dd,punchDate) = :day";
		List<Punch> list = session.createQuery(hql)
								  .setParameter("name", memberBean.getMemberName())
								  .setParameter("month", todayMonth)
								  .setParameter("day", todayDate)
								  .getResultList();
		System.out.println("--------------取得的list:" + list.size());
		if (list.isEmpty()) {
			Punch punch = new Punch(null, memberBean.getMemberName(), memberBean.getMemberDepartment(), 
					memberBean.getMemberNumber(), today, punchWorkOn, punchLate);
			session.save(punch);			
			System.out.println("新增成功");
			System.out.println(punch.getPunchWorkOff());
		}else {
			System.out.println("今日上班已打卡");
		}
		System.out.println("上班打卡結束");
	}

	@Override
	public Timestamp getWorkOnTime(Integer memberId) {
		Session session = factory.getCurrentSession();
		MemberBean memberBean = session.get(MemberBean.class, memberId);
		String hql = "Select punchWorkOn FROM Punch Where memberName = :name and DATEPART(mm,punchDate) = :month and DATEPART(dd,punchDate) = :day";
		Timestamp timeWorkOn = (Timestamp) session.createQuery(hql)
												  .setParameter("name", memberBean.getMemberName())
												  .setParameter("month", todayMonth)
												  .setParameter("day", todayDate)												  
												  .getSingleResult();
		System.out.println(timeWorkOn);
		return  timeWorkOn;
	}
	
	@SuppressWarnings({ "unused", "unchecked"})
	@Override
	public void punchWorkOff(MemberBean memberBean, Timestamp punchWorkOn) {
		//下班時間
		Time timeToWorkOff = new Time(19, 0, 0);
		//打卡時間
		Timestamp punchWorkOff = new Timestamp(System.currentTimeMillis());
		//判斷打卡時間是否遲到
		String punchEarly = null;
		System.out.println("今天日期："+ today +"punchWorkOff時間："+ punchWorkOff + "，timeToWorkOff為：" + timeToWorkOff);
		if (punchWorkOff.getHours() < 18 ) {
			punchEarly = "早退";
		}
		Session session = factory.getCurrentSession();
		System.out.println("------下班打卡開始------");
		String hql = "Select punchWorkOff FROM Punch Where memberName = :name and DATEPART(mm,punchDate) = :month and DATEPART(dd,punchDate) = :day";
		List<Punch> list = session.createQuery(hql)
								  .setParameter("name", memberBean.getMemberName())
								  .setParameter("month", todayMonth)
								  .setParameter("day", todayDate)
								  .getResultList();
		System.out.println("下班打卡list：" + list);
		if (list.get(0) == null) {
			long punchHours = punchWorkOff.getTime() - punchWorkOn.getTime();
			String hql2 = "UPDATE Punch SET punchWorkOff = :punchWorkOff, punchEarly = :punchEarly, punchHours = :punchHours WHERE punchWorkOn = :punchWorkOn";
			 session.createQuery(hql2)
			 		.setParameter("punchWorkOff", punchWorkOff)
			 		.setParameter("punchEarly", punchEarly)
			 		.setParameter("punchWorkOn", punchWorkOn)
			 		.setParameter("punchHours", punchHours)
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
			String punchLate = null;		
			String punchEarly = null;
			long punchHours = punch.getPunchWorkOff().getTime() - punch.getPunchWorkOn().getTime();
			if (punch.getPunchWorkOn().getHours()<12 && punch.getPunchWorkOff().getHours()>13) {
				punchHours -= 3600000;
			}
			
			if (punch.getPunchWorkOn().getHours() > 9 ) {
				punchLate = "遲到";
			}else if (punch.getPunchWorkOn().getHours() ==9 && punch.getPunchWorkOn().getMinutes() > 0 || punch.getPunchWorkOn().getSeconds() >0) {
				
			}
			if (punch.getPunchWorkOff().getHours() < 18 ) {
				punchEarly = "早退";
			}
			punch.setPunchLate(punchLate);
			punch.setPunchEarly(punchEarly);
			punch.setPunchHours(punchHours);
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
			ex.printStackTrace();
		}
		return exist;
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<Punch> queryPunchTime(String memberNumber, String selectdate) {
		Session session = factory.getCurrentSession();
		String timesplit[] = selectdate.split("-");
		System.out.println(memberNumber);
		System.out.println(selectdate);
		
		if (timesplit.length == 1) {                     //所有時間
			if(memberNumber.equals("all")) {				//所有員工
				System.out.println("所有員工-所有時間");
				String hql = "FROM Punch Order By punchDate DESC";
				List<Punch> listTarget = session.createQuery(hql)
						.getResultList();
				return listTarget;
			}else {
				System.out.println("指定員工-所有時間");		//指定員工
				String hql = "FROM Punch WHERE memberNumber = :number Order By punchDate DESC";
				List<Punch> listTarget = session.createQuery(hql)
						.setParameter("number", memberNumber)
						.getResultList();
				return listTarget;
			}
		}else {											 //指定時間
			if(memberNumber.equals("all")){					//所有員工
				System.out.println("所有員工-指定時間");
				String hql = "FROM Punch WHERE DATEPART(yyyy,punchDate) = :yyyy and DATEPART(mm,punchDate) = :mm Order By punchDate DESC";
				List<Punch> listTarget = session.createQuery(hql)
						.setParameter("yyyy", timesplit[0])
						.setParameter("mm", timesplit[1])
						.getResultList();
				return listTarget;
			}else{											//指定員工
				System.out.println("指定員工-指定時間");
				String hql = "FROM Punch WHERE memberNumber = :number and DATEPART(yyyy,punchDate) = :yyyy and DATEPART(mm,punchDate) = :mm Order By punchDate DESC";
				List<Punch> listTarget = session.createQuery(hql)
						.setParameter("number", memberNumber)
						.setParameter("yyyy", timesplit[0])
						.setParameter("mm", timesplit[1])
						.getResultList();
				return listTarget;
				}
		}
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public List<Punch> queryPunchTimeByPunchLate(String memberNumber, String selectdate, String punchLate) {
		Session session = factory.getCurrentSession();
		String timesplit[] = selectdate.split("-");
		System.out.println(memberNumber);
		System.out.println(selectdate);
		System.out.println(punchLate);
		
		if (timesplit.length == 1) {                     //所有時間
			if(memberNumber.equals("all")) {				//所有員工
				System.out.println("所有員工-所有時間");
				String hql = "FROM Punch where punchLate = :punchLate Order By punchDate DESC";
				List<Punch> listTarget = session.createQuery(hql)
						.setParameter("punchLate", punchLate)
						.getResultList();
				return listTarget;
			}else {
				System.out.println("指定員工-所有時間");		//指定員工
				String hql = "FROM Punch WHERE memberNumber = :number and punchLate = :punchLate Order By punchDate DESC";
				List<Punch> listTarget = session.createQuery(hql)
						.setParameter("number", memberNumber)
						.setParameter("punchLate", punchLate)
						.getResultList();
				return listTarget;
			}
		}else {											 //指定時間
			if(memberNumber.equals("all")){					//所有員工
				System.out.println("所有員工-指定時間");
				String hql = "FROM Punch WHERE DATEPART(yyyy,punchDate) = :yyyy and DATEPART(mm,punchDate) = :mm and punchLate = :punchLate Order By punchDate DESC";
				List<Punch> listTarget = session.createQuery(hql)
						.setParameter("yyyy", timesplit[0])
						.setParameter("mm", timesplit[1])
						.setParameter("punchLate", punchLate)
						.getResultList();
				return listTarget;
			}else{											//指定員工
				System.out.println("指定員工-指定時間");
				String hql = "FROM Punch WHERE memberNumber = :number and DATEPART(yyyy,punchDate) = :yyyy and DATEPART(mm,punchDate) = :mm and punchLate = :punchLate Order By punchDate DESC";
				List<Punch> listTarget = session.createQuery(hql)
						.setParameter("number", memberNumber)
						.setParameter("yyyy", timesplit[0])
						.setParameter("mm", timesplit[1])
						.setParameter("punchLate", punchLate)
						.getResultList();
				return listTarget;
				}
		}
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public List<Punch> queryPunchTimeByPunchEarly(String memberNumber, String selectdate, String punchEarly) {
		Session session = factory.getCurrentSession();
		String timesplit[] = selectdate.split("-");
		System.out.println(memberNumber);
		System.out.println(selectdate);
		System.out.println(punchEarly);
		
		if (timesplit.length == 1) {                     //所有時間
			if(memberNumber.equals("all")) {				//所有員工
				System.out.println("所有員工-所有時間");
				String hql = "FROM Punch where punchEarly = :punchEarly Order By punchDate DESC";
				List<Punch> listTarget = session.createQuery(hql)
						.setParameter("punchEarly", punchEarly)
						.getResultList();
				return listTarget;
			}else {
				System.out.println("指定員工-所有時間");		//指定員工
				String hql = "FROM Punch WHERE memberNumber = :number and punchEarly = :punchEarly Order By punchDate DESC";
				List<Punch> listTarget = session.createQuery(hql)
						.setParameter("number", memberNumber)
						.setParameter("punchEarly", punchEarly)
						.getResultList();
				return listTarget;
			}
		}else {											 //指定時間
			if(memberNumber.equals("all")){					//所有員工
				System.out.println("所有員工-指定時間");
				String hql = "FROM Punch WHERE DATEPART(yyyy,punchDate) = :yyyy and DATEPART(mm,punchDate) = :mm and punchEarly = :punchEarly Order By punchDate DESC";
				List<Punch> listTarget = session.createQuery(hql)
						.setParameter("yyyy", timesplit[0])
						.setParameter("mm", timesplit[1])
						.setParameter("punchEarly", punchEarly)
						.getResultList();
				return listTarget;
			}else{											//指定員工
				System.out.println("指定員工-指定時間");
				String hql = "FROM Punch WHERE memberNumber = :number and DATEPART(yyyy,punchDate) = :yyyy and DATEPART(mm,punchDate) = :mm and punchEarly = :punchEarly Order By punchDate DESC";
				List<Punch> listTarget = session.createQuery(hql)
						.setParameter("number", memberNumber)
						.setParameter("yyyy", timesplit[0])
						.setParameter("mm", timesplit[1])
						.setParameter("punchEarly", punchEarly)
						.getResultList();
				return listTarget;
			}
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
		String punchLate = null;		
		String punchEarly = null;
		//判斷新增或修改的時間紀錄是否異常
		if (punch.getPunchWorkOn().getHours() > 9 || 
				(punch.getPunchWorkOn().getHours() ==9 && 
				(punch.getPunchWorkOn().getMinutes() + 
						punch.getPunchWorkOn().getSeconds()>0))) {
			punchLate = "遲到";
		}
		if (punch.getPunchWorkOff().getHours() < 18 ) {
			punchEarly = "早退";
		}
		long punchHours = punch.getPunchWorkOff().getTime() - punch.getPunchWorkOn().getTime();
		punch.setPunchHours(punchHours);
		punch.setPunchLate(punchLate);
		punch.setPunchEarly(punchEarly);
		
	      long diffMinutes = punchHours/(60 * 1000) % 60; 
	      long diffHours = punchHours/(60 * 60 * 1000) % 24; 
	      
	      System.out.print(diffHours + " hours, "); 
	      System.out.print(diffMinutes + " minutes, "); 
	      System.out.println(punchHours);
		session.update(punch);
	}

	@Override
	public void deletePunchTimeByPunchId(int key) {
		Session session = factory.getCurrentSession();
		Punch punch = new Punch();
		punch.setPunchId(key);
		session.delete(punch);
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public Map<String, List<?>> queryAttendanceData(String memberNumber, String selectdate) {
		Session session = factory.getCurrentSession();
		String timesplit[] = selectdate.split("-");
		System.out.println(memberNumber);
		System.out.println(selectdate);
		Map<String, List<?>> map = new HashedMap();
		
		if (timesplit.length == 1) {                     //所有時間
			if(memberNumber.equals("all")) {				//所有員工
				System.out.println("所有員工-所有時間");
				String hql1 = "FROM Punch Order By punchDate DESC";
				List<Punch> listPunch = session.createQuery(hql1)
						.getResultList();
				String hql2 = "FROM Leave Order By LeaveDate DESC";
				List<Leave> listLeave = session.createQuery(hql2)
						.getResultList();
				map.put("punch", listPunch);
				map.put("leave", listLeave);
				return map;
			}else {
				System.out.println("指定員工-所有時間");		//指定員工
				String hql1 = "FROM Punch WHERE memberNumber = :memberNumber Order By punchDate DESC";
				List<Punch> listPunch = session.createQuery(hql1)
											   .setParameter("memberNumber", memberNumber)
											   .getResultList();
				String hql2 = "FROM Leave WHERE memberNumber = :memberNumber Order By LeaveDate DESC";
				List<Leave> listLeave = session.createQuery(hql2)
											   .setParameter("memberNumber", memberNumber)
											   .getResultList();
				map.put("punch", listPunch);
				map.put("leave", listLeave);
				return map;
			}
		}else {											 //指定時間
			if(memberNumber.equals("all")){					//所有員工
				System.out.println("所有員工-指定時間");
				String hql1 = "FROM Punch WHERE DATEPART(yyyy,punchDate) = :yyyy and DATEPART(mm,punchDate) = :mm Order By punchDate DESC";
				List<Punch> listPunch = session.createQuery(hql1)
											   .setParameter("yyyy", timesplit[0])
											   .setParameter("mm", timesplit[1])
											   .getResultList();
				String hql2 = "FROM Leave WHERE DATEPART(yyyy,leaveDate) = :yyyy and DATEPART(mm,leaveDate) = :mm Order By LeaveDate DESC";
				List<Leave> listLeave = session.createQuery(hql2)						
											   .setParameter("yyyy", timesplit[0])
											   .setParameter("mm", timesplit[1])
											   .getResultList();
				map.put("punch", listPunch);
				map.put("leave", listLeave);
				return map;
			}else{											//指定員工
				System.out.println("指定員工-指定時間");
				String hql1 = "FROM Punch WHERE memberNumber = :memberNumber and DATEPART(yyyy,punchDate) = :yyyy and DATEPART(mm,punchDate) = :mm Order By punchDate DESC";
				List<Punch> listPunch = session.createQuery(hql1)
											   .setParameter("memberNumber", memberNumber)
											   .setParameter("yyyy", timesplit[0])
											   .setParameter("mm", timesplit[1])
											   .getResultList();
				String hql2 = "FROM Leave WHERE memberNumber = :memberNumber and DATEPART(yyyy,leaveDate) = :yyyy and DATEPART(mm,leaveDate) = :mm Order By LeaveDate DESC";
				List<Leave> listLeave = session.createQuery(hql2)						
											   .setParameter("memberNumber", memberNumber)
											   .setParameter("yyyy", timesplit[0])
											   .setParameter("mm", timesplit[1])
											   .getResultList();
				map.put("punch", listPunch);
				map.put("leave", listLeave);
				return map;
				}
		}
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public Map<String, List<?>> queryAttendanceDataByPunchLate(String memberNumber, String selectdate, String punchLate) {
		Session session = factory.getCurrentSession();
		String timesplit[] = selectdate.split("-");
		System.out.println(memberNumber);
		System.out.println(selectdate);
		Map<String, List<?>> map = new HashedMap();
		
		if (timesplit.length == 1) {                     //所有時間
			if(memberNumber.equals("all")) {				//所有員工
				System.out.println("所有員工-所有時間");
				String hql1 = "FROM Punch WHERE punchLate = :punchLate Order By punchDate DESC";
				List<Punch> listPunch = session.createQuery(hql1)
											   .setParameter("punchLate", punchLate)
											   .getResultList();
//				String hql2 = "FROM Leave Order By LeaveDate DESC";
//				List<Leave> listLeave = session.createQuery(hql2)
//												.getResultList();
				map.put("punch", listPunch);
//				map.put("leave", listLeave);
				return map;
			}else {
				System.out.println("指定員工-所有時間");		//指定員工
				String hql1 = "FROM Punch WHERE memberNumber = :memberNumber and punchLate = :punchLate Order By punchDate DESC";
				List<Punch> listPunch = session.createQuery(hql1)
											   .setParameter("memberNumber", memberNumber)
											   .setParameter("punchLate", punchLate)
											   .getResultList();
//				String hql2 = "FROM Leave WHERE memberNumber = :memberNumber Order By LeaveDate DESC";
//				List<Leave> listLeave = session.createQuery(hql2)
//											   .setParameter("memberNumber", memberNumber)
//											   .getResultList();
				map.put("punch", listPunch);
//				map.put("leave", listLeave);
				return map;
			}
		}else {											 //指定時間
			if(memberNumber.equals("all")){					//所有員工
				System.out.println("所有員工-指定時間");
				String hql1 = "FROM Punch WHERE punchLate = :punchLate and DATEPART(yyyy,punchDate) = :yyyy and DATEPART(mm,punchDate) = :mm Order By punchDate DESC";
				List<Punch> listPunch = session.createQuery(hql1)
											   .setParameter("yyyy", timesplit[0])
											   .setParameter("mm", timesplit[1])
											   .setParameter("punchLate", punchLate)
											   .getResultList();
//				String hql2 = "FROM Leave WHERE DATEPART(yyyy,leaveDate) = :yyyy and DATEPART(mm,leaveDate) = :mm Order By LeaveDate DESC";
//				List<Leave> listLeave = session.createQuery(hql2)						
//											   .setParameter("yyyy", timesplit[0])
//											   .setParameter("mm", timesplit[1])
//											   .getResultList();
				map.put("punch", listPunch);
//				map.put("leave", listLeave);
				return map;
			}else{											//指定員工
				System.out.println("指定員工-指定時間");
				String hql1 = "FROM Punch WHERE memberNumber = :memberNumber and punchLate = :punchLate and DATEPART(yyyy,punchDate) = :yyyy and DATEPART(mm,punchDate) = :mm Order By punchDate DESC";
				List<Punch> listPunch = session.createQuery(hql1)
											   .setParameter("memberNumber", memberNumber)
											   .setParameter("yyyy", timesplit[0])
											   .setParameter("mm", timesplit[1])
											   .setParameter("punchLate", punchLate)
											   .getResultList();
//				String hql2 = "FROM Leave WHERE memberNumber = :memberNumber and DATEPART(yyyy,leaveDate) = :yyyy and DATEPART(mm,leaveDate) = :mm Order By LeaveDate DESC";
//				List<Leave> listLeave = session.createQuery(hql2)						
//											   .setParameter("memberNumber", memberNumber)
//											   .setParameter("yyyy", timesplit[0])
//											   .setParameter("mm", timesplit[1])
//											   .getResultList();
				map.put("punch", listPunch);
//				map.put("leave", listLeave);
				return map;
				}
		}
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public Map<String, List<?>> queryAttendanceDataByPunchEarly(String memberNumber, String selectdate, String punchEarly) {
		Session session = factory.getCurrentSession();
		String timesplit[] = selectdate.split("-");
		System.out.println(memberNumber);
		System.out.println(selectdate);
		Map<String, List<?>> map = new HashedMap();
		
		if (timesplit.length == 1) {                     //所有時間
			if(memberNumber.equals("all")) {				//所有員工
				System.out.println("所有員工-所有時間");
				String hql1 = "FROM Punch WHERE punchEarly = :punchEarly Order By punchDate DESC";
				List<Punch> listPunch = session.createQuery(hql1)
											   .setParameter("punchEarly", punchEarly)
											   .getResultList();
//				String hql2 = "FROM Leave Order By LeaveDate DESC";
//				List<Leave> listLeave = session.createQuery(hql2)
//												.getResultList();
				map.put("punch", listPunch);
//				map.put("leave", listLeave);
				return map;
			}else {
				System.out.println("指定員工-所有時間");		//指定員工
				String hql1 = "FROM Punch WHERE memberNumber = :memberNumber and punchEarly = :punchEarly Order By punchDate DESC";
				List<Punch> listPunch = session.createQuery(hql1)
											   .setParameter("memberNumber", memberNumber)
											   .setParameter("punchEarly", punchEarly)
											   .getResultList();
//				String hql2 = "FROM Leave WHERE memberNumber = :memberNumber Order By LeaveDate DESC";
//				List<Leave> listLeave = session.createQuery(hql2)
//											   .setParameter("memberNumber", memberNumber)
//											   .getResultList();
				map.put("punch", listPunch);
//				map.put("leave", listLeave);
				return map;
			}
		}else {											 //指定時間
			if(memberNumber.equals("all")){					//所有員工
				System.out.println("所有員工-指定時間");
				String hql1 = "FROM Punch WHERE punchEarly = :punchEarly and DATEPART(yyyy,punchDate) = :yyyy and DATEPART(mm,punchDate) = :mm Order By punchDate DESC";
				List<Punch> listPunch = session.createQuery(hql1)
											   .setParameter("yyyy", timesplit[0])
											   .setParameter("mm", timesplit[1])
											   .setParameter("punchEarly", punchEarly)
											   .getResultList();
//				String hql2 = "FROM Leave WHERE DATEPART(yyyy,leaveDate) = :yyyy and DATEPART(mm,leaveDate) = :mm Order By LeaveDate DESC";
//				List<Leave> listLeave = session.createQuery(hql2)						
//											   .setParameter("yyyy", timesplit[0])
//											   .setParameter("mm", timesplit[1])
//											   .getResultList();
				map.put("punch", listPunch);
//				map.put("leave", listLeave);
				return map;
			}else{											//指定員工
				System.out.println("指定員工-指定時間");
				String hql1 = "FROM Punch WHERE memberNumber = :memberNumber and punchEarly = :punchEarly and DATEPART(yyyy,punchDate) = :yyyy and DATEPART(mm,punchDate) = :mm Order By punchDate DESC";
				List<Punch> listPunch = session.createQuery(hql1)
											   .setParameter("memberNumber", memberNumber)
											   .setParameter("yyyy", timesplit[0])
											   .setParameter("mm", timesplit[1])
											   .setParameter("punchEarly", punchEarly)
											   .getResultList();
//				String hql2 = "FROM Leave WHERE memberNumber = :memberNumber and DATEPART(yyyy,leaveDate) = :yyyy and DATEPART(mm,leaveDate) = :mm Order By LeaveDate DESC";
//				List<Leave> listLeave = session.createQuery(hql2)						
//											   .setParameter("memberNumber", memberNumber)
//											   .setParameter("yyyy", timesplit[0])
//											   .setParameter("mm", timesplit[1])
//											   .getResultList();
				map.put("punch", listPunch);
//				map.put("leave", listLeave);
				return map;
				}
		}
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public Map<String, List<?>> queryAttendanceDataByLeave(String memberNumber, String selectdate, String leave) {
		Session session = factory.getCurrentSession();
		String timesplit[] = selectdate.split("-");
		System.out.println(memberNumber);
		System.out.println(selectdate);
		Map<String, List<?>> map = new HashedMap();
		
		if (timesplit.length == 1) {                     //所有時間
			if(memberNumber.equals("all")) {				//所有員工
				System.out.println("所有員工-所有時間");
				String hql1 = "FROM Punch Order By punchDate DESC";
				List<Punch> listPunch = session.createQuery(hql1)
						.getResultList();
				String hql2 = "FROM Leave Order By LeaveDate DESC";
				List<Leave> listLeave = session.createQuery(hql2)
						.getResultList();
				map.put("punch", listPunch);
				map.put("leave", listLeave);
				return map;
			}else {
				System.out.println("指定員工-所有時間");		//指定員工
				String hql1 = "FROM Punch WHERE memberNumber = :memberNumber Order By punchDate DESC";
				List<Punch> listPunch = session.createQuery(hql1)
											   .setParameter("memberNumber", memberNumber)
											   .getResultList();
				String hql2 = "FROM Leave WHERE memberNumber = :memberNumber Order By LeaveDate DESC";
				List<Leave> listLeave = session.createQuery(hql2)
											   .setParameter("memberNumber", memberNumber)
											   .getResultList();
				map.put("punch", listPunch);
				map.put("leave", listLeave);
				return map;
			}
		}else {											 //指定時間
			if(memberNumber.equals("all")){					//所有員工
				System.out.println("所有員工-指定時間");
				String hql1 = "FROM Punch WHERE DATEPART(yyyy,punchDate) = :yyyy and DATEPART(mm,punchDate) = :mm Order By punchDate DESC";
				List<Punch> listPunch = session.createQuery(hql1)
											   .setParameter("yyyy", timesplit[0])
											   .setParameter("mm", timesplit[1])
											   .getResultList();
				String hql2 = "FROM Leave WHERE DATEPART(yyyy,leaveDate) = :yyyy and DATEPART(mm,leaveDate) = :mm Order By LeaveDate DESC";
				List<Leave> listLeave = session.createQuery(hql2)						
											   .setParameter("yyyy", timesplit[0])
											   .setParameter("mm", timesplit[1])
											   .getResultList();
				map.put("punch", listPunch);
				map.put("leave", listLeave);
				return map;
			}else{											//指定員工
				System.out.println("指定員工-指定時間");
				String hql1 = "FROM Punch WHERE memberNumber = :memberNumber and DATEPART(yyyy,punchDate) = :yyyy and DATEPART(mm,punchDate) = :mm Order By punchDate DESC";
				List<Punch> listPunch = session.createQuery(hql1)
											   .setParameter("memberNumber", memberNumber)
											   .setParameter("yyyy", timesplit[0])
											   .setParameter("mm", timesplit[1])
											   .getResultList();
				String hql2 = "FROM Leave WHERE memberNumber = :memberNumber and DATEPART(yyyy,leaveDate) = :yyyy and DATEPART(mm,leaveDate) = :mm Order By LeaveDate DESC";
				List<Leave> listLeave = session.createQuery(hql2)						
											   .setParameter("memberNumber", memberNumber)
											   .setParameter("yyyy", timesplit[0])
											   .setParameter("mm", timesplit[1])
											   .getResultList();
				map.put("punch", listPunch);
				map.put("leave", listLeave);
				return map;
				}
		}
	}
	
	
}
