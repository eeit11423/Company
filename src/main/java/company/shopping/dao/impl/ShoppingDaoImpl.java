package company.shopping.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



import company.shopping.dao.ShoppingDao;
import company.shopping.model.ShoppingBean;
//import company.shopping.model.keyboardBean;
@Repository
public class ShoppingDaoImpl implements ShoppingDao {
	@Autowired
	SessionFactory factory;
	@SuppressWarnings("unchecked")
	@Override
	public List<ShoppingBean> getAllProducts() {
			String hql="FROM ShoppingBean";
//			String hq2="FROM ShoppingBean s WHERE productrelation ";
			Session session=factory.getCurrentSession();
			List<ShoppingBean> list=session.createQuery(hql)
									.getResultList();
//			List<ShoppingBean> list2=session.createQuery(hq2)
//									.getResultList();
//			
			return list;
	}
	@Override
	public void addProduct(ShoppingBean product ) {
		Session session = factory.getCurrentSession();
//		keyboardBean cb =getkeyboardById(product.getKeyboardId());
//		product.setKeyboardBean(cb);
		session.save(product);
		
	}
	@Override
	public ShoppingBean getshoppingId(int shoppingId) {
		Session session = factory.getCurrentSession();
		return session.get(ShoppingBean.class, shoppingId);
	}
	@Override
	public void delete(Integer shoppingId) {
		Session session = factory.getCurrentSession();
		ShoppingBean tb=getshoppingId(shoppingId);
		session.delete(tb);
		
	}
	@Override
	public void update(ShoppingBean shoppingBean) {
		  Session session=factory.getCurrentSession();
		  session.update (shoppingBean);
		
		
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<ShoppingBean> getshoppingType(String shoppingType) {
		String hql="FROM ShoppingBean WHERE shoppingType= :shoppingType";
		Session session = factory.getCurrentSession();
		List<ShoppingBean> list=	session.createQuery(hql)
			   .setParameter("shoppingType", shoppingType)
			   .getResultList();
		return (List<ShoppingBean>) list;
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<ShoppingBean> getALLShoppingType() {
		String hql="SELECT DISTINCT s.shoppingType FROM ShoppingBean s";
		Session session = factory.getCurrentSession();
		List<ShoppingBean> list=session.createQuery(hql)
			                           .getResultList();
		return (List<ShoppingBean>) list;
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<ShoppingBean> getAllProductsNewtoOld() {
		String hql="FROM ShoppingBean order by shoppingDate desc";
//		
		Session session=factory.getCurrentSession();
		List<ShoppingBean> list=session.createQuery(hql)
								.getResultList();		
		return list;
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<ShoppingBean> getAllProductsPriceHightoLow() {
		String hql="FROM ShoppingBean order by shoppingProductPrice desc";
//		
		Session session=factory.getCurrentSession();
		List<ShoppingBean> list=session.createQuery(hql)
								.getResultList();		
		return list;
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<ShoppingBean> getAllProductsPriceLowtoHigh() {
		String hql="FROM ShoppingBean order by shoppingProductPrice asc";
//		
		Session session=factory.getCurrentSession();
		List<ShoppingBean> list=session.createQuery(hql)
								.getResultList();		
		return list;
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<ShoppingBean> getSearchShoppingNameProductrelatio(String searchWord) {
		String hql="FROM ShoppingBean s  where s.shoppingname like :searchWord or s.productrelation like :searchWord1 ";
		Session session=factory.getCurrentSession();
		List<ShoppingBean> list=session.createQuery(hql)
				                       .setParameter("searchWord", "%"+searchWord+"%")
		                               .setParameter("searchWord1", "%"+searchWord+"%")
				                       .getResultList();
		  return list;
      }

}
