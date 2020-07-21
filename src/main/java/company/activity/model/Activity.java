package company.activity.model;

import java.sql.Blob;
import java.sql.Date;
import java.sql.Timestamp;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.persistence.UniqueConstraint;

import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name = "Activity_CRUD", uniqueConstraints = { @UniqueConstraint(columnNames = "activityTitle") })
public class Activity {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)	
	Integer id;
	String activityTitle;
	String activitySubtitle;
	String content;
	Date startDate;
	Date endDate;
	String actCategory;
	Integer organiserId;
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "department_id", nullable = false)
	Department department;
	Blob image;
	String fileName;
	String login;
	Timestamp postTime;
	//新增報名人數
	Integer joinNum;
	//新增異動欄位
	Timestamp updateTime;
	@Transient
	MultipartFile otherImage;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getActivityTitle() {
		return activityTitle;
	}
	public void setActivityTitle(String activityTitle) {
		this.activityTitle = activityTitle;
	}
	public String getActivitySubtitle() {
		return activitySubtitle;
	}
	public void setActivitySubtitle(String activitySubtitle) {
		this.activitySubtitle = activitySubtitle;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	
	public Integer getJoinNum() {
		return joinNum;
	}
	public void setJoinNum(Integer joinNum) {
		this.joinNum = joinNum;
	}
	public String getActCategory() {
		return actCategory;
	}
	public void setActCategory(String actCategory) {
		this.actCategory = actCategory;
	}

	public Integer getOrganiserId() {
		return organiserId;
	}
	public void setOrganiserId(Integer organiserId) {
		this.organiserId = organiserId;
	}
	public Department getDepartment() {
		return department;
	}
	public void setDepartment(Department department) {
		this.department = department;
	}
	public Blob getImage() {
		return image;
	}
	public void setImage(Blob image) {
		this.image = image;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	public Timestamp getPostTime() {
		return postTime;
	}
	public void setPostTime(Timestamp postTime) {
		this.postTime = postTime;
	}
	public MultipartFile getOtherImage() {
		return otherImage;
	}
	public void setOtherImage(MultipartFile otherImage) {
		this.otherImage = otherImage;
	}
	public Timestamp getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Timestamp updateTime) {
		this.updateTime = updateTime;
	}
	@Override
	public String toString() {
		return "Activity [id=" + id + ", activityTitle=" + activityTitle + ", activitySubtitle=" + activitySubtitle
				+ ", content=" + content + ", startDate=" + startDate + ", endDate=" + endDate + ", actCategory="
				+ actCategory + ", organiserId=" + organiserId + ", department=" + department + ", image=" + image
				+ ", fileName=" + fileName + ", login=" + login + ", postTime=" + postTime + ", joinNum=" + joinNum
				+ ", updateTime=" + updateTime + ", otherImage=" + otherImage + "]";
	}


	




	


	
	
	
	
}
