package company.activity.service;

import java.util.List;

import company.activity.model.Department;

public interface DepartmentService {
	List<Department> getAllDepartments();
	Department getDepartment(Integer id);
}
