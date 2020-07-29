package company.train.dao;

import java.util.List;

import company.train.model.TrainingBean;
import company.shopping.model.OrderBean;
import company.train.model.CompanyBean;
import company.train.model.RosterBean;

public interface ProductDao {
//	List<BookBean>  getAllProducts(); 
//	void updateStock(int productId, int newQuantity);
	
	List<TrainingBean> getAllProducts();
	List<RosterBean> getAllCourse();
	
	List<String>  getAllCategories();
	List<String>  getAllCategories123();
	
	List<TrainingBean>  getProductsByCategory(String category);
	public TrainingBean getProductById(int productId);

	
	
	void  addProduct(TrainingBean product);
	CompanyBean  getCompanyById(int companyId);
	List<CompanyBean>  getCompanyList();
	
	void delete(int key);
	void deleteCourse(int key2);
	
	public void saveTraining(TrainingBean Tb);
	public void updateTraining(TrainingBean bean);
	
//	void addscore(RosterBean rosterBean);
	void addscore(int totalstar,int id, int starsumtrainingId);
	
	
	List<RosterBean> listRosterBean (String memberId);
	
	void insertCourseDao(RosterBean rb);
	
	public List<String> getStrings(String number);
	
	public List<TrainingBean> getonetrain(Integer trainingId);
}
