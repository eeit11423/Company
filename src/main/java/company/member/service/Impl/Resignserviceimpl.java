package company.member.service.Impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import company.member.dao.ResignDao;
import company.member.model.MemberBean;
import company.member.model.ResignBean;
import company.member.service.ResignSerivce;

@Service
public class Resignserviceimpl implements ResignSerivce {

	@Autowired
	ResignDao resigndao;
	@Autowired
	SessionFactory factory;
	
	
	@Transactional
	@Override
	public ResignBean saveId(List<MemberBean> mb) {
		
		return resigndao.saveId(mb);
	}
	@Transactional
	@Override
	public List<ResignBean> getAllResignMember() {
		
		return resigndao.getAllResignMember();
	}
	@Transactional
	@Override
	public ResignBean getProduct1ById(int memberId) {
		
		return resigndao.getProduct1ById(memberId);
	}
	@Transactional
	@Override
	public List<ResignBean> getOneMemberID(Integer id) {
		
		return resigndao.getOneMemberID(id);
	}
	@Transactional
	@Override
	public void deleted(Integer id) {
		// TODO Auto-generated method stub
		resigndao.deleted(id);
	}

}
