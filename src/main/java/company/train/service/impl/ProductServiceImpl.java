package company.train.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import company.train.dao.ProductDao;
import company.train.model.TrainingBean;
import company.train.model.CompanyBean;
import company.train.model.RosterBean;
import company.train.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService {
//	@Autowired
//	SessionFactory  factory;
//	
	@Autowired
	ProductDao productDao;
	
	@Transactional
	@Override
	public void saveTraining(TrainingBean Tb) {
		int count = 0;
		productDao.saveTraining(Tb);
		count ++;
		
	}
	@Transactional
	@Override
	public void updateTraining(TrainingBean bean) {
		System.out.println("THIS IS SERVICE");
		System.out.println(bean.getTrainingId());
		productDao.updateTraining(bean);
	}
	@Transactional
	@Override
	public List<TrainingBean> getAllProducts() {
		return productDao.getAllProducts();
	}

	@Transactional
	@Override
	public List<String> getAllCategories() {
		return productDao.getAllCategories();
	}
	@Transactional
	@Override
	public List<TrainingBean> getProductsByCategory(String category) {
		return productDao.getProductsByCategory(category);
	}
	
	
	@Transactional
	@Override
	public TrainingBean getProductById(int productId) {
		return productDao.getProductById(productId);
	}
	@Transactional
	@Override
	public void addProduct(TrainingBean product) {
		productDao.addProduct(product);
	}
	@Transactional
	@Override
	public CompanyBean getCompanyById(int companyId) {
		return productDao.getCompanyById(companyId);
	}
	@Transactional
	@Override
	public List<CompanyBean> getCompanyList() {
		return productDao.getCompanyList();
	}
	
	@Transactional
	@Override
	public void delete(int key) {
		productDao.delete(key);
	}
	
	@Transactional
	@Override
	public void addscore(int totalstar,int id) {
		
		productDao.addscore(totalstar,id);
	}
}
