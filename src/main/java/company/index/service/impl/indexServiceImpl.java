package company.index.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import company.index.dao.indexIDao;
import company.index.model.indexBean;
import company.index.service.indexService;
@Service
public class indexServiceImpl implements indexService {
	@Autowired
	indexIDao indexIDao;
	@Transactional
	@Override
	public List<indexBean> getAllProducts() {
		
		return indexIDao.getAllProducts();
	}
	@Transactional
	@Override
	public void addindexpicture(indexBean product) {
		
		indexIDao.addindexpicture(product);
	}
	@Transactional
	@Override
	public indexBean getindexId(Integer indexId) {
		
		return indexIDao.getindexId(indexId);
	}
	@Transactional
	@Override
	public void update(indexBean indexId) {
		indexIDao.update(indexId);

	}
	@Transactional
	@Override
	public void delete(Integer indexId) {
		indexIDao.delete(indexId);

	}

}
