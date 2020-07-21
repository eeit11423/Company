package company.train.service;

import java.util.List;
import company.train.model.TrainingBean;
import company.train.model.CompanyBean;
import company.train.model.RosterBean;

public interface ProductService {
	List<TrainingBean>  getAllProducts(); 
//	void updateAllStock();
	
	
	public TrainingBean getProductById(int productId);	
	
	void  addProduct(TrainingBean product);
	CompanyBean  getCompanyById(int companyId);
	List<CompanyBean>  getCompanyList();

	
	List<String>  getAllCategories();
	List<TrainingBean>  getProductsByCategory(String category);
	
	void delete(int key);
	void saveTraining(TrainingBean Tb);
	public void updateTraining(TrainingBean bean);
	
	void addscore(int totalstar,int id);
}
