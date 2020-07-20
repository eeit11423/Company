package company.attendance.service;

import java.sql.Timestamp;
import java.util.List;

import company.member.model.MemberBean;
import company.attendance.model.Punch;

public interface PunchService {

	List<Punch> getPunchTime();
	
	void punchWorkOn();
	
	void punchWorkOff(Timestamp punchWorkOn);

	Timestamp getWorkOnTime();
	
	List<Punch> queryPunchTime(int memberNumber, String selectdate) ;

	List<MemberBean> getAllMember();


	Punch editPunchtimeFromPunchId(int punchId);

	void updatePunchTime(Punch punch);

	void deletePunchTimeByPunchId(int key);

	int savePunchTime(Punch punch);

	
}
