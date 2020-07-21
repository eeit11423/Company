package company.train.dao;

import java.util.List;

import company.train.model.TrainingBean;
import company.train.model.CompanyBean;
import company.train.model.RosterBean;

public interface ProductDao {
//	List<BookBean>  getAllProducts(); 
//	void updateStock(int productId, int newQuantity);
	
	List<TrainingBean> getAllProducts();
	
	
	List<String>  getAllCategories();
	List<TrainingBean>  getProductsByCategory(String category);
	public TrainingBean getProductById(int productId);
	
	
	void  addProduct(TrainingBean product);
	CompanyBean  getCompanyById(int companyId);
	List<CompanyBean>  getCompanyList();
	
	void delete(int key);
	public void saveTraining(TrainingBean Tb);
	public void updateTraining(TrainingBean bean);
	
//	void addscore(RosterBean rosterBean);
	void addscore(int totalstar,int id);

}
