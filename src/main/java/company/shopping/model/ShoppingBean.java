package company.shopping.model;

import java.sql.Blob;
import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "ShoppinLaber")
public class ShoppingBean {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer shoppingId;
	private String shoppingItemId;// 商品編號
	private String memberNumber;
	private String shoppingType;// 商品類型
	private String shoppingname;
	private Integer shoppingProductTotal;// 商品總數
	private Double shoppingProductPrice;// 商品價格
	private Double shoppingProductDiscount;// 商品折扣
	@JsonIgnore
	private Blob shoppingProductImage;// 商品圖片
	private String shoppingfileName;// 商品圖片檔名
	private String productrelation;// 商品敘述
	private Timestamp shoppingDate;// 上傳時間

	@Transient
	@JsonIgnore
	private MultipartFile productImage;

	private String DiscountStr;// 折扣
	@Transient
	private Integer keyboardId;

	public ShoppingBean() {
		super();
	}
	




	public ShoppingBean(Integer shoppingId, String shoppingItemId, String memberNumber, String shoppingType,
			String shoppingname, Integer shoppingProductTotal, Double shoppingProductPrice,
			Double shoppingProductDiscount, Blob shoppingProductImage, String shoppingfileName, String productrelation,
			Timestamp shoppingDate, String discountStr, Integer keyboardId) {
		super();
		this.shoppingId = shoppingId;
		this.shoppingItemId = shoppingItemId;
		this.memberNumber = memberNumber;
		this.shoppingType = shoppingType;
		this.shoppingname = shoppingname;
		this.shoppingProductTotal = shoppingProductTotal;
		this.shoppingProductPrice = shoppingProductPrice;
		this.shoppingProductDiscount = shoppingProductDiscount;
		this.shoppingProductImage = shoppingProductImage;
		this.shoppingfileName = shoppingfileName;
		this.productrelation = productrelation;
		this.shoppingDate = shoppingDate;
		DiscountStr = discountStr;
		this.keyboardId = keyboardId;
	}





	public String getShoppingType() {
		return shoppingType;
	}

	public void setShoppingType(String shoppingType) {
		this.shoppingType = shoppingType;
	}

	public Timestamp getShoppingDate() {
		return shoppingDate;
	}

	public void setShoppingDate(Timestamp shoppingDate) {
		this.shoppingDate = shoppingDate;
	}

	public String getShoppingfileName() {
		return shoppingfileName;
	}



	public void setShoppingfileName(String shoppingfileName) {
		this.shoppingfileName = shoppingfileName;
	}





	public Integer getShoppingId() {
		return shoppingId;
	}

	public void setShoppingId(Integer shoppingId) {
		this.shoppingId = shoppingId;
	}

	public void setMemberNumber(String memberNumber) {
		this.memberNumber = memberNumber;
	}

	public String getMemberNumber() {
		return memberNumber;
	}

	public String getShoppingname() {
		return shoppingname;
	}

	public void setShoppingname(String shoppingname) {
		this.shoppingname = shoppingname;
	}

	public String getShoppingItemId() {
		return shoppingItemId;
	}

	public void setShoppingItemId(String shoppingItemId) {
		this.shoppingItemId = shoppingItemId;
	}

	public Integer getShoppingProductTotal() {
		return shoppingProductTotal;
	}

	public void setShoppingProductTotal(Integer shoppingProductTotal) {
		this.shoppingProductTotal = shoppingProductTotal;
	}

	public Double getShoppingProductPrice() {
		return shoppingProductPrice;
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

	public Blob getShoppingProductImage() {
		return shoppingProductImage;
	}

	public void setShoppingProductImage(Blob shoppingProductImage) {
		this.shoppingProductImage = shoppingProductImage;
	}

	public String getProductrelation() {
		return productrelation;
	}

	public void setProductrelation(String productrelation) {
		this.productrelation = productrelation;
	}

	public MultipartFile getProductImage() {
		return productImage;
	}

	public void setProductImage(MultipartFile productImage) {
		this.productImage = productImage;
	}

	public String getDiscountStr() {
		return DiscountStr;
	}

	public void setDiscountStr(String discountStr) {
		DiscountStr = discountStr;
	}

	public Integer getKeyboardId() {
		return keyboardId;
	}

	public void setKeyboardId(Integer keyboardId) {
		this.keyboardId = keyboardId;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}





	@Override
	public String toString() {
		return "ShoppingBean [shoppingId=" + shoppingId + ", shoppingItemId=" + shoppingItemId + ", memberNumber="
				+ memberNumber + ", shoppingType=" + shoppingType + ", shoppingname=" + shoppingname
				+ ", shoppingProductTotal=" + shoppingProductTotal + ", shoppingProductPrice=" + shoppingProductPrice
				+ ", shoppingProductDiscount=" + shoppingProductDiscount + ", shoppingProductImage="
				+ shoppingProductImage + ", shoppingfileName=" + shoppingfileName + ", productrelation="
				+ productrelation + ", shoppingDate=" + shoppingDate + ", productImage=" + productImage
				+ ", DiscountStr=" + DiscountStr + ", keyboardId=" + keyboardId + "]";
	}
	
	

}
