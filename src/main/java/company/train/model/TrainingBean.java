package company.train.model;

import java.io.Serializable;
import java.sql.Blob;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;
// 本類別封裝單筆書籍資料
@Entity
@Table(name="Training")
public class TrainingBean implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)	
	private Integer trainingId ;
	private String  trainingCourse;
	private Integer	trainingCredit;
	private Integer	trainingStartDate;
	private Integer	trainingEndDate;
	private String	brief;
	private String	elaborate;	
//	@Transient	
	private String  pictureName;	//原始照片檔名
	private Blob    pictureFile;	//照片二進位存放欄位名稱
	private String 	courseNo;
//	private String	pictureFormatDecide=null;
//	private String	fileFormatDecide=null;
//	private String  dataName=null;
//	private Blob    dataFile=null;	//照片二進位存放欄位名稱
	private String	URLUpload;
//	private Integer	decideOne=null;
//	private Integer	decideTwo=null;
//	private Integer stock;
//	@Transient
	private String  category;
	@Transient
	private Integer  companyId;
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="FK_CompanyBean_Id") 	
    private CompanyBean companyBean;
	@Transient
	private MultipartFile  productImage;
	@Transient
	private Integer  starSum;//星星評分
	public TrainingBean(Integer trainingId,String trainingCourse,Integer trainingCredit
	,Integer trainingStartDate,Integer trainingEndDate,String brief,String elaborate
	,String pictureName,Blob pictureFile,String courseNo,String pictureFormatDecide
	,Blob dataFile,String URLUpload
	,Integer decideOne,Integer	decideTwo,String category,Integer companyId
	,CompanyBean companyBean) {	
		
		this.trainingId = trainingId;
		this.trainingCourse = trainingCourse;
		this.trainingCredit = trainingCredit;
		this.trainingStartDate = trainingStartDate;
		this.trainingEndDate = trainingEndDate;
		this.brief=brief;
		this.elaborate=elaborate;
//		this.pictureFormatDecide=pictureFormatDecide;
//		this.fileFormatDecide=fileFormatDecide;	
		this.pictureName = pictureName;
		this.courseNo = courseNo;
		this.pictureFile = pictureFile;
//		this.dataName = dataName;		
//		this.dataFile = dataFile;
		this.URLUpload = URLUpload;
//		this.decideOne = decideOne;
//		this.decideTwo = decideTwo;		
		this.companyId = companyId;
		this.category = category;
		this.companyBean = companyBean;
//		this.stock = stock;

	}

	
	public Integer getStarSum() {
		return starSum;
	}


	public void setStarSum(Integer starSum) {
		this.starSum = starSum;
	}


	public TrainingBean() {
	}
	
	public Integer getTrainingId() {   // bookId
		return trainingId;
	}
	public void setTrainingId(Integer trainingId) {
		this.trainingId = trainingId;
	}
	
	public CompanyBean getCompanyBean() {
		return companyBean;
	}

	public void setCompanyBean(CompanyBean companyBean) {
		this.companyBean = companyBean;
	}


	public String getTrainingCourse() {
		return trainingCourse;
	}
	
	public void setTrainingCourse(String trainingCourse) {
		this.trainingCourse = trainingCourse;
	}
	
	
	public Integer getTrainingCredit() {
		return trainingCredit;
	}
	
	public void setTrainingCredit(Integer trainingCredit) {
		this.trainingCredit = trainingCredit;
	}
	
	public Integer getTrainingStartDate() {
		return trainingStartDate;
	}
	
	public void setTrainingStartDate(Integer trainingStartDate) {
		this.trainingStartDate = trainingStartDate;
	}
	
	public void setTrainingEndDate(Integer trainingEndDate) {
		this.trainingEndDate = trainingEndDate;
	}
	
	public Integer getTrainingEndDate() {
		return trainingEndDate;
	}
	
	public void setBrief(String brief) {
		this.brief = brief;
	}
	
	public String getBrief() {
		return brief;
	}
	
	public void setElaborate(String elaborate) {
		this.elaborate = elaborate;
	}
	
	public String getElaborate() {
		return elaborate;
	}
	
	public String getPictureName() {
		return pictureName;
	}
	
	public void setpictureName(String pictureName) {
		this.pictureName = pictureName;
	}
	
	public String getCourseNo() {
		return courseNo;
	}
	public void setCourseNo(String courseNo) {
		this.courseNo = courseNo;
	}
	
//	public Blob getDataFile() {
//		return dataFile;
//	}
	
//	public void setDataFile(Blob dataFile) {
//		this.dataFile = dataFile;
//	}
	
	public String getURLUpload() {
		return URLUpload;
	}
	
	public void setURLUpload(String URLUpload) {
		this.URLUpload = URLUpload;
	}
//	public Integer getDecideOne() {
//		return decideOne;
//	}
//	public void setDecideOne(Integer decideOne) {
//		this.decideOne = decideOne;
//	}
	
//	public Integer getDecideTwo() {
//		return decideTwo;
//	}
//	public void setDecideTwo(Integer decideTwo) {
//		this.decideTwo = decideTwo;
//	}
	
//	public String getDataName() {
//		return dataName;
//	}
	
//	public void setDataName(String dataName) {
//		this.dataName = dataName;
//	}

	public Blob getPictureFile() {
		return pictureFile;
	}
	
	public void setPictureFile(Blob pictureFile) {
		this.pictureFile = pictureFile;
	}

//	public String getPictureFormatDecide() {
//		return pictureFormatDecide;
//	}
	
//	public void setPictureFormatDecide(String pictureFormatDecide) {
//		this.pictureFormatDecide = pictureFormatDecide;
//	}
//	public String getFileFormatDecide() {
//		return fileFormatDecide;
//	}
	
//	public void setFileFormatDecide(String fileFormatDecide) {
//		this.fileFormatDecide = fileFormatDecide;
//	}
	
		
	public Integer getCompanyId() {
		return companyId;
	}

	public void setCompanyId(Integer companyId) {
		this.companyId = companyId;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}


	public MultipartFile getProductImage() {
	    return productImage;
	}
	public void setProductImage(MultipartFile productImage) {
	    this.productImage = productImage;
	}

//	public Integer getStock() {
//		return stock;
//	}
//
//	public void setStock(Integer stock) {
//		this.stock = stock;
//	}	
	

	
}
