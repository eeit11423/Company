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
	private Blob indexImage;// 圖片
	private String indexfileName;// 圖片檔名
	private Timestamp indexDate;
	@Transient
	private MultipartFile productImage;
	
	
	
	
	
	


	@Override
	public String toString() {
		return "indexBean [indexId=" + indexId + ", memberNumber=" + memberNumber + ", indexImage=" + indexImage
				+ ", indexfileName=" + indexfileName + ", indexDate=" + indexDate + ", productImage=" + productImage
				+ "]";
	}
	public indexBean(Integer indexId, String memberNumber, Blob indexImage, String indexfileName, Timestamp indexDate,
			MultipartFile productImage) {
		super();
		this.indexId = indexId;
		this.memberNumber = memberNumber;
		this.indexImage = indexImage;
		this.indexfileName = indexfileName;
		this.indexDate = indexDate;
		this.productImage = productImage;
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
