package company.attendance.service.impl;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import company.attendance.dao.PunchDao;
import company.member.model.MemberBean;
import company.attendance.model.Punch;
import company.attendance.service.PunchService;

@Transactional
@Service
//@EnableTransactionManagement
public class PunchServiceImpl implements PunchService {
    
	@Autowired
    PunchDao dao;

	@Override
	public List<Punch> getPunchTime() {
		return dao.getPunchTime();
	}
	
	@Override
	public List<Punch> getPunchTime(String memberName) {
		return dao.getPunchTime(memberName);
	}
 
	@Override
	public void punchWorkOn(Integer memberId) {
    	dao.punchWorkOn(memberId);
	}

	@Override
	public void punchWorkOff(MemberBean memberBean, Timestamp punchWorkOn) {
    	dao.punchWorkOff(memberBean, punchWorkOn);
    }

	@Override
	public Timestamp getWorkOnTime(Integer memberId) {
    	return dao.getWorkOnTime(memberId);
    }

	@Override
	public List<Punch> queryPunchTime(String memberNumber, String selectdate) {
		return dao.queryPunchTime(memberNumber, selectdate);
	}
	
	@Override
	public List<MemberBean> getAllMember(){
		return dao.getAllMember();
	}
    
	@Override
	public int savePunchTime(Punch punch) {
		int n = dao.savePunchTime(punch);
		return n;
		
	}
	
	@Override
	public Punch editPunchtimeFromPunchId(int punchId) {
		return dao.editPunchtimeFromPunchId(punchId);
	}
	
	@Override
	public void updatePunchTime(Punch punch) {
		dao.updatePunchTime(punch);
	}

	@Override
	public void deletePunchTimeByPunchId(int key) {
		dao.deletePunchTimeByPunchId(key);
	}
}
