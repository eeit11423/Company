package company.attendance.dao;

import java.util.List;

import company.attendance.model.Leave;
import company.member.model.MemberBean;

public interface LeaveDao {

	List<Leave> getLeave();

	int saveLeave(Leave leave);
	
	boolean isMemberAndLeaveDateExist(Leave leave);
	
	List<Leave> queryLeave(int memberNumber, String selectdate);

	List<MemberBean> getAllMember();

	Leave editLeaveFromLeaveId(int leaveId);

	void updateLeave(Leave leave);

	void deleteLeaveByLeaveId(int key);
}
