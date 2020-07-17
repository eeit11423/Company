package company.member.service.Impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import company.member.dao.MemberDao;
import company.member.model.MemberBean;
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

}
