package company.activity.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import company.activity.model.Department;
import company.activity.repository.DepartmentRepository;
import company.activity.service.DepartmentService;


@Service
@Transactional
public class DepartmentServiceimpl implements DepartmentService {
	
	@Autowired
	DepartmentRepository DepartmentDao;
	
	@Override
	public List<Department> getAllDepartments() {
		return DepartmentDao.getAllDepartments();
	}

	@Override
	public Department getDepartment(Integer id) {
		return DepartmentDao.getDepartment(id);
	}

}
