package company.activity.service;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Repository;

import company.activity.model.Activity;

@Repository
public interface ActivityService {
	void save(Activity activity);
	void delete(Integer id);
	Activity get(Integer id);
	void update(Activity activity);
	List<Activity> getAllActivities();
	
	//新增依種類顯示
	public List<String> getAllActCategories();
	public List<Activity> getActivitiesByActCategory(String actCategory);
	
	//新增依日期篩選
	public List<Activity> getActivitiesByDate(Date begin, Date end);
	
	//新增依memberId篩選
	public List<Activity> getActivitiesByMemberId(Integer memberId);
}
