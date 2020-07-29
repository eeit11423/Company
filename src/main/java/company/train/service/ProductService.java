package company.train.service;

import java.util.List;
import company.train.model.TrainingBean;
import company.shopping.model.OrderBean;
import company.train.model.CompanyBean;
import company.train.model.RosterBean;

public interface ProductService {
	List<TrainingBean>  getAllProducts(); 
	List<RosterBean>  getAllCourse(); 

	List<String>  getAllCategories123();
	
	public TrainingBean getProductById(int productId);	
	
	
	void  addProduct(TrainingBean product);
	CompanyBean  getCompanyById(int companyId);
	List<CompanyBean>  getCompanyList();

	
	List<String>  getAllCategories();
	List<TrainingBean>  getProductsByCategory(String category);
	
	void delete(int key);
	void deleteCourse(int key2);
	
	void saveTraining(TrainingBean Tb);
	public void updateTraining(TrainingBean bean);
	
	void addscore(int totalstar,int id, int starsumtrainingId);
	
	List<RosterBean> listRosterBean (String memberId);
	
	void insertCourseOrder(RosterBean rb);
	public List<String> getStrings(String number);
	public List<TrainingBean> getonetrain(Integer trainingId);
	
	void insertCourseDao(RosterBean rb);
}
