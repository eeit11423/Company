package company.train.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import company.shopping.model.OrderBean;
import company.train.dao.ProductDao;
import company.train.model.TrainingBean;
import company.train.model.CompanyBean;
import company.train.model.RosterBean;
import company.train.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService {
	
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
//		System.out.println("THIS IS SERVICE");
//		System.out.println(bean.getTrainingId());
		productDao.updateTraining(bean);
	}
	@Transactional
	@Override
	public List<TrainingBean> getAllProducts() {
		return productDao.getAllProducts();
	}
	@Transactional
	@Override
	public List<RosterBean> getAllCourse() {
		return productDao.getAllCourse();
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
	public void deleteCourse(int key2) {
		productDao.delete(key2);
	}
	
	@Transactional
	@Override
	public void addscore(int totalstar,int id, int starsumtrainingId) {
		
		productDao.addscore(totalstar,id,starsumtrainingId);
	}
	
	@Transactional
	@Override
	public List<RosterBean> listRosterBean(String memberId) {
		
		return productDao.listRosterBean(memberId);
	}
	
	@Transactional
	@Override
	public void insertCourseOrder(RosterBean rb) {		
		productDao.insertCourseDao(rb);// 儲存該筆訂單
	}
	@Transactional
	@Override
	public List<String> getStrings(String number) {
		
		return productDao.getStrings(number);
	}
	@Transactional
	@Override
	public List<TrainingBean> getonetrain(Integer trainingId) {
		
		return productDao.getonetrain(trainingId);
	}
	
	@Transactional
	@Override
	public void insertCourseDao(RosterBean rb) {		
		productDao.insertCourseDao(rb);
	}
	@Transactional
	@Override
	public List<String> getAllCategories123() {
		// TODO Auto-generated method stub
		return productDao.getAllCategories123();
	}
	
	
}
