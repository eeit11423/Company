package company.activity.model;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Join_CRUD")
public class Join {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)	
	Integer id;
	Integer activityId;
	String activityName;
	Integer joinMemberId;
	Timestamp joinTime;
	
	public Join() {
		super();
	
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getActivityId() {
		return activityId;
	}

	public void setActivityId(Integer activityId) {
		this.activityId = activityId;
	}

	public Integer getJoinMemberId() {
		return joinMemberId;
	}

	public void setJoinMemberId(Integer joinMemberName) {
		this.joinMemberId = joinMemberName;
	}

	public Timestamp getJoinTime() {
		return joinTime;
	}

	public void setJoinTime(Timestamp joinTime) {
		this.joinTime = joinTime;
	}

	public String getActivityName() {
		return activityName;
	}

	public void setActivityName(String activityName) {
		this.activityName = activityName;
	}

	@Override
	public String toString() {
		return "Join [id=" + id + ", activityId=" + activityId + ", activityName=" + activityName + ", joinMemberId="
				+ joinMemberId + ", joinTime=" + joinTime + "]";
	}

	
}

