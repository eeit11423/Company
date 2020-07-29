package company.attendance.dao.impl;

import java.sql.Timestamp;
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
import org.springframework.ui.Model;

import company.attendance.dao.LeaveDao;
import company.attendance.model.Leave;
import company.attendance.model.Punch;
import company.member.model.MemberBean;

@Repository
public class LeaveDaoImpl implements LeaveDao {
	
	@Autowired
	SessionFactory factory;

	@SuppressWarnings("unchecked")
	@Override
	public List<Leave> getLeave(String memberNamer) {
		String hql = "FROM Leave WHERE memberName = :name";
		Session session = factory.getCurrentSession();
		List<Leave> list = new ArrayList<>();
		list = session.createQuery(hql)
					  .setParameter("name", memberNamer)
					  .getResultList();
    return list;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<MemberBean> getAllMember() {
		String hql = "FROM MemberBean";
		System.out.println(factory);
		System.out.println(Thread.currentThread().getName());
		Session session = factory.getCurrentSession();
		System.out.println("-----------------------2");
		List<MemberBean> list = new ArrayList<>();
		list = session.createQuery(hql).getResultList();
		System.out.println(list);
		return list;
	}

	@SuppressWarnings("deprecation")
	@Override
	public int saveLeave(Leave leave) {
		int n = 0;
		boolean exist = isMemberAndLeaveDateExist(leave);
		if (exist) {
			return -1;
		}
		Session session = factory.getCurrentSession();
		try {
			Timestamp leaveStart = leave.getLeaveStart();
			Timestamp leaveEnd = leave.getLeaveEnd();
			long leaveHours = leaveEnd.getTime() - leaveStart.getTime();

			if (leaveStart.getHours() < 12 && leaveEnd.getHours() > 12 ) {
				leaveHours -= 3600000;					
			}
			//請假 9點以後
			
			leave.setLeaveHours(leaveHours);
			leave.setLeaveAudit("審核中");
			session.save(leave);
			n = 1;
		} catch (Exception e) {
			n = -2;
		}
		return n;
	}
	@SuppressWarnings("deprecation")
	@Override
	public int memberSaveLeave(Leave leave) {
		int n = 0;
		boolean exist = isMemberAndLeaveDateExist(leave);
		if (exist) {
			return -1;
		}
		Session session = factory.getCurrentSession();
		try {
			Timestamp leaveStart = leave.getLeaveStart();
			Timestamp leaveEnd = leave.getLeaveEnd();
			long leaveHours = leaveEnd.getTime() - leaveStart.getTime();
			
			if (leaveStart.getHours() < 12 && leaveEnd.getHours() > 12 ) {
				leaveHours -= 3600000;					
			}
			//請假 9點以後
			
			leave.setLeaveHours(leaveHours);
			leave.setLeaveAudit("通過");
			session.save(leave);
			n = 1;
		} catch (Exception e) {
			n = -2;
		}
		return n;
	}

	@Override
	public boolean isMemberAndLeaveDateExist(Leave leave) {
		boolean exist = false;
		Session session = factory.getCurrentSession();
		String hql = "FROM Leave WHERE leaveDate=:leaveDate and memberName=:memberName";
		try {
			Object list = session.createQuery(hql)
								 .setParameter("leaveDate", leave.getLeaveDate())
								 .setParameter("memberName", leave.getMemberName())
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
	//AJAX判斷搜尋條件
	public List<Leave> queryLeave(String memberNumber, String selectdate) {
		Session session = factory.getCurrentSession();
		String timesplit[] = selectdate.split("-");
		if (timesplit.length == 1) {                     //所有時間
			if(memberNumber.equals("all")) {				//所有員工
				String hql = "FROM Leave Order By leaveDate DESC";
				List<Leave> listTarget = session.createQuery(hql).getResultList();
				return listTarget;
			}else {											//指定員工
				String hql = "FROM Leave WHERE memberNumber = :number Order By leaveDate DESC";
				List<Leave> listTarget = session.createQuery(hql).setParameter("number", memberNumber)
						.getResultList();
				return listTarget;
			}
		}else {											 //指定時間
			if(memberNumber.equals("all")){					//所有員工
				String hql = "FROM Leave WHERE DATEPART(yyyy,leaveDate) = :yyyy "
						+ "and DATEPART(mm,leaveDate) = :mm Order By leaveDate DESC";
				List<Leave> listTarget = session.createQuery(hql).setParameter("yyyy", timesplit[0])
						.setParameter("mm", timesplit[1]).getResultList();
				return listTarget;
			}else{											//指定員工
				String hql = "FROM Leave WHERE memberNumber = :number and DATEPART(yyyy,leaveDate) = :yyyy "
						+ "and DATEPART(mm,leaveDate) = :mm Order By leaveDate DESC";
				List<Leave> listTarget = session.createQuery(hql).setParameter("number", memberNumber)
						.setParameter("yyyy", timesplit[0]).setParameter("mm", timesplit[1]).getResultList();
				return listTarget;
				}
		}
	}

	@Override
	public Leave editLeaveFromLeaveId(int leaveId) {
		Session session = factory.getCurrentSession();
		Leave leave = session.get(Leave.class, leaveId);
		return leave;
	}

	@Override
	public void updateLeave(Leave leave) {
		Session session = factory.getCurrentSession();
		session.update(leave);
		System.out.println("更新成功");
	}

	@Override
	public void deleteLeaveByLeaveId(int key) {
		Session session = factory.getCurrentSession();
		Leave leave = new Leave();
		leave.setLeaveId(key);
		session.delete(leave);
	}
	
	@SuppressWarnings({ "unchecked", "deprecation" })
	@Override
	public List<Punch> getMemberAndPunchDateList(Integer leaveId) {
		Session session = factory.getCurrentSession();
		System.out.println(leaveId);
		Leave leave = session.get(Leave.class, leaveId);
		int leaveDateMomth = leave.getLeaveDate().getMonth()+1;
		int leaveDateDay =  leave.getLeaveDate().getDate();
		String hql = "FROM Punch WHERE memberName=:memberName and DATEPART(mm,punchDate) = :month and DATEPART(dd,punchDate) = :day";
		List<Punch> list = (List<Punch>) session.createQuery(hql)
												.setParameter("memberName", leave.getMemberName())
												.setParameter("month", leaveDateMomth)
												.setParameter("day", leaveDateDay)	
												.getResultList();
		System.out.println(leave.getLeaveDate());
		System.out.println(list.size());
//		System.out.println(list.get(0));
//		System.out.println(list.get(0).getPunchId());
		return list;
	}
	
	@SuppressWarnings("deprecation")
	@Override
	public void updatePunchtime(Integer leaveId, int punchId){
		Session session = factory.getCurrentSession();
		Leave leave = session.get(Leave.class, leaveId);
		Timestamp leaveStart = leave.getLeaveStart();
		Timestamp leaveEnd = leave.getLeaveEnd();
		System.out.println(leave);
		System.out.println(leave.getLeaveStart());
		System.out.println(leave.getLeaveId());
		System.out.println(punchId);
		System.out.println(leaveStart);
		System.out.println(leaveEnd);
		Punch punch = session.get(Punch.class, punchId);
		
		//請假 9點開始
		if (leaveStart.getHours() == 9 && (leaveStart.getMinutes()+leaveStart.getSeconds()) == 0 ) {
			//請假 18點結束
			if (leaveEnd.getHours() == 18 ) {
				String hql = "UPDATE Punch SET punchWorkOn = null, punchEarly = null "
						+ " , punchWorkOff = null, punchLate = null WHERE punchId = :punchId";
				session.createQuery(hql)
					   .setParameter("punchId", punchId)
					   .executeUpdate();
			//請假 18點以前結束
			}else {
				String hql = "UPDATE Punch SET  punchWorkOn = :Start, punchLate = null "
						+ " WHERE punchId = :punchId";
				session.createQuery(hql)
				.setParameter("punchId", punchId)
				.setParameter("Start", leave.getLeaveEnd())
				.executeUpdate();
			}
		//請假 9點以後
		}else {
			//請假 18點結束
			if (leaveEnd.getHours() == 18 ) {
				String hql = "UPDATE Punch SET punchWorkOff = :end, punchEarly = null WHERE punchId = :punchId";
				session.createQuery(hql)
				.setParameter("punchId", punchId)
				.setParameter("end", leave.getLeaveStart())
				.executeUpdate();
			//請假 18點以前結束
			}else {
				System.out.println("打卡紀錄無變化");
			}
		}
		System.out.println("打卡紀錄更改完成");
	}
	
	@Override
	public void checkAudit(Integer leaveId) {
		Session session = factory.getCurrentSession();
		String hql = "UPDATE Leave SET leaveAudit = '通過' WHERE leaveId = :leaveId";
		session.createQuery(hql)
			   .setParameter("leaveId", leaveId)
			   .executeUpdate();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Leave> queryAttendanceData(String memberNumber, String selectdate, String category) {
		Session session = factory.getCurrentSession();
		String timesplit[] = selectdate.split("-");
		System.out.println(memberNumber);
		System.out.println(selectdate);
		System.out.println(category);
		
		if (timesplit.length == 1) {                     //所有時間
			if(memberNumber.equals("all")) {				//所有員工
				if(category.equals("all")) {				    //所有分類
					System.out.println("所有時間-所有員工-所有分類");
					String hql = "FROM Leave Order By LeaveDate DESC";
					List<Leave> listLeave = session.createQuery(hql)
												   .getResultList();
					System.out.println("1資料庫的到的list:"+listLeave);
					return listLeave;
				}else {
					System.out.println("所有時間-所有員工-指定分類");   //指定分類
					String hql = "FROM Leave WHERE leaveCategory =: leaveCategory Order By LeaveDate DESC";
					List<Leave> listLeave = session.createQuery(hql)
												   .setParameter("leaveCategory", category)
												   .getResultList();
					System.out.println("資料庫的到的list:"+listLeave);
					return listLeave;
				}
			}else {											//指定員工
				if(category.equals("all")) {				    //所有分類
					System.out.println("所有時間-指定員工-所有分類");
					String hql = "FROM Leave WHERE memberNumber =: memberNumber Order By LeaveDate DESC";
					List<Leave> listLeave = session.createQuery(hql)
												   .setParameter("memberNumber", memberNumber)
												   .getResultList();
					System.out.println("資料庫的到的list:"+listLeave);
					return listLeave;
				}else {
					System.out.println("所有時間-指定員工-指定分類");  //指定分類
					String hql = "FROM Leave WHERE memberNumber =: memberNumber and leaveCategory =: leaveCategory Order By LeaveDate DESC";
					List<Leave> listLeave = session.createQuery(hql)
												   .setParameter("leaveCategory", category)
												   .setParameter("memberNumber", memberNumber)
												   .getResultList();
					System.out.println("資料庫的到的list:"+listLeave);
					return listLeave;
				}
			}
		}else {											 //指定時間
			if(memberNumber.equals("all")) {				//所有員工
				if(category.equals("all")) {				    //所有分類
					System.out.println("指定時間-所有員工-所有分類");
					String hql = "FROM Leave WHERE DATEPART(yyyy,leaveDate) = :yyyy and DATEPART(mm,leaveDate) = :mm Order By LeaveDate DESC";
					List<Leave> listLeave = session.createQuery(hql)
												   .setParameter("yyyy", timesplit[0])
												   .setParameter("mm", timesplit[1])
												   .getResultList();
					System.out.println("資料庫的到的list:"+listLeave);
					return listLeave;
				}else {
					System.out.println("指定時間-所有員工-指定分類");   //指定分類
					String hql = "FROM Leave WHERE leaveCategory =: leaveCategory and DATEPART(yyyy,leaveDate) = :yyyy and DATEPART(mm,leaveDate) = :mm Order By LeaveDate DESC";
					List<Leave> listLeave = session.createQuery(hql)
												   .setParameter("leaveCategory", category)
												   .setParameter("yyyy", timesplit[0])
												   .setParameter("mm", timesplit[1])
												   .getResultList();
					System.out.println("資料庫的到的list:"+listLeave);
					return listLeave;
				}
			}else {											//指定員工
				if(category.equals("all")) {				    //所有分類
					System.out.println("指定時間-指定員工-所有分類");
					String hql = "FROM Leave WHERE memberNumber =: memberNumber and DATEPART(yyyy,leaveDate) = :yyyy and DATEPART(mm,leaveDate) = :mm Order By LeaveDate DESC";
					List<Leave> listLeave = session.createQuery(hql)
												   .setParameter("memberNumber", memberNumber)
												   .setParameter("yyyy", timesplit[0])
												   .setParameter("mm", timesplit[1])
												   .getResultList();
					System.out.println("資料庫的到的list:"+listLeave);
					return listLeave;
				}else {
					System.out.println("指定時間-指定員工-指定分類");  //指定分類
					String hql = "FROM Leave WHERE memberNumber =: memberNumber and leaveCategory =: leaveCategory and DATEPART(yyyy,leaveDate) = :yyyy and DATEPART(mm,leaveDate) = :mm Order By LeaveDate DESC";
					List<Leave> listLeave = session.createQuery(hql)
												   .setParameter("leaveCategory", category)
												   .setParameter("memberNumber", memberNumber)
												   .setParameter("yyyy", timesplit[0])
												   .setParameter("mm", timesplit[1])
												   .getResultList();
					System.out.println("資料庫的到的list:"+listLeave);
					return listLeave;
				}
			}
		}
		
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Leave> queryAttendanceDataByAudit(String checkaudit) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Leave WHERE leaveAudit = '審核中' Order by leaveDate DESC";
			List<Leave> listLeave = session.createQuery(hql)
					   					   .getResultList();
//				System.out.println("資料庫的到的list:"+listLeave);
			return listLeave;
	}

}
