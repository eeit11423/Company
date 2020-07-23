package company.activity.service.impl;

import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import company.activity.model.Activity;
import company.activity.repository.ActivityRepository;
import company.activity.service.ActivityService;

@Service
@Transactional
public class ActivityServiceimpl implements ActivityService {
	
	@Autowired
	ActivityRepository activityDao;

	@Override
	public void save(Activity activity) {
		activityDao.save(activity);

	}

	@Override
	public void delete(Integer id) {
		activityDao.delete(id);

	}

	@Override
	public Activity get(Integer id) {
		return activityDao.get(id);
	}

	@Override
	public void update(Activity activity) {
		activityDao.update(activity);

	}

	@Override
	public List<Activity> getAllActivities() {
		return activityDao.getAll();
	}
    
	@Transactional
	@Override
	public List<String> getAllActCategories() {
		return activityDao.getAllActCategories();
	}

	@Transactional
	@Override
	public List<Activity> getActivitiesByActCategory(String actCategory) {
		return activityDao.getActivitiesByActCategory(actCategory);
	}

	@Transactional
	@Override
	public List<Activity> getActivitiesByDate(Date begin, Date end) {
		return activityDao.getActivitiesByDate(begin, end);
	}

	@Transactional
	@Override
	public List<Activity> getActivitiesByMemberId(Integer memberId) {
		return activityDao.getActivitiesByMemberId(memberId);
	}



}
