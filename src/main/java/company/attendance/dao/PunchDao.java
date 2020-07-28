package company.attendance.dao;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import company.member.model.MemberBean;
import company.attendance.model.Punch;

public interface PunchDao {

	List<Punch> getPunchTime();
	
	List<Punch> getPunchTime(String memberName);

	void punchWorkOn(Integer memberId);

	Timestamp getWorkOnTime(Integer memberId);

	void punchWorkOff(MemberBean memberBean, Timestamp punchWorkOn);
	
	int savePunchTime(Punch punch);
	
	boolean isMemberAndPunchDateExist(Punch punch);
	
	List<Punch> queryPunchTime(String memberNumber, String selectdate);
				
	List<Punch> queryPunchTimeByPunchLate(String memberNumber, String selectdate, String punchLate) ;
	
	List<Punch> queryPunchTimeByPunchEarly(String memberNumber, String selectdate, String punchEarly) ;

	List<MemberBean> getAllMember();

	Punch editPunchtimeFromPunchId(int punchId);

	void updatePunchTime(Punch punch);

	void deletePunchTimeByPunchId(int key);

	Map<String, List<?>> queryAttendanceData(String memberNumber, String selectdate);

	Map<String, List<?>> queryAttendanceDataByPunchLate(String memberNumber, String selectdate, String punchLate) ;
	
	Map<String, List<?>> queryAttendanceDataByPunchEarly(String memberNumber, String selectdate, String punchEarly) ;
	
	Map<String, List<?>> queryAttendanceDataByLeave(String memberNumber, String selectdate, String leave) ;
}
