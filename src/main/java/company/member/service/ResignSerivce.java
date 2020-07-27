package company.member.service;


import java.util.List;

import company.member.model.MemberBean;
import company.member.model.ResignBean;



public interface ResignSerivce {

	
	public List<ResignBean> getAllResignMember() ;
	
	public ResignBean saveId(List<MemberBean> mb);
	
	public ResignBean getProduct1ById(int memberId);
	
	public List<ResignBean> getOneMemberID(Integer id);

	public void deleted(Integer id);
}
