package company.shopping.model;

import java.util.Date;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;
// 本類別存放訂單資料
@Entity
@Table(name="Orders")
public class OrderBean {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	Integer orderNo; //訂單編號
	Date    orderDate;  //下單時間
	String	orderAddress; //寄送地址
	Double	orderTotalPrice; // 商品總金額
	String 	memberNumber; //員工編號
	
//	
	@OneToMany(mappedBy="orderBean", cascade=CascadeType.ALL)
	Set<OrderItemBean> items = new LinkedHashSet<>();
//	
	public OrderBean() {
		
	}
    
	
	
	
	public OrderBean(Integer orderNo, Date orderDate, String orderAddress, Double orderTotalPrice, String memberNumber
			,Set<OrderItemBean> items
			) {
		super();
		this.orderNo = orderNo;
		this.orderDate = orderDate;
		this.orderAddress = orderAddress;
		this.orderTotalPrice = orderTotalPrice;
		this.memberNumber = memberNumber;
		this.items = items;
	}




	public Integer getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(Integer orderNo) {
		this.orderNo = orderNo;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public String getOrderAddress() {
		return orderAddress;
	}

	public void setOrderAddress(String orderAddress) {
		this.orderAddress = orderAddress;
	}

	public Double getOrderTotalPrice() {
		return orderTotalPrice;
	}

	public void setOrderTotalPrice(Double orderTotalPrice) {
		this.orderTotalPrice = orderTotalPrice;
	}

	public String getMemberNumber() {
		return memberNumber;
	}

	public void setMemberNumber(String memberNumber) {
		this.memberNumber = memberNumber;
	}

	public Set<OrderItemBean> getItems() {
		return items;
	}

	public void setItems(Set<OrderItemBean> items) {
		this.items = items;
	}









}