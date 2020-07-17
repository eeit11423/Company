package company.rearend.service;

import java.util.List;

import company.member.model.MemberBean;

public interface GraphService {
	List<MemberBean> getAllSalary();
	List<MemberBean>  getMemberBySalary(String Salary);
	List<MemberBean>  getMemberBypeople(String people);
}
