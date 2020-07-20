package company.attendance.dao;

import java.sql.Timestamp;
import java.util.List;

import company.member.model.MemberBean;
import company.attendance.model.Punch;

public interface PunchDao {

	List<Punch> getPunchTime();
	
	void punchWorkOn();

	Timestamp getWorkOnTime();

	void punchWorkOff(Timestamp punchWorkOn);
	
	int savePunchTime(Punch punch);
	
	boolean isMemberAndPunchDateExist(Punch punch);
	
	List<Punch> queryPunchTime(int memberNumber, String selectdate);

	List<MemberBean> getAllMember();

	Punch editPunchtimeFromPunchId(int punchId);

	void updatePunchTime(Punch punch);

	void deletePunchTimeByPunchId(int key);


}
