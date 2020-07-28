package company.attendance.service;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import company.member.model.MemberBean;
import company.attendance.model.Punch;

public interface PunchService {

	List<Punch> getPunchTime();
	
	List<Punch> getPunchTime(String memberName);
	
	void punchWorkOn(Integer memberId);
	
	void punchWorkOff(MemberBean memberBean, Timestamp punchWorkOn);

	Timestamp getWorkOnTime(Integer memberId);
	
	List<Punch> queryPunchTime(String memberNumber, String selectdate) ;
	
	List<Punch> queryPunchTimeByPunchLate(String memberNumber, String selectdate, String punchLate) ;
	
	List<Punch> queryPunchTimeByPunchEarly(String memberNumber, String selectdate, String punchEarly) ;

	List<MemberBean> getAllMember();

	Punch editPunchtimeFromPunchId(int punchId);

	void updatePunchTime(Punch punch);

	void deletePunchTimeByPunchId(int key);

	int savePunchTime(Punch punch);

	Map<String, List<?>> queryAttendanceData(String memberNumber, String selectdate) ;
	
	Map<String, List<?>> queryAttendanceDataByPunchLate(String memberNumber, String selectdate, String punchLate) ;
	
	Map<String, List<?>> queryAttendanceDataByPunchEarly(String memberNumber, String selectdate, String punchEarly) ;
	
	Map<String, List<?>> queryAttendanceDataByLeave(String memberNumber, String selectdate, String leave) ;
}
