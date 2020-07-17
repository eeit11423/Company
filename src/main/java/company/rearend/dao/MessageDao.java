package company.rearend.dao;

import java.util.List;

import company.rearend.model.MessageBean;



public interface MessageDao {
	List<MessageBean> getAllMessage();
}
