package company.activity.service;

import java.util.List;

import org.springframework.stereotype.Repository;

import company.activity.model.Join;

@Repository
public interface JoinService {
	void save(Join join);
	void delete(Integer id);
	Join get(Integer id);
	void update(Join join);
	
	//新增計算參加入數方法
	Long getJoinCountsByActivityId(Integer activityId);
	List<Join> getJoinsByActivityId(Integer activityId);
	
	//新增報名驗證方法
	List<Join> getJoinsByActivityIdAndJoinMemberId(Integer activityId, Integer joinMemberId);
	
	//新增查詢個人參加資訊方法
	List<Join> getJoinsByJoinMemberId(Integer joinMemberId);
}
