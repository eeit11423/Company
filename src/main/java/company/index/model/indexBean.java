package company.index.model;

import java.sql.Blob;
import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name = "indexPicture")
public class indexBean {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer indexId;
	private String memberNumber;
	private String indexH2;
	private String indexP;
	private Blob indexImage;// 圖片
	private String indexfileName;// 圖片檔名
	private Timestamp indexDate;
	@Transient
	private MultipartFile productImage;
	
	
	
	
	
	



	@Override
	public String toString() {
		return "indexBean [indexId=" + indexId + ", memberNumber=" + memberNumber + ", indexH2=" + indexH2 + ", indexP="
				+ indexP + ", indexImage=" + indexImage + ", indexfileName=" + indexfileName + ", indexDate="
				+ indexDate + ", productImage=" + productImage + "]";
	}
	public indexBean(Integer indexId, String memberNumber, String indexH2, String indexP, Blob indexImage,
			String indexfileName, Timestamp indexDate, MultipartFile productImage) {
		super();
		this.indexId = indexId;
		this.memberNumber = memberNumber;
		this.indexH2 = indexH2;
		this.indexP = indexP;
		this.indexImage = indexImage;
		this.indexfileName = indexfileName;
		this.indexDate = indexDate;
		this.productImage = productImage;
	}
	public String getIndexH2() {
		return indexH2;
	}
	public void setIndexH2(String indexH2) {
		this.indexH2 = indexH2;
	}
	public String getIndexP() {
		return indexP;
	}
	public void setIndexP(String indexP) {
		this.indexP = indexP;
	}
	public indexBean() {
		// TODO Auto-generated constructor stub
	}
	public Integer getIndexId() {
		return indexId;
	}
	public void setIndexId(Integer indexId) {
		this.indexId = indexId;
	}
	public Blob getIndexImage() {
		return indexImage;
	}
	public void setIndexImage(Blob indexImage) {
		this.indexImage = indexImage;
	}
	public String getIndexfileName() {
		return indexfileName;
	}
	public void setIndexfileName(String indexfileName) {
		this.indexfileName = indexfileName;
	}
	public MultipartFile getProductImage() {
		return productImage;
	}
	public void setProductImage(MultipartFile productImage) {
		this.productImage = productImage;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public Timestamp getIndexDate() {
		return indexDate;
	}
	public void setIndexDate(Timestamp indexDate) {
		this.indexDate = indexDate;
	}
	public String getMemberNumber() {
		return memberNumber;
	}
	public void setMemberNumber(String memberNumber) {
		this.memberNumber = memberNumber;
	}
	
	
	
}
