package company.member.service;


import java.util.List;

import company.member.model.MemberBean;
import company.member.model.ResignBean;



public interface MemberSerivce {

	public List<MemberBean> getAllMember();
	
	public List<String> getAllMembers();

	public List<MemberBean> getMember(String depart);
	
	void saveMember(MemberBean mb);
	
	public MemberBean getProductById(int memberId);
	
	public void deleted(Integer id);
	
	public void updateMember(MemberBean bean);
	
	public MemberBean login(String account, String passwd);
	
	public List<String> seachMemberaccount();
	
	public void updatePasswd(String email);
	
	public List<MemberBean> getOneMember(String account);
	
	public boolean idExists(String id);
	
	public  boolean CheckPassword(String oldpwd, String newpwd, Integer id);

	public List<MemberBean> getOneMemberID(Integer id);
	
	
	public MemberBean saveId(List<ResignBean> rb);
	
}
