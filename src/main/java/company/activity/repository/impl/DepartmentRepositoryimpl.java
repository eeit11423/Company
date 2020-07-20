package company.activity.repository.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import company.activity.model.Department;
import company.activity.repository.DepartmentRepository;

@Repository
public class DepartmentRepositoryimpl implements DepartmentRepository {
	
	@Autowired
	SessionFactory factory;

	@SuppressWarnings("unchecked")
	@Override
	public List<Department> getAllDepartments() {
		String hql = "FROM Department";
		Session session = getSession();
		return session.createQuery(hql).getResultList();
	}
	
	public Session getSession() {
		return factory.getCurrentSession();
	}

	@Override
	public Department getDepartment(Integer id) {
		Session session = getSession();
		return session.get(Department.class, id);
	}

}
