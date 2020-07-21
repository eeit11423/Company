package company.shopping.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import company.shopping.dao.ShoppingDao;
import company.shopping.model.ShoppingBean;

import company.shopping.service.ShoppingService;
@Service
public class ShoppingServiceImpl implements ShoppingService {
	@Autowired
	ShoppingDao shoppingDao;
	@Transactional
	@Override
	public List<ShoppingBean> getAllProducts() {
		return shoppingDao.getAllProducts();
	}
	@Transactional
	@Override
	public void addProduct(ShoppingBean product) {
		shoppingDao.addProduct(product);
		
	}
	@Transactional
	@Override
	public void delete(Integer shoppingId) {
		shoppingDao.delete(shoppingId);
		
	}
	@Transactional
	@Override
	public void update(ShoppingBean product) {
		shoppingDao.update(product);
		
	}
	@Transactional
	@Override
	public ShoppingBean getshoppingId(int shoppingId) {
		
		return shoppingDao.getshoppingId(shoppingId);
	}
	@Transactional
	@Override
	public List<ShoppingBean> getshoppingType(String shoppingType) {
		return shoppingDao.getshoppingType(shoppingType);
	}
	@Transactional
	@Override
	public List<ShoppingBean> getALLShoppingType() {
		return shoppingDao.getALLShoppingType();
	}
	@Transactional
	@Override
	public List<ShoppingBean> getAllProductsNewtoOld() {
		
		return shoppingDao.getAllProductsNewtoOld();
	}
	@Transactional
	@Override
	public List<ShoppingBean> getAllProductsPriceHightoLow() {
		
		return  shoppingDao.getAllProductsPriceHightoLow();
	}
	
	@Transactional
	@Override
	public List<ShoppingBean> getAllProductsPriceLowtoHigh() {
		
		return shoppingDao.getAllProductsPriceLowtoHigh();
	}
	@Transactional
	@Override
	public List<ShoppingBean> getSearchShoppingNameProductrelatio(String searchWord) {

		return shoppingDao.getSearchShoppingNameProductrelatio(searchWord);
	}

}
