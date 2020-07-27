package company.member.dao;

import java.util.List;

import company.member.model.MemberBean;
import company.member.model.ResignBean;

public interface ResignDao {

	public ResignBean saveId(List<MemberBean> mb);

	public ResignBean getProduct1ById(int memberId);

	public List<ResignBean> getAllResignMember();
	
	public List<ResignBean> getOneMemberID(Integer id);
	
	public void deleted(Integer id);
}
