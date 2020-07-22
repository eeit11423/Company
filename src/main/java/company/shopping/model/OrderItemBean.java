package company.shopping.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

//本類別封裝單筆訂單資料
@Entity
@Table(name="OrderItems")
public class OrderItemBean {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	Integer orderItemsId;	//清單編號ID
	Integer orderItemsNumber;	//商品數量
	Integer	orderId;	//訂單編號
	Date orderDate;//下單時間
	Integer shoppingId; 	//商品ID
	String shoppingProductName;	//商品名稱
	String productrelatio; //商品敘述
	Double shoppingProductPrice;	//商品價格
	Double shoppingProductDiscount;	//商品折扣
	String shoppingType;// 商品類型
	Double shoppingAmount;//商品總金額
    @Transient
	ShoppingBean shoppingBean; 
//    @Transient
//    OrderBean orderBean;
	@ManyToOne
	@JoinColumn(name = "FK_OrderBean_orderNo")
	OrderBean orderBean;
	@Transient
	Integer a;

	public OrderItemBean() {
		super();
	}
















	public OrderItemBean(Integer orderItemsId, Integer orderItemsNumber, Integer orderId, Date orderDate,
			Integer shoppingId, String shoppingProductName, String productrelatio, Double shoppingProductPrice,
			Double shoppingProductDiscount, String shoppingType, Double shoppingAmount, ShoppingBean shoppingBean,
			OrderBean orderBean, Integer a) {
		super();
		this.orderItemsId = orderItemsId;
		this.orderItemsNumber = orderItemsNumber;
		this.orderId = orderId;
		this.orderDate = orderDate;
		this.shoppingId = shoppingId;
		this.shoppingProductName = shoppingProductName;
		this.productrelatio = productrelatio;
		this.shoppingProductPrice = shoppingProductPrice;
		this.shoppingProductDiscount = shoppingProductDiscount;
		this.shoppingType = shoppingType;
		this.shoppingAmount = shoppingAmount;
		this.shoppingBean = shoppingBean;
		this.orderBean = orderBean;
		this.a = a;
	}
















	public Integer getShoppingId() {
		return shoppingId;
	}





	public void setShoppingId(Integer shoppingId) {
		this.shoppingId = shoppingId;
	}





	public Integer getOrderItemsId() {
		return orderItemsId;
	}


	public void setOrderItemsId(Integer orderItemsId) {
		this.orderItemsId = orderItemsId;
	}


	public Integer getOrderItemsNumber() {
		return orderItemsNumber;
	}


	public void setOrderItemsNumber(Integer orderItemsNumber) {
		this.orderItemsNumber = orderItemsNumber;
	}


	public Integer getOrderId() {
		return orderId;
	}


	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}


	public Date getOrderDate() {
		return orderDate;
	}


	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}


	public String getShoppingProductName() {
		return shoppingProductName;
	}


	public void setShoppingProductName(String shoppingProductName) {
		this.shoppingProductName = shoppingProductName;
	}


	public String getProductrelatio() {
		return productrelatio;
	}


	public void setProductrelatio(String productrelatio) {
		this.productrelatio = productrelatio;
	}


	public Double getShoppingProductPrice() {
		return shoppingProductPrice;
	}


	public void oib(Double shoppingProductPrice) {
		this.shoppingProductPrice = shoppingProductPrice;
	}


	public void setShoppingProductPrice(Double shoppingProductPrice) {
		this.shoppingProductPrice = shoppingProductPrice;
	}





	public Double getShoppingProductDiscount() {
		return shoppingProductDiscount;
	}


	public void setShoppingProductDiscount(Double shoppingProductDiscount) {
		this.shoppingProductDiscount = shoppingProductDiscount;
	}


	public ShoppingBean getShoppingBean() {
		return shoppingBean;
	}


	public void setShoppingBean(ShoppingBean shoppingBean) {
		this.shoppingBean = shoppingBean;
	}


	public OrderBean getOrderBean() {
		return orderBean;
	}


	public void setOrderBean(OrderBean orderBean) {
		this.orderBean = orderBean;
	}











	public String getShoppingType() {
		return shoppingType;
	}








	public void setShoppingType(String shoppingType) {
		this.shoppingType = shoppingType;
	}













	public Double getShoppingAmount() {
		return shoppingAmount;
	}








	public void setShoppingAmount(Double shoppingAmount) {
		this.shoppingAmount = shoppingAmount;
	}








	@Override
	public String toString() {
		return "OrderItemBean [orderItemsId=" + orderItemsId + ", orderItemsNumber=" + orderItemsNumber + ", orderId="
				+ orderId + ", orderDate=" + orderDate + ", shoppingId=" + shoppingId + ", shoppingProductName="
				+ shoppingProductName + ", productrelatio=" + productrelatio + ", shoppingProductPrice="
				+ shoppingProductPrice + ", shoppingProductDiscount=" + shoppingProductDiscount + ", shoppingType="
				+ shoppingType + ", shoppingAmount=" + shoppingAmount + ", shoppingBean=" + shoppingBean
				+ ", orderBean=" + orderBean + ", a=" + a + "]";
	}








	public Integer getA() {
		return a;
	}





	public void setA(Integer a) {
		this.a = a;
	}
	
	

}