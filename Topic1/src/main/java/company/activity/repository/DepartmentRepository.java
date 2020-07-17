package company.activity.repository;

import java.util.List;

import company.activity.model.Department;



public interface DepartmentRepository {
	List<Department> getAllDepartments();
	Department getDepartment(Integer id);
}
