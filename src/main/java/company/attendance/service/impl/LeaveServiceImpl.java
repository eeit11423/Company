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
		if (dao.getMemberAndPunchDateList(leave).size() != 0) {
			int punchId = dao.getMemberAndPunchDateList(leave).get(0).getPunchId();
			dao.updatePunchtime(leave, punchId);
		}
		int n = dao.saveLeave(leave);
		return n;
		
	}
	
	@Override
	public Leave editLeaveFromLeaveId(int leaveId) {
		return dao.editLeaveFromLeaveId(leaveId);
	}
	
	@Override
	public void updateLeave(Leave leave) {
		if (dao.getMemberAndPunchDateList(leave) != null) {
			System.out.println("AAAAAVVVVVVDDDDDDDWWWWWWWWWWWWWWW");
			int punchId = dao.getMemberAndPunchDateList(leave).get(0).getPunchId();
			dao.updatePunchtime(leave, punchId);
		}
		dao.updateLeave(leave);
	}

	@Override
	public void deleteLeaveByLeaveId(int key) {
		dao.deleteLeaveByLeaveId(key);
	}
		
}
