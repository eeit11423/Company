package company.member.dao;

import java.util.List;

import company.member.model.MemberBean;





public interface MemberDao {
	
	public List<MemberBean> getAllMember();
	
	public List<String> getAllMembers();
	
	public List<MemberBean> getMember(String depart);
	
	public void saveMember(MemberBean mb) ; 
	
	public MemberBean getProductById(int memberId);
	
	public void deleted(Integer id);
	
	public void updateMember(MemberBean bean);
	
	public MemberBean login(String account, String passwd);
}
