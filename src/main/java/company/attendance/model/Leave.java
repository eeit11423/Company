package company.attendance.model;

import java.sql.Timestamp;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
public class Leave {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer leaveId;
	String memberNumber;
	String memberName;
	String memberDepartment;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	Date leaveDate;
	Timestamp leaveStart;
	Timestamp leaveEnd;
	Long leaveHours;
	String leaveCategory;
	String leaveCause;
	String leaveAudit;
	
	public Leave() {
		super();
	}
	public Leave(Integer leaveId, String memberNumber, String memberName, String memberDepartment, Date leaveDate,
			String leaveCategory,Timestamp leaveStart, Timestamp leaveEnd) {
		super();
		this.leaveId = leaveId;
		this.memberNumber = memberNumber;
		this.memberName = memberName;
		this.memberDepartment = memberDepartment;
		this.leaveDate = leaveDate;
		this.leaveCategory = leaveCategory;
		this.leaveStart = leaveStart;
		this.leaveEnd = leaveEnd;
	}
	public Leave(Integer leaveId, String memberNumber, String memberName, String memberDepartment) {
		super();
		this.leaveId = leaveId;
		this.memberNumber = memberNumber;
		this.memberName = memberName;
		this.memberDepartment = memberDepartment;
	}
	public Integer getLeaveId() {
		return leaveId;
	}
	public void setLeaveId(Integer leaveId) {
		this.leaveId = leaveId;
	}
	public String getMemberNumber() {
		return memberNumber;
	}
	public void setMemberNumber(String memberNumber) {
		this.memberNumber = memberNumber;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberDepartment() {
		return memberDepartment;
	}
	public void setMemberDepartment(String memberDepartment) {
		this.memberDepartment = memberDepartment;
	}
	public Date getLeaveDate() {
		return leaveDate;
	}
	public void setLeaveDate(Date date) {
		this.leaveDate = date;
	}
	public Timestamp getLeaveStart() {
		return leaveStart;
	}
	public void setLeaveStart(Timestamp leaveStart) {
		this.leaveStart = leaveStart;
	}
	public Timestamp getLeaveEnd() {
		return leaveEnd;
	}
	public void setLeaveEnd(Timestamp leaveEnd) {
		this.leaveEnd = leaveEnd;
	}
	public Long getLeaveHours() {
		return leaveHours;
	}
	public void setLeaveHours(Long leaveHours) {
		this.leaveHours = leaveHours;
	}
	public String getLeaveCategory() {
		return leaveCategory;
	}
	public void setLeaveCategory(String leaveCategory) {
		this.leaveCategory = leaveCategory;
	}
	public String getLeaveCause() {
		return leaveCause;
	}
	public void setLeaveCause(String leaveCause) {
		this.leaveCause = leaveCause;
	}
	public String getLeaveAudit() {
		return leaveAudit;
	}
	public void setLeaveAudit(String leaveAudit) {
		this.leaveAudit = leaveAudit;
	}
	
	
}
