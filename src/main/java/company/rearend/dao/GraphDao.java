package company.rearend.dao;

import java.util.List;



import company.member.model.MemberBean;


public interface GraphDao {
	List<MemberBean> getAllSalary();
	List<MemberBean>  getMemberBySalary(String Salary);
	List<MemberBean>  getMemberBypeople(String people);
	
}
