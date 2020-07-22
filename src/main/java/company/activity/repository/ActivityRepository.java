package company.activity.repository;

import java.util.Date;
import java.util.List;

import company.activity.model.Activity;



public interface ActivityRepository {
	void save(Activity activity);
	void delete(Integer id);
	Activity get(Integer id);
	void update(Activity activity);
	List<Activity> getAll();
	
	//新增依種類顯示
	
	List<String> getAllActCategories();
	List<Activity> getActivitiesByActCategory(String actCategory);
	
	//新增依日期篩選
	
	List<Activity> getActivitiesByDate(Date begin, Date end);
	
	//新增依memberId篩選
	
	List<Activity> getActivitiesByMemberId(Integer memberId);
	
}
