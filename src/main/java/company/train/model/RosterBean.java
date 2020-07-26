package company.train.model;
import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="Roster")
public class RosterBean implements Serializable{
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer rosterId;	
	private String memberNumber;	
	private Integer trainingId;
	private Integer totalCredits;//學分
	private Integer starSum; //評分總分，拿來判斷是否取得學分
	
	
	public RosterBean() {
		super();
	}
	public RosterBean(Integer rosterId, String memberNumber, Integer trainingId, Integer totalCredits,
			Integer starSum) {
		super();
		this.rosterId = rosterId;
		this.memberNumber = memberNumber;
		this.trainingId = trainingId;
		this.totalCredits = totalCredits;
		this.starSum = starSum;
	}
	public Integer getRosterId() {
		return rosterId;
	}
	public void setRosterId(Integer rosterId) {
		this.rosterId = rosterId;
	}
	public String getMemberNumber() {
		return memberNumber;
	}
	public void setMemberNumber(String memberNumber) {
		this.memberNumber = memberNumber;
	}
	public Integer getTrainingId() {
		return trainingId;
	}
	public void setTrainingId(Integer trainingId) {
		this.trainingId = trainingId;
	}
	public Integer getTotalCredits() {
		return totalCredits;
	}
	public void setTotalCredits(Integer totalCredits) {
		this.totalCredits = totalCredits;
	}
	public Integer getStarSum() {
		return starSum;
	}
	public void setStarSum(Integer starSum) {
		this.starSum = starSum;
	}
	
	
}
