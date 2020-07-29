package company.attendance.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import company.attendance.dao.LeaveDao;
import company.attendance.model.Leave;
import company.member.model.MemberBean;
import sun.nio.cs.ext.ISCII91;
import company.attendance.service.LeaveService;

@Transactional
@Service
//@EnableTransactionManagement
public class LeaveServiceImpl implements LeaveService {
    
	@Autowired
    LeaveDao dao;
	
	@Override
	public List<Leave> getLeave(String memberNamer) {
		return dao.getLeave(memberNamer);
	}

	@Override
	public List<Leave> queryLeave(String memberNumber, String selectdate) {
		return dao.queryLeave(memberNumber, selectdate);
	}
	
	@Override
	public List<MemberBean> getAllMember(){
		return dao.getAllMember();
	}
    
	@Override
	public int saveLeave(Leave leave) {
		
		//判斷請假的日期是否有打卡紀錄，有的話進行修改
		if (dao.getMemberAndPunchDateList(leave.getLeaveId()).size() != 0) {
			int punchId = dao.getMemberAndPunchDateList(leave.getLeaveId()).get(0).getPunchId();
			dao.updatePunchtime(leave.getLeaveId(), punchId);
		}
		
		int n = dao.saveLeave(leave);
		return n;
	}
	
	@Override
	public int memberSaveLeave(Leave leave) {
		int n = dao.saveLeave(leave);
		return n;
	}
	
	public void checkAudit(Integer leaveId){
		if (dao.getMemberAndPunchDateList(leaveId) != null) {
			System.out.println("AAAAAVVVVVVDDDDDDDWWWWWWWWWWWWWWW");
			int punchId = dao.getMemberAndPunchDateList(leaveId).get(0).getPunchId();
			dao.updatePunchtime(leaveId, punchId);
		}
		dao.checkAudit(leaveId);
	}
	
	@Override
	public Leave editLeaveFromLeaveId(int leaveId) {
		return dao.editLeaveFromLeaveId(leaveId);
	}
	
	@Override
	public void updateLeave(Leave leave) {
		if (dao.getMemberAndPunchDateList(leave.getLeaveId()) != null) {
			int punchId = dao.getMemberAndPunchDateList(leave.getLeaveId()).get(0).getPunchId();
			dao.updatePunchtime(leave.getLeaveId(), punchId);
		}
		dao.updateLeave(leave);
	}

	@Override
	public void deleteLeaveByLeaveId(int key) {
		dao.deleteLeaveByLeaveId(key);
	}

	@Override
	public List<Leave> queryAttendanceData(String memberNumber, String selectdate, String category) {
		return dao.queryAttendanceData(memberNumber, selectdate, category);
	}
		
	@Override
	public List<Leave> queryAttendanceDataByAudit(String checkaudit) {
		return dao.queryAttendanceDataByAudit(checkaudit);
	}
	
}
