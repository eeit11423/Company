package company.attendance.service;

import java.util.List;

import company.attendance.model.Leave;
import company.member.model.MemberBean;

public interface LeaveService {
	
	List<Leave> getLeave();
	
	List<Leave> queryLeave(String memberNumber, String selectdate) ;

	List<MemberBean> getAllMember();

	Leave editLeaveFromLeaveId(int leaveId);

	void updateLeave(Leave leave);

	void deleteLeaveByLeaveId(int key);

	int saveLeave(Leave leave);

}
