package company.activity.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import company.activity.model.Join;
import company.activity.repository.JoinRepository;
import company.activity.service.JoinService;



@Service
@Transactional
public class JoinServiceimpl implements JoinService {

	@Autowired
	JoinRepository joinDao;

	
	@Override
	public void save(Join join) {
		joinDao.save(join);

	}

	@Override
	public void delete(Integer id) {
		joinDao.delete(id);

	}

	@Override
	public Join get(Integer id) {
		return joinDao.get(id);
	}

	@Override
	public void update(Join join) {
		joinDao.update(join);

	}
	
	@Transactional
	@Override
	public Long getJoinCountsByActivityId(Integer activityId) {
		return joinDao.getJoinCountsByActivityId(activityId);
	}

	@Transactional
	@Override
	public List<Join> getJoinsByActivityId(Integer activityId) {
		return joinDao.getJoinsByActivityId(activityId);
	}

	@Transactional
	@Override
	public List<Join> getJoinsByActivityIdAndJoinMemberId(Integer activityId, Integer joinMemberId) {
		return joinDao.getJoinsByActivityIdAndJoinMemberId(activityId, joinMemberId);
	}
	
	@Transactional
	@Override
	public List<Join> getJoinsByJoinMemberId(Integer joinMemberId) {
		return joinDao.getJoinsByJoinMemberId(joinMemberId);
	}


}
