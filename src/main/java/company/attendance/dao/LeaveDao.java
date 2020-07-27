package company.attendance.dao;

import java.util.List;

import company.attendance.model.Leave;
import company.attendance.model.Punch;
import company.member.model.MemberBean;

public interface LeaveDao {

	List<Leave> getLeave(String memberNamer);

	int saveLeave(Leave leave);
	
	int memberSaveLeave(Leave leave);
	
	boolean isMemberAndLeaveDateExist(Leave leave);
	
	List<Leave> queryLeave(String memberNumber, String selectdate);

	List<MemberBean> getAllMember();

	Leave editLeaveFromLeaveId(int leaveId);

	void updateLeave(Leave leave);

	void deleteLeaveByLeaveId(int key);

	void updatePunchtime(Leave leave, int punchId);

	List<Punch> getMemberAndPunchDateList(Leave leave);

	void checkAudit(int leaveId);
}
