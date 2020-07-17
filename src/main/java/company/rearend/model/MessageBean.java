package company.rearend.model;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Messages")
public class MessageBean {
	@Id 
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer messageId;//id
	Integer memberId;
	String messageName;
	String message;
	Date messageinputDate;
	
	public MessageBean() {
		super();
	}
	public MessageBean(Integer messageId, Integer memberId, String messageName, String message, Date messageinputDate) {
		super();
		this.messageId = messageId;
		this.memberId = memberId;
		this.messageName = messageName;
		this.message = message;
		this.messageinputDate = messageinputDate;
	}
	public Integer getMessageId() {
		return messageId;
	}
	public void setMessageId(Integer messageId) {
		this.messageId = messageId;
	}
	public Integer getMemberId() {
		return memberId;
	}
	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}
	public String getMessageName() {
		return messageName;
	}
	public void setMessageName(String messageName) {
		this.messageName = messageName;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Date getMessageinputDate() {
		return messageinputDate;
	}
	public void setMessageinputDate(Date messageinputDate) {
		this.messageinputDate = messageinputDate;
	}
	
}
