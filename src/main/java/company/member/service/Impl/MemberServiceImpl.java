package company.member.service.Impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import company.member.dao.MemberDao;
import company.member.model.MemberBean;
import company.member.model.ResignBean;
import company.member.service.MemberSerivce;



@Service
public class MemberServiceImpl implements MemberSerivce {

	@Autowired
	MemberDao memberdao;
	@Autowired
	SessionFactory factory;
	
	@Transactional
	@Override
	public List<MemberBean> getAllMember() {
		return memberdao.getAllMember();
	}
	
	@Transactional
	@Override
	public void saveMember(MemberBean mb) {
		int count = 0;
		memberdao.saveMember(mb);
		count ++;
		
	}
	@Transactional
	public MemberBean getProductById(int memberId) {
		return memberdao.getProductById(memberId);
	}
	@Transactional
	@Override
	public void deleted(Integer id) {
		memberdao.deleted(id);
		
	}
	
	@Transactional
	@Override
	public void updateMember(MemberBean bean) {
		System.out.println("THIS IS SERVICE");
		System.out.println(bean.getMemberId());
		memberdao.updateMember(bean);
	}

	@Transactional
	@Override
	public MemberBean login(String account, String passwd) {
		System.out.println("service");
		return memberdao.login(account, passwd);
	}
	
	@Transactional
	@Override
	public List<MemberBean> getMember(String depart) {
		return memberdao.getMember(depart);
	}
	@Transactional
	@Override
	public List<String> getAllMembers() {
		
		return memberdao.getAllMembers();
	}
	
	@Transactional
	@Override
	public List<String> seachMemberaccount() {
		return memberdao.seachMemberaccount();
	}
	@Transactional
	@Override
	public void updatePasswd(String email) {
		memberdao.updatePasswd(email);
		System.out.println("session 更新密碼");
		
	}
	
	@Transactional
	@Override
	public List<MemberBean> getOneMember(String account) {
		return memberdao.getOneMember(account);
	}

	@Transactional
	@Override
	public boolean idExists(String id) {
		return memberdao.idExists(id);
	}
	
	@Transactional
	@Override
	public boolean CheckPassword(String oldpwd, String newpwd , Integer id) {
		
		return memberdao.CheckPassword(oldpwd, newpwd,id);
	}
	@Transactional
	@Override
	public List<MemberBean> getOneMemberID(Integer id) {
		
		return memberdao.getOneMemberID(id);
	}
	@Transactional
	@Override
	public MemberBean saveId(List<ResignBean> rb) {
		// TODO Auto-generated method stub
		return memberdao.saveId(rb);
	}

	


}
