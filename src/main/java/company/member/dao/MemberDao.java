package company.member.dao;

import java.util.List;

import company.member.model.MemberBean;
import company.member.model.ResignBean;





public interface MemberDao {
	
	public List<MemberBean> getAllMember();
	
//	public List<ResignBean> getAllResignMember();
	
	public List<String> getAllMembers();
	
	public List<MemberBean> getMember(String depart);
	
	public void saveMember(MemberBean mb) ; 
	
	public MemberBean getProductById(int memberId);
	
	public void deleted(Integer id);
	
	public void updateMember(MemberBean bean);
	
	public MemberBean login(String account, String passwd);
	
	public List<String> seachMemberaccount();
	
	public void updatePasswd(String email);
	
	public List<MemberBean> getOneMember(String account);
	
	public List<MemberBean> getOneMemberID(Integer id);
	
	public boolean idExists(String id);
	
	public  boolean CheckPassword(String oldpwd, String newpwd, Integer id);
	
	public MemberBean saveId(List<ResignBean> rb);
	
//	public ResignBean saveId(List<MemberBean> mb);
//	
//	public ResignBean getProduct1ById(int memberId);
	
}
